return {
    "nvim-treesitter/nvim-treesitter",

    lazy = false,

    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup({
            indent = {
                enable = true,
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil,
            },
            ensure_installed = {
                "markdown",
                "vimdoc",
                "vim",
                "json",
                "toml",
                "yaml",
                "bash",
                "lua",
                "gitignore",
                "python",
                "rust",
            },
            auto_install = true,
        })
    end,
}
