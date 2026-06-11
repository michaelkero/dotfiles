return {
    {
        "hrsh7th/cmp-nvim-lsp"
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-emoji',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()
            local function border(hl_name)
                return {
                    { '╭', hl_name },
                    { '─', hl_name },
                    { '╮', hl_name },
                    { '│', hl_name },
                    { '╯', hl_name },
                    { '─', hl_name },
                    { '╰', hl_name },
                    { '│', hl_name },
                }
            end
            vim.api.nvim_set_hl(0, 'CmpBorder', { fg = '#c23127', bg = '#11151c' })

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = {
                        col_offset = -3,
                        side_padding = 0,
                        border = border 'CmpBorder',
                    },
                    documentation = {
                        border = border 'CmpBorder',
                    },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = 'emoji' },
                    { name = 'path' },
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
}
