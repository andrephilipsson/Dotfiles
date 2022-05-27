-- don't load any plugins if packer is not installed
if require("ape.packer_installed")() then
  return
end

-- load packer plugin configuration
require("ape.plugins")

require("ape.lsp")
