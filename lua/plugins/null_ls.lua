return {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local null_ls = require("null-ls")
        local null_ls_utils = require("null-ls.utils")
  
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics

        null_ls.setup({
            root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json", "cargo.toml"),
    
            debug = false,
            sources = {
                formatting.eslint_d,
                formatting.yamlfmt,
                formatting.stylelint,
                formatting.rustfmt,
                formatting.prettierd,
                formatting.stylua,
                formatting.nginx_beautifier,
                formatting.prettierd,
                -- diagnostics
                diagnostics.eslint_d.with({
                condition = function(utils)
                    return utils.root_has_file( { ".eslintrc.js","eslintrc.cjs","eslintrc.json","eslintrc.mjs" } )
                end,
            }),
                diagnostics.markdownlint.with({
                    MD025 = false,
                    MD013 = false,
                    MD033 = false,
                    MD026 = false,
                }),
                diagnostics.actionlint,
                diagnostics.ansiblelint,
            },
        --     on_attach = function(current_client, bufnr)
        --       if current_client.supports_method("textDocument/formatting") then
        --         vim.api.nvim_clear_autocmds( { group = augroup, buffer = bufnr } )
        --         vim.api.nvim_create_autocmd("BufWritePre", {
        --           group = augroup,
        --           buffer = buffnr,
        --           callback = function()
        --             vim.lsp.buf.format({
        --               filter = function(client)
        --                 return client.name == "null-ls"
        --               end,
        --               bufnr = bufnr,
        --             })
        --           end
        --         })
        --         end -- end conditional
        -- end -- end on_attach
    }) -- finish setup() call
    end -- end config function
}
    
    