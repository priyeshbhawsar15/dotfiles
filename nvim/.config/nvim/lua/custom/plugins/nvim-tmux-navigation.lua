return {
  'alexghergh/nvim-tmux-navigation',
  config = function()
    require('nvim-tmux-navigation').setup {}
    vim.keymap.set('n', '<C-h>', '<Cmd>NvimTmuxNavigateLeft<CR>', { desc = 'Tmux Move left' })
    vim.keymap.set('n', '<C-j>', '<Cmd>NvimTmuxNavigateDown<CR>', { desc = 'Tmux Move left' })
    vim.keymap.set('n', '<C-k>', '<Cmd>NvimTmuxNavigateUp<CR>', { desc = 'Tmux Move left' })
    vim.keymap.set('n', '<C-l>', '<Cmd>NvimTmuxNavigateRight<CR>', { desc = 'Tmux Move left' })
  end,
}
