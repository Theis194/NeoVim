return {
    cmd = { "vscode-eslint-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "vue",
        "svelte",
        "astro",
        "htmlangular",
    },
    root_markers = { ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json", "package.json", ".git" },
    settings = {
        codeAction = {
            disableRuleComment = {
                enable = true,
                location = "separateLine",
            },
        },
        format = true,
    },

    single_file_support = true,
    log_level = vim.lsp.protocol.MessageType.Warning,
}
