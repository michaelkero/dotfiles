return {
    'nvim-pack/nvim-spectre',
    config = function ()
        vim.keymap.set('n', '<leader>ss', '<cmd>lua require("spectre").open()<CR>', {
            desc = "Open Spectre"
        })
        vim.keymap.set('n', '<leader>stw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
            desc = "Search current under cursor word"
        })
        vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
            desc = "Search word"
        })
        vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
            desc = "Search on current file"
        })
    end
}
