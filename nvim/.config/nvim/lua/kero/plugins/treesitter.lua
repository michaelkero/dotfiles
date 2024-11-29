return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
	            ensure_installed = { "c", "lua", "rust", "go", "javascript", "typescript", "markdown", "vimdoc", "c_sharp" },
                highlight = { enable = true, },
                indent = { enabled = true },
            }
        end
    },
}
