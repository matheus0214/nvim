require('config.lazy')
require('config.editor')
require('config.keymaps')

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  command = "checktime",
})


vim.o.tabline = "%!v:lua.MyTabLine()"

function _G.MyTabLine()
  local s = ""
  for i = 1, vim.fn.tabpagenr("$") do
    local buflist = vim.fn.tabpagebuflist(i)
    local winnr = vim.fn.tabpagewinnr(i)
    local bufname = vim.fn.bufname(buflist[winnr])
    local filename = vim.fn.fnamemodify(bufname, ":t") -- get only filename

    if i == vim.fn.tabpagenr() then
      -- current tab
      s = s .. "%#TabLineSel#" .. " " .. filename .. " "
    else
      s = s .. "%#TabLine#" .. " " .. filename .. " "
    end
  end
  s = s .. "%#TabLineFill#"
  return s
end
