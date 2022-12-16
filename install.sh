for ASPECT in aspects/*/; do
    if [ -d "$ASPECT" ]; then
        echo "Installing $ASPECT"
        cd "$ASPECT"
        ./install.sh
        cd ../..
    fi
done
