return {
	"neoscroll",
	config = function()
	-- https://github.com/karb94/neoscroll.nvim
	require("scroll").setup({
		mappings = {
			'<C-u>', '<C-d>', '<C-b>', '<C-f>',
			'<C-y>', '<C-e>', 'zt', 'zz', 'zb'
		},
		hide_cursor = true,
		stop_eof = true,
		respect_scroll_alone = true,
		easing_function = nil,
		pre_hook = nill,
		post_hook = nill,
		performance_mode = true
	})

	end,
}

