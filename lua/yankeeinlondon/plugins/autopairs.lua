return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = { "hrsh7th/nvim-cmp" },
  config = function()
    local npairs = require("nvim-autopairs")
    
    npairs.setup ({
      check_ts = true,
      ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
        java = false,
      },
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Offset from pattern match
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
      },
    })

    local cmp = require("hrsh7th/nvim-cmp")

    cmp.event:on("confirm_done", npairs.completion.cmp.on_confirm_done {  map_char = { tex = "" }  })

  end,
}

