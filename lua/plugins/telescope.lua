return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        cond = vim.fn.executable("cmake") == 1,
      },
    },
    config = function()
      local actions = require("telescope.actions")

      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-LEFT>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-x>"] = actions.delete_buffer,
            },
          },
          file_ignore_patterns = {
            "node_modules",
            "yarn.lock",
            ".git",
            ".sl",
            "_build",
            ".next",
          },
          hidden = true,
        },
      })

      -- Enable telescope fzf native, if installed
      pcall(require("telescope").load_extension, "fzf")
    end,
  },
}

-- return {
--   "nvim-telescope/telescope.nvim",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
--     "nvim-telescope/telescope-ui-select.nvim",
--     "nvim-tree/nvim-web-devicons",
--     "ThePrimeagon/harpoon"
--   },
--   config = function()

--     local telescope = require("telescope")
--     local actions = require("telescope.actions")
--     local themes = require("telescope.themes")

--     telescope.setup({
--       defaults = {

--         prompt_prefix = " ",
--         selection_caret = " ",
--         path_display = { "smart" },

--         mappings = {
--           i = {
--             ["<C-n>"] = actions.cycle_history_next,
--             ["<C-p>"] = actions.cycle_history_prev,

--             ["<C-j>"] = actions.move_selection_next,
--             ["<C-k>"] = actions.move_selection_previous,

--             ["<C-c>"] = actions.close,

--             ["<Down>"] = actions.move_selection_next,
--             ["<Up>"] = actions.move_selection_previous,

--             ["<CR>"] = actions.select_default,
--             ["<C-x>"] = actions.select_horizontal,
--             ["<C-v>"] = actions.select_vertical,
--             ["<C-t>"] = actions.select_tab,

--             ["<C-u>"] = actions.preview_scrolling_up,
--             ["<C-d>"] = actions.preview_scrolling_down,

--             ["<PageUp>"] = actions.results_scrolling_up,
--             ["<PageDown>"] = actions.results_scrolling_down,

--             ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
--             ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
--             ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
--             ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
--             ["<C-l>"] = actions.complete_tag,
--             ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
--           },

--           n = {
--             ["<esc>"] = actions.close,
--             ["<CR>"] = actions.select_default,
--             ["<C-x>"] = actions.select_horizontal,
--             ["<C-v>"] = actions.select_vertical,
--             ["<C-t>"] = actions.select_tab,

--             ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
--             ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
--             ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
--             ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

--             ["j"] = actions.move_selection_next,
--             ["k"] = actions.move_selection_previous,
--             ["H"] = actions.move_to_top,
--             ["M"] = actions.move_to_middle,
--             ["L"] = actions.move_to_bottom,

--             ["<Down>"] = actions.move_selection_next,
--             ["<Up>"] = actions.move_selection_previous,
--             ["gg"] = actions.move_to_top,
--             ["G"] = actions.move_to_bottom,

--             ["<C-u>"] = actions.preview_scrolling_up,
--             ["<C-d>"] = actions.preview_scrolling_down,

--             ["<PageUp>"] = actions.results_scrolling_up,
--             ["<PageDown>"] = actions.results_scrolling_down,

--             ["?"] = actions.which_key,
--           },
--         },
--       },
--     })

--     telescope.load_extension('fzf')
--     telescope.load_extension('ui-select')
--     telescope.load_extension('harpoon')

--     -- See `:help telescope.builtin`
--     vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
--     vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
--     vim.keymap.set('n', '<leader>/', function()
--     -- You can pass additional configuration to telescope to change theme, layout, etc.
--     require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--       winblend = 10,
--       previewer = false,
--     })
--     end, { desc = '[/] Fuzzily search in current buffer]' })

--     vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
--     vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
--     vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
--     vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
--     vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

--   end,
-- }
