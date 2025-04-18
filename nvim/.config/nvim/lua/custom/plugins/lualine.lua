return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      vim.keymap.set('n', '<leader>b1', ':LualineBuffersJump! 1<CR>', {})
      vim.keymap.set('n', '<leader>b2', ':LualineBuffersJump! 2<CR>', {})
      vim.keymap.set('n', '<leader>b3', ':LualineBuffersJump! 3<CR>', {})
      vim.keymap.set('n', '<leader>b4', ':LualineBuffersJump! 4<CR>', {})
      vim.keymap.set('n', '<leader>b5', ':LualineBuffersJump! 5<CR>', {})
      vim.keymap.set('n', '<leader>b6', ':LualineBuffersJump! 6<CR>', {})
      vim.keymap.set('n', '<leader>b7', ':LualineBuffersJump! 7<CR>', {})
      vim.keymap.set('n', '<leader>b8', ':LualineBuffersJump! 8<CR>', {})
      vim.keymap.set('n', '<leader>b9', ':LualineBuffersJump! 9<CR>', {})
      vim.keymap.set('n', '<leader>b0', ':LualineBuffersJump! 10<CR>', {})

      require('lualine').setup {
        options = {
          -- theme = bubbles_theme,
          options = { theme = 'palenight' },
          component_separators = '',
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
          lualine_b = { 'filename', 'branch', 'diff' },
          lualine_c = {
            {
              'buffers',
              mode = 2,
            },
          },
          lualine_x = { 'copilot' },
          lualine_y = { 'filetype', 'progress' },
          lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
          },
        },
        inactive_sections = {
          lualine_a = { 'filename' },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'location' },
        },
        tabline = {},
        extensions = {},
      }
      -- require('lualine').setup {
      --   lualine_x = { 'copilot', 'encoding', 'fileformat', 'filetype' },
      --   options = { theme = 'palenight' },
      -- }
    end,
  },
}
