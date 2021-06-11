---- Helpers ----
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

---- Mappings ----
map('n', '0', '^')
map('n', '^', '0')

map('n', '<C-J>', '<C-W><C-J>')
map('n', '<C-K>', '<C-W><C-K>')
map('n', '<C-L>', '<C-W><C-L>')
map('n', '<C-H>', '<C-W><C-H>')

map('t', '<Esc>', '<C-\\><C-n>')

-- Search visual selection
-- map('v', '<leader>sv', ':Clap grep2 ++query=@visual<CR>')

-- Show recent commands
map('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
map('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")

map('n', '<leader>vtt', ':lua require(\'dark_notify\').toggle()<CR>', { silent = true })

map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', { expr = true, silent = true })
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true, silent = true })

local wk = require("which-key")
wk.register({
    K = {
        "<cmd>Lspsaga hover_doc<cr>",
        "Hover doc"
    },
    ["<leader>"] = {
        b = {
            name = "+buffer",
            b = {
                "<cmd>Telescope buffers<cr>",
                "List open buffers"
            }
        },
        c = {
            name = "+code",
            ["/"] = {
                "<cmd>CommentToggle<cr>",
                "Toggle comments"
            },
            a = {
                "<cmd>Lspsaga code_action<cr>",
                "Code actions"
            },
            c = {
                "<cmd>Lspsaga hover_doc<cr>",
                "Hover doc",
            },
            h = {
                '<cmd>Lspsaga lsp_finder<cr>',
                'Find definition and references',
            },
            s = {
                "<cmd>Lspsaga signature_help<cr>",
                "Signature help",
            },
            d = {
                name = "+diagnostics",
                d = {
                    "<cmd>Lspsaga show_line_diagnostics<cr>",
                    "Diagnostics for current line",
                },
                n = {
                    "<cmd>Lspsaga diagnostic_jump_next<cr>",
                    "Next problem"
                },
                p = {
                    "<cmd>Lspsaga diagnostic_jump_prev<cr>",
                    "Previous problem"
                }
            },
            f = {
                "<cmd>lua vim.lsp.buf.formatting()<cr>",
                "Format buffer"
            },
            g = {
                "<cmd>lua vim.lsp.buf.definition()<cr>",
                "Go to definition"
            },
            n = {
                "<cmd>Lspsaga rename<cr>",
                "Rename symbol"
            },
            p = {
                "<cmd>Lspsaga preview_definition<cr>",
                "Preview definition"
            },
            r = {
                "<cmd>Telescope lsp_references<cr>",
                "References"
            },
            w = {
                "<cmd>Telescope lsp_workplace_symbols<cr>",
                "Symbols in workplace"
            },
        },
        f = {
            name = "+files",
            f = {
                "<cmd>Telescope find_files<cr>",
                "Find files"
            },
            g = {
                "<cmd>Telescope find_files<cr>",
                "Find files in Git"
            },
            r = {
                "<cmd>Telescope oldfiles<cr>",
                "Open recent file"
            },
            b = {
                "<cmd>lua require('telescope.builtin').file_browser({cwd = vim.fn.expand('%:p:h')})<CR>",
                "File browser"
            },
            s = {
                ":w<cr>",
                "Save file"
            },
            p = {
                "<cmd>Telescope builtin<cr>",
                "Preview builtin commands"
            }
        },
        g = {
            name = "+git",
            s = {
                "<cmd>Neogit<cr>",
                "Git status"
            },
            c = {
                "<cmd>Neogit commit<cr>",
                "Git commit"
            }
        },
        h = {
            name = "+help",
            h = {
                "<cmd>Telescope help_tags<cr>",
                "List help tags"
            },
            m = {
                "<cmd>Telescope man_pages<cr>",
                "List man pages"
            }
        },
        p = {
            name = '+project',
            r = { "<cmd>RnvimrToggle<cr>", "Ranger" }
        },
        q = {
            name = '+quit',
            q = { ":qa<cr>", "Close neovim" },
            ["!"] = { ":qa!", "Force close neovim" },
            w = { ":qaw<cr>", "Save all and close neovim" },
        },
        s = {
            name = "+search",
            b = {
                "<cmd>Telescope current_buffer_fuzzy_find<cr>",
                "Search in buffer"
            },
            s = {
                "<cmd>lua require('telescope.builtin').live_grep()<CR>",
                "Search in directory files"
            },
            o = {
                "<cmd>lua require('telescope.builtin').live_grep({ grep_open_files = true })<CR>",
                "Search in open files"
            },
            w = {
                "<cmd>Telescope grep_string<cr>",
                "Search word under cursor"
            },
            c = {
                "<cmd>Telescope lsp_document_symbols<cr>",
                "Code symbols in document"
            },
        },
        t = {
            name = "+tree",
            t = {
                "<cmd>NvimTreeToggle<cr>",
                "Toggle NvimTree"
            }
        },
        w = {
            name = "+window",
            h = {
                "<c-w><c-h>",
                "Focus window to left",
            },
            j = {
                "<c-w><c-j>",
                "Focus window below",
            },
            k = {
                "<c-w><c-k>",
                "Focus window above",
            },
            l = {
                "<c-w><c-l>",
                "Focus window to right",
            },
            d = {
                "<cmd>close<cr>",
                "Close window"
            },
            s = {
                name = "+split",
                v = {
                    "<cmd>vsplit<cr>",
                    "Vertical split",
                },
                h = {
                    "<cmd>split<cr>",
                    "Horizontal split"
                }
            }
        },
        v = {
            name = "+vim",
            p = {
                name = "+packer",
                i = {
                    "<cmd>PackerInstall<cr>",
                    "Packer Install"
                },
                b = {
                    "<cmd>PackerCompile<cr>",
                    "Build"
                },
                c = {
                    "<cmd>PackerClean<cr>",
                    "Clean"
                },
                s = {
                    "<cmd>PackerSync<cr>",
                    "Sync"
                },
                u = {
                    "<cmd>PackerUpdate<cr>",
                    "Update"
                },
                p = {
                    "<cmd>PackerStatus<cr>",
                    "Status"
                },
            }
        },
        [":"] = {
            "<cmd>Telescope command_history<cr>",
            "Recent commands"
        },
        ["`"] = {
            "<cmd>terminal<cr>",
            "Terminal"
        }
    }
})


wk.register({
   ["<leader>"] = {
       mode = "v",
       c = {
           name = "+code",
           mode = "v",
           a = {
               "<cmd>Lspsaga range_code_action<CR>",
               "Code actions",
               mode = "v"
           },
       }
   }
})


-- map('v', '<leader>ca', ":<C-U>Lspsaga range_code_action<CR>")
map('v', '<leader>c/', "gcc")
-- map('n', '<leader>`', ':Lspsaga open_floaterm<CR>')
-- map('t', '<leader>`', '<C-\\><C-n>:Lspsaga close_floaterm<CR>')
