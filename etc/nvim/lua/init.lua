
-- Auto install packer.nvim if not exists
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
-- vim.cmd [[packadd packer.nvim]]
-- vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

require 'settings'
require 'plugins'
require 'keybindings'
require 'theme'
require 'lsp'

local ts = require 'nvim-treesitter.configs'
ts.setup {
    ensure_installed = 'maintained', 
    highlight = {enable = true},
    playground = {
        enable = true,
    }
}
