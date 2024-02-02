-- Manual inclusion of all LSP servers via the lsp-zero plugin
-- this is used instead of Mason because while there may be a way to work around
-- how mason works with the filesystem it typically fails in NixOS

local servers = {
  'lua_ls',
  'pyright',
  'gopls',
  'rust_analyzer',
  'tsserver',
  'html',
  'yamlls',
  'cssls',
  'tailwindcss',
  'stylelint_lsp',
  "volar",
  "bashls",
  "jsonls",
  "astro",
  "marksman",
  "vimls",
  "nil",
  "ansiblels",
}

local config = {
  call_servers = "global"
}

local lua_ls_config = {
  settings = {
    Lua = {
      diagnostics = { global = { "vim" } },
      runtime = { version = "LuaJIT" },
      telemetry = { enable = false }
    }
  }
}

local diagnostics = {
  --
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- handles new files coming into scope and mapping keys into the buffer
local handler = function(_, bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
  keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
  keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
  keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
  keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
  keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

return {
  "VonHeikemen/lsp-zero.nvim",
  dependencies = { 
    "neovim/nvim-lspconfig",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lsp = require("lsp-zero.nvim")
    lsp.set_preferences(config)
    lsp.configure('lua_ls', lua_ls_config)
    
    lsp.setup_servers(servers)
    lsp.on_attach(handler)

    lsp.setup()

    vim.diagnostic.config(diagnostics)

  end,
}
