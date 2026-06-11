return {
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function ()
            require('telescope').setup {
                file_ignore_patterns = { ".git/.*", "node%_modules/.*" }
            }
            -- finding
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', ':Telescope find_files hidden=true<CR>', {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
            vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})
            vim.keymap.set('n', '<leader>fw', function()
                local region = vim.fn.getregion(vim.fn.getpos('v'), vim.fn.getpos('.'), {
                    type = 'v',
                    exclusive = false,
                    eol = false,
                })
                builtin.grep_string({ default_text = region });
            end)
            vim.keymap.set('n', '<leader>fs', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end)
            --lsp stuff
            vim.keymap.set('n', '<leader>lds', builtin.lsp_document_symbols, {})
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        config = function ()
            local telescope = require("telescope")
            telescope.setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                            -- even more opts
                            --
                        }
                    }
                }
            }
            telescope.load_extension("ui-select")
        end
    },
}

