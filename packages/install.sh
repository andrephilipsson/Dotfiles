# nix-shell -p nixUnstable --command "nix build --experimental-features 'nix-command flakes' '.#$1'" && ./result/activate
nix-shell -p nixUnstable --command "nix build --experimental-features 'nix-command flakes' '.#nixos-desktop'" && ./result/activate
