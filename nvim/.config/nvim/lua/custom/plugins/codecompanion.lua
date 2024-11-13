return {
  -- https://github.com/olimorris/codecompanion.nvim
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'hrsh7th/nvim-cmp', -- Optional: For using slash commands and variables in the chat buffer
      'nvim-telescope/telescope.nvim', -- Optional: For using slash commands
      { 'stevearc/dressing.nvim', opts = {} }, -- Optional: Improves `vim.ui.select`
    },
    config = function()
      require('codecompanion').setup {
        -- display = {
        --   diff = {
        --     provider = "mini_diff",
        --   },
        -- },
        -- opts = {
        -- log_level = "DEBUG",
        -- },
        adapters = {
          gemini = function()
            return require('codecompanion.adapters').extend('gemini', {
              env = {
                api_key = 'AIzaSyC-C7KC8zttU6wEXOJs2ONA5kAobakS2KY',
              },
            })
          end,
        },
        strategies = {
          chat = {
            adapter = 'gemini',
          },
          inline = {
            adapter = 'gemini',
          },
          agent = {
            adapter = 'gemini',
          },
        },
      }
    end,
    display = {
      diff = {
        provider = 'delta',
      },
      action_palette = {
        provider = 'telescope',
      },
    },
    keys = {
      {
        '<leader>aa',
        '<cmd>CodeCompanionActions<cr>',
        desc = 'Code Companion [A]ctions',
      },
      {
        '<leader>ac',
        '<cmd>CodeCompanionChat Toggle<cr>',
        desc = 'Code Companion [C]hat',
      },
      {
        '<leader>as',
        '<cmd>CodeCompanionChat Add<cr>',
        desc = 'Code Companion Chat Add',
      },
    },
  },
}
