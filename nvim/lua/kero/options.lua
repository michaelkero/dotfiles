local options = {
	number = true,                           -- set numbered lines
	relativenumber = true,                   -- set relative numbered lines

	numberwidth = 4,                         -- set number column width {default 4}

	tabstop = 4,                             -- insert 4 spaces for a tab
	softtabstop = 4,                         -- do it again!
	shiftwidth= 4,                           -- the number of spaces inserted for each indentation
	expandtab = true,                        -- convert tabs to spaces

	smartindent = true,                      -- make indenting smarter again

	wrap = false,                             -- display lines as one long line
	linebreak = true,                        -- companion to wrap, don't split words

	swapfile = false,                        -- creates a swapfile
	backup = false,                          -- creates a backup file
	undofile = true,                         -- enable persistent undo

	hlsearch = true,                         -- highlight all matches on previous search pattern
	incsearch = true,                        -- moving the highlight as you type

	termguicolors = true,                    -- set term gui colors (most terminals support this)

    scrolloff = 8,                           -- minimal number of screen lines to keep above and below the cursor
	sidescrolloff = 8,                       -- minimal number of screen columns either side of cursor if wrap is `false`
	signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time

	updatetime = 300,                         -- faster completion (4000ms default)

	-- colorcolumn = "80",                        -- highlight the column at position
	cursorline = true,                       -- highlight the current line


	-- clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
	cmdheight = 2,                           -- more space in the neovim command line for displaying messages
	conceallevel = 0,                        -- so that `` is visible in markdown files
	fileencoding = "utf-8",                  -- the encoding written to a file

	ignorecase = true,                       -- ignore case in search patterns
	smartcase = true,                        -- smart case
	mouse = "a",                             -- allow the mouse to be used in neovim
	pumheight = 10,                          -- pop up menu height
	-- showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2,                         -- always show tabs

	splitbelow = true,                       -- force all horizontal splits to go below current window
	splitright = true,                       -- force all vertical splits to go to the right of current window

	timeoutlen = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)
	writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	whichwrap = "bs<>[]hl",                  -- which "horizontal" keys are allowed to travel to prev/next line
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
