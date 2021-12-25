local lsp = require("ape.lsp")

local root_markers = {"gradlew", ".git"}
local root_dir = require("jdtls.setup").find_root(root_markers)
local home = os.getenv("HOME")
local jdtls_path = home .. "/Code/dot/vendor/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local config_folder = function ()
  if vim.fn.has("mac") == 1 then
    return "config_mac"
  elseif vim.fn.has("unix") then
    return "config_linux"
  end
end

local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",

    "-jar", jdtls_path .. "plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",

    "-configuration", jdtls_path .. config_folder(),

    "-data", home .. "/.local/share/eclipse/" .. project_name,
  },

  root_dir = root_dir,

  settings = {
    java = {}
  },

  init_options = {
    bundles = {}
  },
}

local function jdtls_on_attach(bufnr)
    lsp.on_attach()

    require("jdtls").setup_dap({ hotcodereplace = "auto" })
    require("jdtls.setup").add_commands()
    require("jdtls.dap").setup_dap_main_class_configs()

    local opts = { silent = true; }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>roi", "<Cmd>lua require('jdtls').organize_imports()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "v", "<Leader>rev", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>rev", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "v", "<Leader>rem", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>rec", "<Esc><Cmd>lua require('jdtls').extract_constant()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "v", "<Leader>rec", "<Esc><Cmd>lua require('jdtls').extract_constant()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>dc", "<Cmd>lua require('jdtls').test_class()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>dn", "<Cmd>lua require('jdtls').test_nearest_method()<CR>", opts)
end

config.capabilities = lsp.capabilities()
config.handlers = lsp.handlers()
config.on_attach = jdtls_on_attach

local bundles = {
  vim.fn.glob(home .. "/Code/dot/vendor/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"),
};
vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/Code/dot/vendor/vscode-java-test/server/*.jar"), "\n"))
config["init_options"] = {
  bundles = bundles
}

require("jdtls").start_or_attach(config)
