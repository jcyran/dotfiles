return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
    },
    config = function()
        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "jsonls",
                "basedpyright",
                "clangd",
                "slint_lsp",
                "vtsls",
            }
        })

        local on_attach = function(_, _)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        end

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        require("lspconfig").lua_ls.setup {	on_attach = on_attach, capabilities = capabilities, }


        require("lspconfig").rust_analyzer.setup { on_attach = on_attach, capabilities = capabilities, }

        require("lspconfig").jsonls.setup { on_attach = on_attach, capabilities = capabilities, }

        -- virtual environment detection
        local get_python_path = function(workspace)
            if vim.env.VIRTUAL_ENV then
                return vim.env.VIRTUAL_ENV .. '/bin/python'
            end

            for _, pattern in ipairs({ 'venv', '.venv', 'env', '.env' }) do
                local match = vim.fn.glob(workspace .. '/' .. pattern)
                if match ~= '' then
                  return match .. '/bin/python'
                end
            end

            return 'python3'
        end

        require("lspconfig").basedpyright.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                basedpyright = {
                    python = {
                        pythonPath = get_python_path(vim.fn.getcwd())
                    }
                }
            }
        }

        require("lspconfig").clangd.setup {
            cmd = { 'clangd', '--background-index', '--clang-tidy' },
            on_attach = on_attach,
            capabiliteis = capabilities,
        }

        require("lspconfig").slint_lsp.setup({
            filetypes = { "slint" },
            -- root_dir = lspconfig.util.root_pattern(".git", "Cargo.toml"),
        })

        require("lspconfig").vtsls.setup { on_attach = on_attach, capabilities = capabilities, }
    end
}
