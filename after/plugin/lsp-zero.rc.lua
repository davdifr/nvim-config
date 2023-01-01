local status, lsp = pcall(require, "lsp-zero")
if (not status) then return end

lsp.preset('recommended')

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

-- Autoformat 
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

lsp.setup()
