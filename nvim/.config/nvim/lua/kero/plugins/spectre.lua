return {
    'nvim-pack/nvim-spectre',
    keys = {
        {
            '<leader>ss',
            '<cmd>lua require("spectre").open()<CR>',
            desc = "Open Spectre"
        },
        {
            '<leader>stw',
            '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
            desc = "Search current under cursor word"
        },
        {
            '<leader>sw',
            '<esc><cmd>lua require("spectre").open_visual()<CR>',
            desc = "Search word"
        },
        {
            '<leader>sp',
            '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
            desc = "Search on current file"
        }
    }
}
