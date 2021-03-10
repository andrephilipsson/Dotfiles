-- Checks if packer exists, if so return false (not the first load) else true.

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  if vim.fn.input("Download Packer? (y for yes) ") ~= "y" then
    return true
  end

  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

return false
