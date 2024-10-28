return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-jest',
    },
    config = function()
      require('neotest').setup {
        vim.keymap.set('n', '<leader>tl', function()
          require('neotest').run.run()
        end, { desc = 'Run Last Test' }),
        vim.keymap.set('n', '<leader>tf', function()
          require('neotest').run.run(vim.fn.expand '%')
        end, { desc = 'Full file' }),
        vim.keymap.set('n', '<leader>ta', function()
          require('neotest').run.attach()
        end, { desc = 'Attach' }),
        vim.keymap.set('n', '<leader>tw', "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>", { desc = 'Run Watch' }),
        adapters = {
          require 'neotest-jest' {
            jestCommand = 'npm test --',
            jestConfigFile = 'custom.jest.config.ts',
            env = { CI = true },
            cwd = function()
              return vim.fn.getcwd()
            end,
          },
        },
      }
    end,
  },
}
