return {
  'saecki/crates.nvim',
  tag = 'stable',
  events = { "BufRead Cargo.toml" },
  config = function()
    local crates = require("crates")

    crates.setup({
      smart_insert = true,
      insert_closing_quote = true,
      autoload = true,
      autoupdate = true,
      loading_indicator = true,
      date_format = "%Y-%m-%d",
      thousands_separator = ".",
      notification_title = "Crates",
    })
  end,
}
