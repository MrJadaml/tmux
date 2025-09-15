# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a tmux configuration repository that includes custom scripts for managing tmux sessions and windows for development workflows.

## Key Components

### Configuration Architecture

- **tmux.conf**: Main tmux configuration file that sets up:
  - Prefix key changed from C-b to C-a
  - Vi-style key bindings for copy mode
  - Mouse support enabled
  - Base index set to 1 for windows and panes
  - TPM (Tmux Plugin Manager) for plugin management
  - Catppuccin theme for styling
  - Integration with vim-tmux-navigator for seamless navigation

### Session Management Scripts

- **start.sh**: Creates and configures multiple development sessions:
  - "Heard" session: Work environment with API and APP windows
  - "Jadam" session: Personal project environment
  - "Config" session: Configuration management with Tmux, Neo (Neovim), and ZMK windows
  - "Notes" session: Note-taking environment
  - Each window is pre-configured with specific pane layouts and directory navigation

- **wtree**: Dynamic script for creating git worktrees with tmux windows
  - Accepts worktree name and optional branch name
  - Creates worktree as sibling directory to current repo
  - Sets up tmux window with vim, dev server, and terminal panes
  - Automatically detects and uses current tmux session or defaults to "Heard"
  - Handles npm dependencies automatically

- **wtree-window.sh**: Legacy helper script for creating additional APP windows in the Heard session

### Plugin System

Uses TPM (Tmux Plugin Manager) with the following plugins:
- tmux-sensible: Sensible tmux defaults
- tmux-yank: System clipboard integration
- vim-tmux-navigator: Seamless navigation between vim and tmux panes
- catppuccin-tmux: Catppuccin color theme

## Common Commands

```bash
# Reload tmux configuration
# Press: C-a r

# Install new plugins (after adding to tmux.conf)
# Press: C-a I

# Update all plugins
# Press: C-a U

# Start all development sessions
./start.sh

# Create a new git worktree with tmux window
./wtree <worktree-name> [branch-name]
# Example: ./wtree feature-xyz new-feature-branch
# - Creates git worktree as sibling directory
# - Sets up tmux window with 3 panes (vim, dev server, terminal)
# - Automatically runs npm install and npm run dev if package.json exists

# Create additional work window (legacy)
./wtree-window.sh

# Navigate between vim and tmux panes
# Use: C-h/j/k/l (vim-tmux-navigator integration)

# Copy mode with vi bindings
# Press: C-a [ (enter copy mode)
# Use vi movements, press y to copy to system clipboard

# To make wtree globally available:
# sudo ln -sf /Users/johnlichty/.config/tmux/wtree /usr/local/bin/wtree
```

## Development Workflow

The configuration is optimized for a multi-project development workflow:
1. Sessions are organized by context (Work, Personal, Config, Notes)
2. Each window within a session represents a specific project or component
3. Panes are pre-configured with editor (vim) and terminal splits
4. Automatic directory navigation and application startup (npm run dev)

## Important Notes

- Scripts assume specific directory structures (~/code/, ~/Notes/, etc.)
- Vim with NvimTreeToggle is launched automatically in editor panes
- System clipboard integration requires xclip on Linux systems