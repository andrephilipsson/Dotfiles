local download_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })
  end

  print("Packer downloaded")
  print("You need to restart now")
end

return function()
  if not pcall(require, "packer") then
    download_packer()
    return true
  end

  return false
end
