vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "plugins.lua",
  command = "PackerCompile"
})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function ()
    vim.highlight.on_yank { timeout = 300 }
  end
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function ()
    vim.opt_local.formatoptions:remove("o")
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function ()
    require("cmp").setup.buffer {
      sources = {
        { name = "latex_symbols" }
      }
    }
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex,markdown,text,gitcommit",
  callback = function ()
    require("cmp").setup.buffer {
      sources = {
        { name = "spell", keyword_length = 5 },
        { name = "emoji" }
      }
    }
  end
})

vim.api.nvim_create_autocmd("CursorHold,CursorHoldI", {
  callback = require("nvim-lightbulb").update_lightbulb
})
