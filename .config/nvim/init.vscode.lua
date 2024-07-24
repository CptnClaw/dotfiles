-- Basic settings
vim.g.mapleader = " "  -- Use space as the leader key
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Key mappings
vim.keymap.set('n', '<leader>h', ':set hlsearch!<CR>')
vim.keymap.set({'n', 'v'}, '<leader>f', function() require('vscode').call('editor.action.formatSelection') end)
vim.keymap.set({'n', 'v'}, '<leader>p', function() require('vscode').call('workbench.action.showCommands') end)
vim.keymap.set({'n', 'v'}, '<leader>o', function() require('vscode').call('workbench.action.quickOpen') end)

