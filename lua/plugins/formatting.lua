return {
  "steveearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatter_by_ft = {
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        json = { "jsonfix" },
        lua = { "stylua" },
        markdown = { "prettierd" },
        python = { "isort", "black" },
        xml = { "xmlformatter" },
        yaml = { "yamlfmt" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = true
      }
    })

    vim.keymap.set(
      { "n", "v" }, "<leader>F", function()
        conform.format({ lsp_fallback = true, async = false, timeout_ms = 500 })
      end
    )
  end
}
