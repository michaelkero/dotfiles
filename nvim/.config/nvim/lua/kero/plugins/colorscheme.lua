return {
    'AlexvZyl/nordic.nvim',
    -- 'rose-pine/neovim',
    -- name = 'rose-pine',
    -- "catppuccin/nvim", 
    -- name = "catppuccin", 
    priority = 1000,
    config = function ()
        -- vim.cmd.colorscheme("catppuccin-macchiato")
        vim.cmd.colorscheme("nordic")
        vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
        vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
    end
}

