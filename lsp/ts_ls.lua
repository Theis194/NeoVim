return {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "javascript.jsx",
        "typescript.tsx",
    },
    root_markers = { "package.json", "tsconfig.json", ".git" },
    single_file_support = true,
    log_level = vim.lsp.protocol.MessageType.Warning,
}
