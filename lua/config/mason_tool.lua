vim.api.nvim_create_autocmd('User', {
    pattern = 'MasonToolsStartingInstall',
    callback = function()
      vim.schedule(function()
        print 'mason-tool-installer is starting'
      end)
    end,
  })
