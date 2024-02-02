return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvim_tree = require("nvim-tree")

    -- callbacks

    local function print_node_path(node)
      print(node.absolute_path)
    end

    local function create_new_file(node)
      vim.notify('create new file')
      require "user.notify" ("nvim-tree", "created new node")
    end

    local function create_new_dir(node)
      vim.notify('create new dir')
      require "user.notify" ("nvim-tree", "created new node")
    end

    -- [setup configuration](https://github.com/nvim-tree/nvim-tree.lua)
    nvim_tree.setup({
      sort_by = "case_sensitive",
      view = {
        adaptive_size = true,
        mappings = {
          list = {
            { key = "p", action = print_node_path },
            { key = "n", action = create_new_file },
            { key = "A", action = create_new_dir },
        },
      },
      renderer = {
        group_empty = true,
        icons = {
          webdev_colors = true,
          git_placement = "before",
          modified_placement = "after",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
            modified = true,
          },
          special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
          symlink_destination = true,
          filters = {
            dotfiles = false,
          },
        }
      }
    }
  })

  -- set keymaps
  local keymap = vim.keymap

  keymap.set("n","<leader>e", "<cmd>NvimTreeToggle<cr>", { desc  = "Toggle file explorer" })



  end,
}


