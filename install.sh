for ASPECT in aspects/*/; do
    if [ -d "$ASPECT" ]; then
        echo "Installing $ASPECT"
        cd "$ASPECT"
        ./install.sh
        cd ../..
    fi
done

# Use ssh url instead of https
git remote set-url origin git@github.com:andrephilipsson/dotfiles.git
