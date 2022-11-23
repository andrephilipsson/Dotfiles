local has_neodev, neodev = pcall(require, "neodev")

if has_neodev then
    neodev.setup()
end

local has_lspconfig, lspconfig = pcall(require, "lspconfig")
local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")

if not has_lspconfig or not has_cmp then
    return
end

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

-- better completion experience
--   menuone: always display popup menu, even where there's only one completion
--   noinsert: do not insert any text until the user selects a match from the menu
--   noselect: do not automatically select a match from the menu
vim.opt.completeopt = "menuone,noinsert,noselect"

local on_attach = function(client, bufnr)
    vim.wo.signcolumn = "yes:1"
    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
end

local capabilities = cmp_lsp.default_capabilities()

lspconfig.util.default_config =
    vim.tbl_extend("force", lspconfig.util.default_config, {
        on_attach = on_attach,
        capabilities = capabilities,
    })

local servers = { "clangd", "rust_analyzer", "pyright", "tsserver" }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({})
end

lspconfig.sumneko_lua.setup({
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace",
            },
        },
    },
})
