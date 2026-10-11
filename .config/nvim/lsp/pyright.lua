return {
    cmd = { "pyright-langserver", "--stdio", },
    filetypes = { "python" },
    root_markers = { ".venv", "pyproject.toml", ".git" },
}
