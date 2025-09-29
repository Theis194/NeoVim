return {
    cmd = {
        "haskell-language-server-wrapper",
        "--lsp",
    },
    filetypes = {
        "haskell",
        "lhaskell",
    },
    root_markers = {
        "hie.yaml",
        ".git",
    },
    settings = {
        haskell = {
            formattingProvider = "ormolu",
        },
    },

    single_file_support = true,
    log_level = vim.lsp.protocol.MessageType.Warning,
}
