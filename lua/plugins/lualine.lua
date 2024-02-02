return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			local harpoon = require("harpoon.mark")

			local function truncate_branch_name(branch)
				if not branch or branch == "" then
					return ""
				end

				-- Match the branch name to the specified format
				local _, _, ticket_number = string.find(branch, "skdillon/sko%-(%d+)%-")

				-- If the branch name matches the format, display sko-{ticket_number}, otherwise display the full branch name
				if ticket_number then
					return "sko-" .. ticket_number
				else
					return branch
				end
			end

			local function harpoon_component()
				local total_marks = harpoon.get_length()

				if total_marks == 0 then
					return ""
				end

				local current_mark = "—"

				local mark_idx = harpoon.get_current_index()
				if mark_idx ~= nil then
					current_mark = tostring(mark_idx)
				end

				return string.format("󱡅 %s/%d", current_mark, total_marks)
			end

			require("lualine").setup({
				options = {
					theme = "catppuccin",
					globalstatus = true,
					component_separators = { left = "█", right = "█" },
					section_separators = { left = "█", right = "█" },
				},
				sections = {
					lualine_b = {
						{ "branch", icon = "", fmt = truncate_branch_name },
						harpoon_component,
						"diff",
						"diagnostics",
					},
					lualine_c = {
						{ "filename", path = 1 },
					},
					lualine_x = {
						"filetype",
					},
				},
			})
		end,
	},
}


-- return {
-- 	"nvim-lualine/lualine.nvim",
--   dependencies = { "nvim-tree/nvim-web-devicons" },
-- 	config = function()
--     -- Set lualine as statusline
--     -- See `:help lualine.txt`
--     local hide_in_width = function()
-- 	    return vim.fn.winwidth(0) > 80
--     end

--     local diff = {
-- 	    "diff",
-- 	    colored = false,
-- 	    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
-- 	    cond = hide_in_width,
--     }
--     local filename = {
-- 	    "filename",
-- 	    path = 1,
-- 	    file_status = true,
-- 	    symbols = { modified = "[+]", readonly = "[-]", unnamed = "", newfile = "[New]" },
--     }
--     local location = {
-- 	    "location",
-- 	    padding = 0,
--     }
--     local spaces = function()
-- 	    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
--     end

--     local lualine = require("lualine")

--     lualine.setup({
-- 	    options = {
-- 		    icons_enabled = true,
-- 		    theme = "tokyonight",
-- 		    -- theme = "onedark",
-- 		    component_separators = "|",
-- 		    section_separators = "",
-- 	    },
-- 	    sections = {
-- 		    lualine_a = { "mode" },
-- 		    lualine_b = { "branch" },
-- 		    lualine_c = { filename },
-- 		    -- lualine_x = { "encoding", "fileformat", "filetype" },
-- 		    lualine_x = { "progress", location, "filesize" },
-- 		    lualine_y = { "diagnostics" },
-- 		    lualine_z = {},
-- 	    },
-- 	    inactive_sections = {
-- 		  lualine_a = {},
-- 		  lualine_b = {},
-- 		  lualine_c = { "filename" },
-- 		  lualine_x = { "location" },
-- 		  lualine_y = {},
-- 		  lualine_z = {},
-- 	  },
-- 	  tabline = {},
-- 	  winbar = {},
-- 	  inactive_winbar = {},
-- 	  extensions = {},
--   })

-- 	end,
-- }


