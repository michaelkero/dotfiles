return {
    "sho-87/kanagawa-paper.nvim",
    -- 'AlexvZyl/nordic.nvim',
    -- 'rose-pine/neovim',
    -- "catppuccin/nvim", 
    priority = 1000,
    config = function ()
        vim.cmd.colorscheme("kanagawa-paper")
        -- vim.cmd.colorscheme("nordic")
        -- vim.cmd.colorscheme("rose-pine")
        -- vim.cmd.colorscheme("catppuccin-macchiato")

        vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
        vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
    end
}

