-- local dn = require('dark_notify')

vim.o.background = "dark"
vim.g.nord_contrast = true

-- require('nord').set()
vim.cmd([[
augroup MyColors
    autocmd!
    autocmd ColorScheme * highlight IndentBlanklineChar guifg=#4C566A gui=nocombine
augroup END
]])
vim.cmd('colorscheme nord')
-- vim.cmd('autocmd Colorscheme * highlight NvimTreeEndOfBuffer guifg=#4C566A')
-- vim.cmd('autocmd Colorscheme * highlight NvimTreeVertSplit guifg=#32302f guibg=#3B4252')
-- vim.cmd('colorscheme nord')

local colors = {
    red = '#cc241d',
    green = '#98971a',
    yellow = '#d79921',
    blue = '#458588',
    purple = '#b16286',
    aqua = '#689d6a',
}

local function lsp_client_name()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0,'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
end

local function current_time()
    return os.date('%d-%m-%Y %H:%M:%S')
end

-- local function on_mode_change(mode)
    local config = {
        options = {
            theme = 'nord',
            section_separators = {'', ''},
            component_separators = {'', ''},
            icons_enabled = true,
        },
        sections = {
            lualine_a = { {'mode', upper = true} },
            lualine_b = { {'filename', file_status = true}},
            lualine_c = { 'filetype', },
            lualine_x = {
                { lsp_client_name, icon = '' },
                {
                    'diagnostics',
                    sources = {'nvim_lsp'},
                    symbols = {error = ' ', warn = ' ', info= ' '},
                    color_error = colors.red,
                    color_warn = colors.yellow,
                    color_info = colors.blue,
                }
            },
          lualine_y = { {'branch', icon = ''}, 'location' },
          lualine_z = { { current_time } },
        },
        inactive_sections = {
          lualine_a = {  },
          lualine_b = { {'filename', file_status = true} },
          lualine_c = {  },
          lualine_x = {  },
          lualine_y = {  },
          lualine_z = {  }
        },
        extensions = { 'nvim-tree' }
    }
    require('lualine').setup(config)
-- end

-- dn.run({
--    schemes = {
--        dark = "tokyonight",
--        light = "tokyonight"
--    },
--    onchange = on_mode_change,
--})
-- dn.update()
