vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("NativeTreesitter", { clear = true }),
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
