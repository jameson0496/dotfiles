local opts = {
    noremap = true,
    silent = true,
}

-- Use `:h vim.keymap.set()` for help

-----------------
-- Normal Mode --
-----------------

-- Remaps Ctrl-W direction to just Ctrl-direction for moving between windows
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Maps Ctrl+Arrow Key
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

vim.keymap.set('n', '<leader>vs', ':vertical split<CR>', opts)
vim.keymap.set('n', '<leader>sp', ':split<CR>', opts)

vim.keymap.set('n', '<leader>te', ':term<CR>i', opts)
vim.keymap.set('n', '<leader>tv', ':vertical split<CR>:term<CR>i', opts)
vim.keymap.set('n', '<leader>ts', ':split<CR> :term<CR>i', opts)

-------------------
-- Terminal Mode --
-------------------

vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', opts)
vim.api.nvim_set_keymap('t', '<C-w>', '<C-\\><C-n><C-w>', opts)
