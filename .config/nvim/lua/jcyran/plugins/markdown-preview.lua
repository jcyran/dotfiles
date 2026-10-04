return {
    "OXY2DEV/markview.nvim",
    version = "28.3.0",
    lazy = false,
    config = function()
        require("markview").setup()

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            callback = function()
                vim.cmd("Markview Stop")
            end,
        })
    end,
}
