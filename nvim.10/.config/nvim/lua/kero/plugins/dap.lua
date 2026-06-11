return {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'williamboman/mason.nvim',
            'jay-babu/mason-nvim-dap.nvim',
            'nvim-neotest/nvim-nio',
            -- Add debuggers here
            --'leoluz/nvim-dap-go',
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            -- .NET
            dap.adapters.coreclr = {
                type = 'executable',
                command = '/home/kero/.config/netcoredbg/netcoredbg',
                args = { '--interpreter=vscode' }
            }

            dapui.setup({
                icons = { expanded = "▾", collapsed = "▸" },
                mappings = {
                    -- Use a table to apply multiple mappings
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    edit = "e",
                    repl = "r",
                },
                sidebar = {
                    elements = {
                        -- You can change the order of elements in the sidebar
                        "locals",
                        "scopes",
                        "breakpoints",
                        "stacks",
                        "watches",
                    },
                    size = 40,
                    position = "left", -- Can be "left" or "right"
                },
                tray = {
                    elements = { "repl" },
                    size = 10,
                    position = "bottom", -- Can be "bottom" or "top"
                },
                floating = {
                    max_height = nil, -- These can be integers or a float between 0 and 1.
                    max_width = nil,  -- Floats will be treated as percentage of your screen.
                    mappings = {
                        close = { "q", "<Esc>" },
                    },
                },
                windows = { indent = 1 },
            })

            vim.keymap.set("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>")
            vim.keymap.set("n", "<leader>dc", ":lua require('dap').continue()<CR>")
            vim.keymap.set("n", "<leader>dt", ":lua require('dap').terminate()<CR>")
            vim.keymap.set("n", "<leader>ds", ":lua require('dap').step_over()<CR>")
            vim.keymap.set("n", "<leader>di", ":lua require('dap').step_into()<CR>")
            vim.keymap.set("n", "<leader>do", ":lua require('dap').step_out()<CR>")
            vim.keymap.set("n", "<leader>dn", ":lua require('dap').run_to_cursor()<CR>")
            vim.keymap.set("n", "<leader>dr", ":lua require('dap').repl.open()<CR>")
            vim.keymap.set("n", "<leader>dl", ":lua require('dap').run_last()<CR>")
            vim.keymap.set("n", "<leader>df", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
            vim.keymap.set("n", "<leader>du", ":lua require('dap').up()<CR>")
            vim.keymap.set("n", "<leader>dd", ":lua require('dap').down()<CR>")
            vim.keymap.set("n", "<leader>de", ":lua require('dap').eval()<CR>")

            vim.keymap.set("n", "<leader>td", ":lua require('dap-go').debug_test()<CR>")
        end
    },
    {
        'theHamsta/nvim-dap-virtual-text',
    },
    {
        'nvim-telescope/telescope-dap.nvim',
    },
}
