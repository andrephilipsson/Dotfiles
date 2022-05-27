local has_lsp, lsp = pcall(require, "ape.lsp")
if not has_lsp then
  return
end

local has_jdtls, jdtls = pcall(require, "jdtls")
if not has_jdtls then
  return
end

local config = {
  cmd = {
    "jdtls",
  },
  root_dir = require("jdtls.setup").find_root({ "gradlew", ".git" }),
}

local function jdtls_on_attach()
  lsp.on_attach()

  jdtls.setup_dap({ hotcodereplace = "auto" })
  require("jdtls.setup").add_commands()
end

config.capabilities = lsp.capabilities
config.handlers = lsp.handlers()
config.on_attach = jdtls_on_attach

jdtls.start_or_attach(config)
