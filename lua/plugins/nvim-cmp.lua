return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"onsails/lspkind.nvim",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets"
	},
	config = function()

    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
	    snippet = {
		    expand = function(args)
			    luasnip.lsp_expand(args.body)
		    end,
	    },
	    mapping = cmp.mapping.preset.insert({
		    ["<C-k>"] = cmp.mapping.select_prev_item(),
		    ["<C-j>"] = cmp.mapping.select_next_item(),
		    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		    -- ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		    ["<C-e>"] = cmp.mapping({
			    i = cmp.mapping.abort(),
			    c = cmp.mapping.close(),
		    }),
		    -- Accept currently selected item. If none selected, `select` first item.
		    -- Set `select` to `false` to only confirm explicitly selected items.
		    ["<CR>"] = cmp.mapping.confirm { select = true },
	      ["<S-Tab>"] = cmp.mapping(function(fallback)
			    if cmp.visible() then
				    cmp.select_prev_item()
			    elseif luasnip.jumpable(-1) then
				    luasnip.jump(-1)
			    else
				    fallback()
			    end
		    end, {
			    "i",
			    "s",
		    }),
	    }),
	    sources = cmp.config.sources({
		    { name = "nvim_lsp" },
		    { name = "luasnip" },
		    { name = "path" },
		    { name = "crates" },
		    { name = "null-ls" },
		    { name = "buffer" },
	    }),
	    formatting = {
		    fields = { "kind", "abbr", "menu" },
		    format = function(entry, vim_item)
			      -- Kind Icons
			      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			      vim_item.menu = ({
				    nvim_lsp = "[LSP]",
				    luasnip = "[Snippet]",
				    crates = "[Crates]",
				    null_ls = "[NullLS]",
				    buffer = "[Buffer]",
				    path = "[Path]",
			    })[entry.source.name]
			  return vim_item
		    end,
	    },
	    window = {
		    documentation = {
			    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		    },
	    },
    })


	end,
}

