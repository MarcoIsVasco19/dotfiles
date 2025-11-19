#!/usr/bin/env bash

# Dotfiles installation script
# This script creates symlinks from the home directory to the dotfiles repository
#
# Usage:
#   ./install.sh           # Install Neovim config only
#   ./install.sh --bash    # Install Neovim config + bash profiles

set -e

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Parse command line arguments
INSTALL_BASH=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --bash)
            INSTALL_BASH=true
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

echo "Installing dotfiles from: $DOTFILES_DIR"
echo ""

# Function to create symlink with backup
create_symlink() {
    local source="$1"
    local target="$2"

    # If target exists and is not a symlink, back it up
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "  Backing up existing $target to $target.backup"
        mv "$target" "$target.backup"
    fi

    # Remove existing symlink if it exists
    if [ -L "$target" ]; then
        rm "$target"
    fi

    # Create parent directory if it doesn't exist
    mkdir -p "$(dirname "$target")"

    # Create symlink
    ln -s "$source" "$target"
    echo "  ✓ Linked: $target -> $source"
}

echo "Setting up symlinks..."
echo ""

# Bash configuration files (optional)
if [ "$INSTALL_BASH" = true ]; then
    echo "Bash configuration:"
    create_symlink "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
    create_symlink "$DOTFILES_DIR/.bash_profile" "$HOME/.bash_profile"
    echo ""
fi

# Neovim configuration
echo "Neovim configuration:"
create_symlink "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
echo ""

echo "Installation complete!"
echo ""

if [ "$INSTALL_BASH" = true ]; then
    echo "Note: You may need to restart your shell or run 'source ~/.bashrc' for bash changes to take effect."
    echo "For Neovim, just restart the editor."
else
    echo "Note: Bash configuration was skipped. Use './install.sh --bash' to install bash configs."
    echo "For Neovim, just restart the editor."
fi
