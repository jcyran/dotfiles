vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'c', 'cpp', 'h' },
    callback = function()
        vim.lsp.start({
            name = 'clangd',
            cmd = { 'clangd', '--background-index', '--clang-tidy' },
            vim.fs.find({ 'compile_commands.json', 'compile_flags.txt' }, {
                upward = true,
                stop = vim.env.HOME,
            }),
        })
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
        vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    end
})

