vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
    }
})

local my_parsers = {
    "lua",
    "python",
    "yaml",
    "bash",
}

local installed = require("nvim-treesitter.config").get_installed()

local missing_parsers = vim.iter(my_parsers):filter(function(parser)
    return not vim.tbl_contains(installed, parser)
end):totable()


if #missing_parsers > 0 then
    require("nvim-treesitter").install(missing_parsers)
end
