return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        ensure_installed = {
            "bash",
            "c",
            "cpp",
            "go",
            "lua",
            "markdown",
            "python",
            "rust",
        },
        auto_install = true,
        sync_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<CR>",
                node_incremental = "<CR>",
                scope_incremental = "<TAB>",
                node_decremental = "<S-TAB>",
            },
        },
    },
}
