local setmap = vim.keymap.set
local telescope = require('telescope.builtin')

setmap('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
setmap('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope live grep' })
setmap('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' })
setmap('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope help tags' })
setmap('n', '<leader>s', telescope.lsp_document_symbols, { desc = 'Telescope show document symbols' })
setmap('n', 'gr', telescope.lsp_references, { desc = 'See all symbol references' })

setmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

setmap('n', '<leader>dl', '<cmd>Telescope diagnostics<cr>', { desc = 'LSP Workspace Diagnostics' })
setmap("n", "<leader>df", vim.diagnostic.open_float, { desc = "Open diagnostic float" })

setmap('n', '<leader>q', '<CMD>:quit<CR>', { desc = 'Quit' })
setmap('n', '<leader>vs', ':vsplit<CR>', { noremap = true, silent = true })
setmap('n', '<leader>vh', ':split<CR>', { noremap = true, silent = true })

setmap('n', '<leader>wl', '<C-w>l', { noremap = true, silent = true })
setmap('n', '<leader>wh', '<C-w>h', { noremap = true, silent = true })
setmap('n', '<leader>wj', '<C-w>j', { noremap = true, silent = true })
setmap('n', '<leader>wk', '<C-w>k', { noremap = true, silent = true })

setmap('n', '<Esc><Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })

setmap("n", "<leader>fm", function()
  require("conform").format({ lsp_fallback = true })
end, { desc = "Format file with conform" })

setmap('n', '<leader>e', '<CMD>:Neotree toggle reveal_force_cwd<CR>', { noremap = true, silent = true })
setmap('n', '<leader>gs', '<CMD>:Neotree toggle git_status<CR>', { noremap = true, silent = true })

setmap("n", "<leader>w", ":w<CR>", { desc = "Save file" })
setmap("n", "<leader>q", ":q<CR>", { desc = "Quit file" })
setmap("n", "<leader>x", ":wq<CR>", { desc = "Save and quit" })
setmap("n", "<leader>c", ":bd<CR>", { desc = "Save and quit" })
setmap('i', 'jj', '<Esc>', { noremap = true, silent = true })

setmap({"n","v"}, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
setmap("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- Move to next / previous tab
setmap("n", "tn", ":BufferNext<CR>", { desc = "Next tab" })
setmap("n", "tp", ":BufferPrevious<CR>", { desc = "Previous tab" })

setmap({ "n", "v" }, "gh", "^", { desc = "Go to line start" })
setmap({ "n", "v" }, "gl", "$", { desc = "Go to line end" })
