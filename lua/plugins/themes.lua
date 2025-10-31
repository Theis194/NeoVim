return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup()
            -- vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa.nvim",
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                colors = {
                    theme = {
                        all = {
                            ui = {
                                bg_gutter = "none",
                            }
                        }
                    }
                },
                overrides = function(colors)
                    local theme = colors.theme

                    local makeDiagnosticColor = function(color)
                        local c = require("kanagawa.lib.color")
                        return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
                    end

                    return {
                        -- General styling
                        NormalFloat                = { bg = "none" },
                        FloatBorder                = { bg = "none" },
                        FloatTitle                 = { bg = "none" },

                        NormalDark                 = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

                        LazyNormal                 = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
                        MasonNormal                = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

                        -- Diagnostics styling
                        DiagnosticVirtualTextHint  = makeDiagnosticColor(theme.diag.hint),
                        DiagnosticVirtualTextInfo  = makeDiagnosticColor(theme.diag.info),
                        DiagnosticVirtualTextWarn  = makeDiagnosticColor(theme.diag.warning),
                        DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),

                        -- Pop up menu styling
                        Pmenu                      = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
                        PmenuSel                   = { fg = "NONE", bg = theme.ui.bg_p2 },
                        PmenuSbar                  = { bg = theme.ui.bg_m1 },
                        PmenuThumb                 = { bg = theme.ui.bg_p2 },
                    }
                end,
            })
            vim.cmd.colorscheme("kanagawa-wave")
        end,
    },
}
