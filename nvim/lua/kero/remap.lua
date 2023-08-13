vim.g.mapleader = " "

-- tabs
vim.keymap.set("n", "<leader>tc", ':tabclose<CR>', {noremap = true})
vim.keymap.set("n", "<leader>tn", ':tabnew<CR>', {noremap = true})
vim.keymap.set("n", "<leader>to", ':tabonly<CR>', {noremap = true})
vim.keymap.set("n", "<leader>tm", ':tabmove<Space>', {noremap = true})
vim.keymap.set("n", "<leader>1", '1gt', {noremap = true})
vim.keymap.set("n", "<leader>2", '2gt', {noremap = true})
vim.keymap.set("n", "<leader>3", '3gt', {noremap = true})
vim.keymap.set("n", "<leader>4", '4gt', {noremap = true})
vim.keymap.set("n", "<leader>5", '5gt', {noremap = true})
vim.keymap.set("n", "<leader>6", '6gt', {noremap = true})
vim.keymap.set("n", "<leader>7", '7gt', {noremap = true})
vim.keymap.set("n", "<leader>8", '8gt', {noremap = true})
vim.keymap.set("n", "<leader>9", '9gt', {noremap = true})
vim.keymap.set("n", "<leader>10", '10gt', {noremap = true})

-- windows
vim.keymap.set("n", "<leader>wh", '<C-w>h', {noremap = true})
vim.keymap.set("n", "<leader>wj", '<C-w>j', {noremap = true})
vim.keymap.set("n", "<leader>wk", '<C-w>k', {noremap = true})
vim.keymap.set("n", "<leader>wl", '<C-w>l', {noremap = true})
vim.keymap.set("n", "WH", '20<C-w>>', {noremap = true})
vim.keymap.set("n", "WJ", '20<C-w>-', {noremap = true})
vim.keymap.set("n", "WK", '20<C-w>+', {noremap = true})
vim.keymap.set("n", "WL", '20<C-w><', {noremap = true})
vim.keymap.set("n", "<leader>wsh", '<C-w>>', {noremap = true})
vim.keymap.set("n", "<leader>wsl", '<C-w><', {noremap = true})
vim.keymap.set("n", "<leader>ws", ':vs<CR>', {noremap = true})
vim.keymap.set("n", "<leader>wc", ':q<CR>', {noremap = true})

-- Let 'tl' toggle between this and the last accessed tab
-- vim.g.lasttab = 1
-- vim.keymap.set("n", "<leader>tl", ':exe "tabn "', {noremap = true})
-- nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
-- au TabLeave * let g:lasttab = tabpagenr()

vim.keymap.set("n", "<leader>fj", ":%!jq .<CR>", {noremap = true}) -- formats json to make things nice and tidy
vim.keymap.set("n", "<leader>cj", ":.!quicktype -l go --just-types<CR>", {noremap = true})
vim.keymap.set("n", "<leader>cj", ":.!quicktype -l go --just-types --top-level ", {noremap = true})

