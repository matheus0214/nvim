require('config.lazy')
require('config.editor')
require('config.keymaps')

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  command = "checktime",
})

