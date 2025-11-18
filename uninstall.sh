#!/usr/bin/env bash

# Dotfiles uninstallation script
# This script removes symlinks and restores backups

set -e

echo "Uninstalling dotfiles..."
echo ""

# Function to remove symlink and restore backup
remove_symlink() {
    local target="$1"

    if [ -L "$target" ]; then
        echo "  Removing symlink: $target"
        rm "$target"

        # Restore backup if it exists
        if [ -e "$target.backup" ]; then
            echo "  Restoring backup: $target.backup -> $target"
            mv "$target.backup" "$target"
        fi
        echo "  ✓ Removed: $target"
    else
        echo "  ⊘ Not a symlink: $target (skipping)"
    fi
}

echo "Removing symlinks..."
echo ""

# Bash configuration files
echo "Bash configuration:"
remove_symlink "$HOME/.bashrc"
remove_symlink "$HOME/.bash_profile"
echo ""

# Neovim configuration
echo "Neovim configuration:"
remove_symlink "$HOME/.config/nvim"
echo ""

echo "Uninstallation complete!"
