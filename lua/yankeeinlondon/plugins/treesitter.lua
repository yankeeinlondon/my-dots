return {
	"nvim-treesitter.configs",
	config = function()

		require("nvim-treesitter.configs").setup({
		  ensure_installed = { "toml", "bash", "c", "javascript", "json", "lua", "python", "typescript", "tsx", "css", "rust", "java", "yaml", "markdown", "markdown_inline" }, -- one of "all" or a list of languages
		ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
		highlight = {
			enable = true, -- false will disable the whole extension
			disable = { "css" }, -- list of language that will be disabled
		},
		autopairs = {
			enable = true,
		},
		indent = { enable = true, disable = { "python", "css" } },
		})



	end,
}
