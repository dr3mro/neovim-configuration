return {
  'Exafunction/codeium.vim',
  event = 'BufEnter',
  config = function()
    --auto enable on startup
    vim.g.codeium_enabled = true
  end
}
