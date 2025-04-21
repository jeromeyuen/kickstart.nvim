-- Keybindings / Remapping

-- General aliases
local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set -- Shorten function name

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c"

-- Normal --
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true, desc = 'Remove Functionality of Space' })
keymap('n', '<leader>ww', '<cmd>up<cr>', { noremap = true, silent = true, desc = 'Saves file' }) -- Saves file
keymap('n', '<leader>fs', '<cmd>up<cr>', { noremap = true, silent = true, desc = 'Saves file' }) -- Saves file (Doom Emacs way)
keymap('n', '<leader>a', '<cmd>keepjumps normal! ggVG<cr>', { noremap = true, silent = true, desc = 'Select all text in current buffer' }) -- Select all text in current buffer
-- keymap('n', '<leader>s', '<cmd>so %<cr>', { noremap = true, silent = true, desc = 'Sources current file' }) -- Sources current file

-- The following places have remaps as well:
--	stdpath("config")\after\plugin\LuaSnip.lua
--	stdpath("config")\after\plugin\comment.lua
--	stdpath("config")\after\plugin\icon-picker.lua
--	stdpath("config")\after\plugin\lazygit-nvim.lua
--	stdpath("config")\after\plugin\leap.lua
--	stdpath("config")\after\plugin\lspconfig.lua
--	stdpath("config")\after\plugin\nvim-surround.lua
--	stdpath("config")\after\plugin\oil.lua
--	stdpath("config")\after\plugin\telescope.lua
--	stdpath("config")\after\plugin\true-zen.lua
--	stdpath("config")\after\plugin\undotree.lua
--	stdpath("config")\after\plugin\yanky-nvim.lua

--[[
Pane navigation within Windows Terminal:
	Creating new panes
		: ALT + SHIFT + D - splits along longest axis of current pane
		: ALT + SHIFT + '+' - splits vertically
		: ALT + SHIFT + 'i' - splits horizontally
	Closing panes
		: type "exit" into terminal
	Jumping around panes
		: ALT + <arrow key> - jumps in <arrow key>'s direction
	Sizing panes
		: ALT + SHIFT + <arrow key> - resizes pane in <arrow key>'s direction
	Font size (also changes for nvim)
		: CTRL + "+"/"-" - Increases/Decreases font size respectively
	Copy and Paste
		: CTRL + SHIFT + "C"/"V" - CTRL + "C"/"V" works too but CTRL + "C" may terminate some applications
--]]

-- Better nvim window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
-- Also for nvim window navigation, due to habits from Doom Emacs
keymap('n', '<leader>wh', '<C-w>h', opts)
keymap('n', '<leader>wj', '<C-w>j', opts)
keymap('n', '<leader>wk', '<C-w>k', opts)
keymap('n', '<leader>wl', '<C-w>l', opts)
keymap('n', '<leader>wH', '<C-w>H', opts)
keymap('n', '<leader>wJ', '<C-w>J', opts)
keymap('n', '<leader>wK', '<C-w>K', opts)
keymap('n', '<leader>wL', '<C-w>L', opts)
keymap('n', '<leader>wo', '<C-w>o', opts) -- Maximizes current buffer

-- Resize nvim windows with arrows
keymap('n', '<C-Up>', ':resize +2<CR>', opts)
keymap('n', '<C-Down>', ':resize -2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Open split buffers
keymap('n', '<leader>ws', '<CMD>split<CR>', opts) -- Make a horizontal window split
keymap('n', '<leader>wv', '<CMD>vsplit<CR>', opts) -- Make a vertical window split

-- Close (kill) buffers
keymap('n', '<leader>bk', '<CMD>bdelete<CR>', opts) -- Delete buffer

-- Close the current window
keymap('n', '<leader>wd', '<CMD>close<CR>', opts) -- Close current window (also C-w c)

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Visual Block --
-- Move text up and down
keymap('x', 'J', ":move '>+1<CR>gv-gv", opts)
keymap('x', 'K', ":move '<-2<CR>gv-gv", opts)

-- Insert --
-- Create undo-breakpoints for deletions
keymap('i', '<C-u>', '<C-g>u<C-u>', opts) -- Deletion to beginning of line
keymap('i', '<C-w>', '<C-g>u<C-w>', opts) -- Word deletions

-- Emacs inspired line editing shortcuts
keymap('i', '<C-a>', '<Home>', opts) -- Move to beginning of line in insert mode
keymap('i', '<C-b>', '<Left>', opts) -- Move one character left in insert mode
keymap('i', '<C-e>', '<End>', opts) -- Move to end of line in insert mode
keymap('i', '<C-f>', '<Right>', opts) -- Move one character right in insert mode
