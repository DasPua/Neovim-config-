# Neovim Configuration

This is my personal Neovim configuration, primarily tailored for **competitive programming in C++** and development in **Python, Rust, and C++**.

The configuration is heavily inspired by **LazyVim** in terms of structure and theming, with numerous custom keymaps, plugins, and utility functions added over time.

> **Note:** This configuration is under active development. Since I've customized it extensively, you may occasionally encounter visual glitches, broken features, or plugin incompatibilities. While I use it daily, I can't guarantee that every feature will work perfectly in every setup.

<p align="center">
  <img alt="image" src="https://github.com/user-attachments/assets/0380dfce-cda1-4fbe-8e05-7503b6a9153a" width="300" />
  <img alt="image" src="https://github.com/user-attachments/assets/23e8018f-c591-4f26-a13f-2f0b9a64150e" width="300" />
  <img alt="image" src="https://github.com/user-attachments/assets/7ab76177-b9aa-4a33-884a-8f9868d6d0cf" width="300" />
</p>

## File Structure
``` text
.
├── init.lua
├── lazy-lock.json
├── lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── globals.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   ├── overseer
│   │   └── template
│   │       └── user
│   │           └── cpp_build.lua
│   ├── plugins
│   │   ├── blink.lua
│   │   ├── comment.lua
│   │   ├── conform.lua
│   │   ├── gitsigns-nvim.lua
│   │   ├── lualine.lua
│   │   ├── mini-nvim.lua
│   │   ├── noice.lua
│   │   ├── nvim-bqf.lua
│   │   ├── nvim-dapui.lua
│   │   ├── nvim-lspconfig.lua
│   │   ├── nvim-tmux-navigator.lua
│   │   ├── nvim-tree.lua
│   │   ├── nvim-treesitter.lua
│   │   ├── overseer.lua
│   │   ├── quicker.lua
│   │   ├── rustace-nvim.lua
│   │   ├── screenkey.lua
│   │   ├── snacks.lua
│   │   ├── telescope-nvim.lua
│   │   ├── theme.lua
│   │   ├── trouble.lua
│   │   ├── undotree.lua
│   │   └── whichkey.lua
│   ├── servers
│   │   ├── clangd.lua
│   │   ├── init.lua
│   │   ├── lua_ls.lua
│   │   └── pyright.lua
│   └── utils
│       ├── diagnostics.lua
│       └── lsp.lua

```
