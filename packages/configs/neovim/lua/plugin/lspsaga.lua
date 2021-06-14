require("lspsaga").init_lsp_saga({
  use_saga_diagnostic_sign = false,
  code_action_icon = " ",
  code_action_prompt = {
    enable = true,
    sign = true,
    virtual_text = false,
  },
})
