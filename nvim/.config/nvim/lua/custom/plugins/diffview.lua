return {
  'sindrets/diffview.nvim',
  config = function()
    vim.keymap.set('n', '<leader>gh', ':DiffviewFileHistory %<CR>', { desc = 'view file history' })
    vim.keymap.set('n', '<leader>gc', ':DiffviewFileHistory<CR>', { desc = 'view branch history' })
    vim.keymap.set('n', '<leader>go', ':DiffviewOpen<CR>', { desc = 'Diffview Open (merge conflicts)' })
  end,
}
