function fish_prompt
    set -l last_status $status
    set -l is_root (test (id -u) -eq 0)

    set -l dir_color (set_color -o blue)
    set -l user_prompt_color (test $is_root; and echo (set_color -o yellow); or echo (set_color -o red))
    set -l status_indicator_color (set_color -o yellow)
    set -l reset_color (set_color normal)

    set -l nested_prompt
    test $is_root; and set nested_prompt "$user_prompt_color""root"
    set -l lvl $SHLVL
    test "$TMUX" != ""; and set lvl (math $lvl - 1)
    for i in (seq 1 $lvl)
        set nested_prompt "$nested_prompt❯"
    end

    set -l cwd $dir_color(basename (prompt_pwd))
    test $last_status -ne 0; and set cwd "$cwd$status_indicator_color!"
    jobs -q; and set cwd "$cwd$status_indicator_color*"

    echo -n -s $cwd " " $user_prompt_color$nested_prompt " " $reset_color
end

function fish_right_prompt
    if not set -q -g __fish_arrow_functions_defined
        set -g __fish_arrow_functions_defined

        function _git_branch_name
            set -l branch (git symbolic-ref --quiet HEAD 2>/dev/null)
            if set -q branch[1]
                echo (string replace -r '^refs/heads/' '' $branch)
            else
                echo (git rev-parse --short HEAD 2>/dev/null)
            end
        end

        function _get_git_status
            set -l changes 0
            not git diff --cached --quiet; and set changes 1
            if not git diff --no-ext-diff --quiet; or count (git ls-files --others --exclude-standard) >/dev/null
                set changes 2
            end
            echo $changes
        end

        function _is_git_repo
            type -q git; and git rev-parse --git-dir >/dev/null 2>&1
        end
    end

    set -l branch_color (set_color white)
    set -l warning_color (set_color -o red)
    set -l success_color (set_color -o green)
    set -l secondary_color (set_color brblack)
    set -l reset_color (set_color normal)

    set -l full_path $secondary_color(string replace -r "^$HOME" "~" (pwd))

    set -l repo_info ""
    if _is_git_repo
        set -l branch $branch_color(_git_branch_name)
        set repo_info "$branch_color [$branch"

        switch (_get_git_status)
            case 1
                set repo_info "$repo_info$success_color ●"
            case 2
                set repo_info "$repo_info$warning_color ✗"
        end

        set repo_info "$repo_info$branch_color] "
    end

    set -l flox_info ""
    if set -q FLOX_PROMPT_ENVIRONMENTS[1]
        test -n "$FLOX_PROMPT_ENVIRONMENTS"
        and set flox_info "$secondary_color ($FLOX_PROMPT_ENVIRONMENTS)"
    end

    echo -n -s $repo_info $full_path $flox_info $reset_color
end
