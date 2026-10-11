vim.pack.add({
    {
        src = "https://github.com/saghen/blink.cmp",
        version = "v1.10.2",
    }
})

require("blink.cmp").setup({
    keymap = {
        preset = "default",

        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
    },
    appearance = {
        nerd_font_variant = "mono",
    },
    completion = {
        accept = {
            auto_brackets = {
                enabled = true,
            },
        },
    },
    sources = {
        default = {
            "lsp",
            "path",
            "snippets",
            "buffer",
        },
    },
    signature = {
        enabled = true,
    },
})
