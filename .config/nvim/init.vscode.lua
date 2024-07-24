-- Basic settings
vim.g.mapleader = " "  -- Use space as the leader key
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Key mappings
vim.api.nvim_set_keymap('n', '<leader>h', ':set hlsearch!<CR>', {})
