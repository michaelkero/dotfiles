return {
    {
        "tpope/vim-fugitive",
        keys = {
            {
                "<leader>gg",
                "<cmd>Git<cr>",
                desc = "Git Status"
            },
            {
                "<leader>gb",
                "<cmd>Git blame<cr>",
                desc = "Git Blame"
            },
            {
                "<leader>gd",
                "<cmd>Gvdiffsplit<cr>",
                desc = "Git Diff"
            },
        }
    }
}

