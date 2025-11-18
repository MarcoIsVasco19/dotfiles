# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration built with Lua, using lazy.nvim as the plugin manager. The configuration is organized under the `lua/marco/` namespace and follows a modular structure separating core settings, keymaps, and plugin configurations.

## Architecture

### Bootstrap and Initialization Flow

1. `init.lua` - Entry point that loads core settings and lazy.nvim
2. `lua/marco/core/` - Core Neovim settings and keymaps
3. `lua/marco/lazy.lua` - Lazy.nvim bootstrap and plugin loader
4. `lua/marco/plugins/` - Individual plugin configurations

### Module Structure

- **Core modules** (`lua/marco/core/`):
  - `init.lua` - Loads options and keymaps
  - `options.lua` - Editor settings (tabs, line numbers, clipboard, etc.)
  - `keymaps.lua` - Global keybindings (leader key: space)

- **Plugin loader** (`lua/marco/lazy.lua`):
  - Auto-installs lazy.nvim if not present
  - Imports plugins from `marco.plugins` and `marco.plugins.lsp`
  - Checker and change detection notifications disabled

- **Plugin configurations** (`lua/marco/plugins/`):
  - Each plugin has its own file returning a lazy.nvim spec
  - LSP configurations are in `lua/marco/plugins/lsp/` subdirectory

## Key Plugin Configurations

### LSP Setup (Mason + LSPConfig)

- **Mason** (`lsp/mason.lua`): Manages LSP server installations
  - Auto-installs: html, lua_ls, graphql, pyright, yamlls, puppet, bashls, ansiblels, gh_actions_ls

- **LSPConfig** (`lsp/lspconfig.lua`): Configures LSP keybindings via LspAttach autocmd
  - LSP keybindings are buffer-local and set only when LSP attaches
  - Uses Telescope for references, definitions, implementations, type definitions
  - Diagnostic icons customized in sign column

### Completion (nvim-cmp)

- **Sources order**: nvim_lsp → luasnip → buffer → path
- **Snippet engine**: LuaSnip with friendly-snippets
- **Navigation**: `<C-k>`/`<C-j>` for prev/next, `<C-Space>` to trigger, `<CR>` to confirm
- **Formatting**: lspkind provides VS Code-style pictograms

### Treesitter

- **Installed parsers**: json, javascript, tsx, yaml, html, css, prisma, markdown, svelte, bash, lua, vim, dockerfile, gitignore, c, puppet, python, go, terraform, groovy
- **Features**: syntax highlighting, indentation, autotagging, incremental selection
- **Incremental selection**: `<C-space>` to init/expand, `<bs>` to shrink

### File Navigation

- **Telescope** (`telescope.lua`):
  - `<leader>ff` - Find files in cwd
  - `<leader>fr` - Recent files
  - `<leader>fs` - Live grep in cwd
  - `<leader>fc` - Grep string under cursor
  - Uses fzf-native extension for performance

- **nvim-tree** (`nvim-tree.lua`):
  - `<leader>ee` - Toggle file explorer
  - `<leader>ef` - Toggle explorer on current file
  - `<leader>ec` - Collapse explorer
  - `<leader>er` - Refresh explorer
  - Width: 35, relative numbers enabled, shows gitignored files

### Git Integration (Gitsigns)

- **Hunk navigation**: `]h` next, `[h` previous
- **Hunk actions**: `<leader>hs` stage, `<leader>hr` reset, `<leader>hp` preview
- **Buffer actions**: `<leader>hS` stage buffer, `<leader>hR` reset buffer
- **Blame**: `<leader>hb` full blame, `<leader>hB` toggle line blame
- **Diff**: `<leader>hd` diff this, `<leader>hD` diff against ~

### Session Management (auto-session)

- **Auto-restore**: Disabled by default
- `<leader>wr` - Restore session for cwd
- `<leader>ws` - Save session
- Suppressed directories: ~/, ~/Dev/, ~/Downloads, ~/Documents, ~/Desktop/

## Core Settings

### Editor Preferences
- **Tabs/Indentation**: 2 spaces, expandtab, autoindent
- **Line numbers**: Relative with absolute on cursor line
- **Line wrapping**: Disabled
- **Search**: Ignore case by default, smart case when mixed case used
- **Clipboard**: Synced with system clipboard (`unnamedplus`)
- **Splits**: Open right (vertical) and below (horizontal)
- **Swap files**: Disabled

### Global Keymaps

**Leader key**: Space

**General**:
- `jk` - Exit insert mode
- `<leader>nh` - Clear search highlights
- `<leader>+` / `<leader>-` - Increment/decrement number

**Window management**:
- `<leader>sv` / `<leader>sh` - Split vertically/horizontally
- `<leader>se` - Make splits equal size
- `<leader>sx` - Close current split

**Tab management**:
- `<leader>to` - Open new tab
- `<leader>tx` - Close current tab
- `<leader>tn` / `<leader>tp` - Next/previous tab
- `<leader>tf` - Open current buffer in new tab

**LSP keymaps** (buffer-local, available when LSP attached):
- `gR` - Show references (Telescope)
- `gD` - Go to declaration
- `gd` - Show definitions (Telescope)
- `gi` - Show implementations (Telescope)
- `gt` - Show type definitions (Telescope)
- `<leader>ca` - Code actions
- `<leader>rn` - Smart rename
- `<leader>D` - Buffer diagnostics
- `<leader>d` - Line diagnostics
- `[d` / `]d` - Previous/next diagnostic
- `K` - Hover documentation
- `<leader>rs` - Restart LSP

## Plugin Management

### Adding New Plugins

1. Create a new file in `lua/marco/plugins/` (or `lua/marco/plugins/lsp/` for LSP-related)
2. Return a lazy.nvim plugin spec table
3. Include dependencies, config function, and keymaps as needed
4. Lazy.nvim auto-discovers and loads the plugin

### Updating Plugins

- Lazy.nvim checker runs automatically but notifications are disabled
- Use `:Lazy` command to open the lazy.nvim UI for manual updates

## Configuration Files

- `.neoconf.json` - Neodev and lua_ls configuration for Neovim Lua development
- `lazy-lock.json` - Plugin version lock file managed by lazy.nvim
