# dotfiles

Personal configuration files for bash and Neovim.

## Contents

- **Shell configuration** - `.bashrc` and `.bash_profile` with custom aliases and tool integrations
- **Neovim configuration** - Lua-based setup with lazy.nvim plugin manager

## Installation

### Prerequisites

**Shell dependencies:**
- `starship` - Cross-shell prompt
- `direnv` - Directory-based environment management
- `asdf` - Version manager for multiple languages/tools
- `~/.git-prompt.sh` - Git prompt integration

**Neovim:**
- Neovim 0.9+ (for Lua configuration support)

### Install dotfiles

1. Clone this repository:
   ```bash
   git clone <repository-url> ~/repos/personal/dotfiles
   cd ~/repos/personal/dotfiles
   ```

2. Run the installation script:
   ```bash
   ./install.sh
   ```

   This will:
   - Create symlinks from your home directory to the dotfiles repository
   - Back up any existing configuration files to `*.backup`
   - Allow you to edit files in the repo and have changes immediately reflected

3. Restart your shell or source the bash configuration:
   ```bash
   source ~/.bashrc
   ```

4. Open Neovim - lazy.nvim will automatically install all plugins on first launch.

### Uninstall

To remove the symlinks and restore your original configuration:

```bash
./uninstall.sh
```

## Key Features

### Bash Configuration

- **Aliases**: Quick shortcuts for common tools (terraform, kubectl, docker, etc.)
- **Kubernetes**: Auto-merges multiple kubeconfigs
- **Prompt**: Git-aware prompt with starship
- **Completions**: Bash completion for kubectl, terraform, terragrunt, and more

### Neovim Configuration

- **Plugin Manager**: lazy.nvim with auto-installation
- **LSP Support**: Mason + nvim-lspconfig for language servers
- **Completion**: nvim-cmp with LuaSnip snippets
- **File Navigation**: Telescope fuzzy finder + nvim-tree file explorer
- **Git Integration**: Gitsigns for inline git operations
- **Session Management**: Auto-session for workspace persistence
- **Leader Key**: Space

See [CLAUDE.md](./CLAUDE.md) for detailed configuration documentation.

## Repository Structure

```
.
├── install.sh           # Installation script (creates symlinks)
├── uninstall.sh         # Uninstallation script (removes symlinks)
├── .bashrc              # Main bash configuration
├── .bash_profile        # macOS-specific bash setup
└── .config/
    └── nvim/            # Neovim configuration
        ├── init.lua     # Entry point
        └── lua/marco/   # Configuration namespace
            ├── core/    # Core settings and keymaps
            ├── lazy.lua # Plugin manager bootstrap
            └── plugins/ # Plugin configurations
```

## Making Changes

After installation, all files are symlinked. Edit files in the repository and changes take effect immediately:

- **Bash changes**: Run `source ~/.bashrc` or restart your shell
- **Neovim changes**: Restart Neovim or run `:source ~/.config/nvim/init.lua`

## Syncing Across Machines

1. Push changes from one machine:
   ```bash
   cd ~/repos/personal/dotfiles
   git add .
   git commit -m "Update configuration"
   git push
   ```

2. Pull on another machine:
   ```bash
   cd ~/repos/personal/dotfiles
   git pull
   ```

Changes are immediately available since configurations are symlinked.
