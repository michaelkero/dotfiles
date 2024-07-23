return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require('nvim-treesitter').setup({
            highglight = { enabled = true },
            indent = { enabled = true },
        })
    end
}
