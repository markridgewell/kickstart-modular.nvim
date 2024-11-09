-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Delete the 's' command because a lot of useful commands start with 's'.
-- 's' is an alias of 'cl' anyway.
vim.keymap.set('n', 's', '<Nop>')

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Show/hide the gutter
vim.keymap.set('n', '<leader><Left>', function()
  vim.opt.number = false
  vim.opt.relativenumber = false
  vim.opt.signcolumn = 'no'
end)
vim.keymap.set('n', '<leader><Right>', function()
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.signcolumn = 'yes'
end)

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<C-Left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-Right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-Down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-Up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Enable cursorline for active window only
vim.api.nvim_create_autocmd({ 'VimEnter', 'WinEnter', 'BufWinEnter' }, {
  desc = 'Enable cursorline when entering window',
  group = vim.api.nvim_create_augroup('mark-active-cursorline-enable', { clear = true }),
  callback = function()
    vim.opt.cursorline = true
  end,
})

vim.api.nvim_create_autocmd('WinLeave', {
  desc = 'Disable cursorline when leaving window',
  group = vim.api.nvim_create_augroup('mark-active-cursorline-disable', { clear = true }),
  callback = function()
    vim.opt.cursorline = false
  end,
})

-- Close neo-tree when it loses focus
vim.api.nvim_create_autocmd('WinLeave', {
  desc = 'Close the file browser when it loses focus',
  group = vim.api.nvim_create_augroup('mark-autoclose-tree', { clear = true }),
  callback = function()
    if vim.bo.filetype == 'neo-tree' then
      vim.cmd.bdelete()
    end
  end,
})

-- vim: ts=2 sts=2 sw=2 et
