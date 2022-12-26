local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

telescope.setup {
    extensions = {
        file_browser = {
            theme = 'dropdown'
        },
    },
}

telescope.load_extension('file_browser')

vim.keymap.set('n', 'sf', function()
  telescope.extensions.file_browser.file_browser({
    cwd = telescope_buffer_dir(),
    dir_icon = "",
    hidden = false,
    previewer = false,
    initial_mode = "normal",
  })
end)

vim.keymap.set('n', ';r', builtin.live_grep)
vim.keymap.set('n', ';;', builtin.resume)
vim.keymap.set('n', ';b', builtin.buffers)
