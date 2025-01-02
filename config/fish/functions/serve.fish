# Usage: serve [--directory DIRECTORY] [PORT]
#
# Defaults to port 8000, current directory (ie. will use index.html if present).
function serve
    if command -v python3 >/dev/null 2>&1
        python3 -m http.server $argv
    else
        python -m SimpleHTTPServer $argv; or python -m http.server $argv
    end
end
