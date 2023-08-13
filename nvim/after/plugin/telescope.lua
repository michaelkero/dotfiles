local builtin = require('telescope.builtin')
local telescope = require('telescope')
telescope.setup{
    file_ignore_patterns = { "node%_modules/.*" }
}

-- finding
vim.keymap.set('n', '<leader>ff', ':Telescope find_files hidden=true<CR>', {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- dap
telescope.load_extension('dap')


