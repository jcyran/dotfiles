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
                "basedpyright",
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
        local lspconfig = vim.lsp.config

        lspconfig('lua_ls', {
            on_attach = on_attach,
            capabilities = capabilities,
        })

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

        lspconfig('basedpyright', {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                basedpyright = {
                    python = {
                        pythonPath = get_python_path(vim.fn.getcwd())
                    }
                }
            }
        })
    end
}
