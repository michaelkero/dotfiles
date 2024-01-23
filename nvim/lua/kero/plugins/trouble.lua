return {
    {
        "folke/trouble.nvim",
        config = function ()
            vim.keymap.set('n', '<leader>t', ':Trouble<CR>', {})
            vim.keymap.set('n', '<leader>tt', ':TroubleToggle<CR>', {})
        end
    }
}
