#!/usr/bin/env bash

# Dotfiles uninstallation script
# This script removes symlinks and restores backups
#
# Usage:
#   ./uninstall.sh           # Uninstall Neovim config only
#   ./uninstall.sh --bash    # Uninstall Neovim config + bash profiles

set -e

# Parse command line arguments
UNINSTALL_BASH=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --bash)
            UNINSTALL_BASH=true
            shift
            ;;
        -h|--help)
            echo "Usage: $0 [--bash] [--help]"
            echo ""
            echo "Options:"
            echo "  --bash    Include bash configuration files (.bashrc, .bash_profile)"
            echo "  --help    Show this help message"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done

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

# Bash configuration files (optional)
if [ "$UNINSTALL_BASH" = true ]; then
    echo "Bash configuration:"
    remove_symlink "$HOME/.bashrc"
    remove_symlink "$HOME/.bash_profile"
    echo ""
fi

# Neovim configuration
echo "Neovim configuration:"
remove_symlink "$HOME/.config/nvim"
echo ""

echo "Uninstallation complete!"

if [ "$UNINSTALL_BASH" = false ]; then
    echo ""
    echo "Note: Bash configuration was skipped. Use './uninstall.sh --bash' to uninstall bash configs."
fi
