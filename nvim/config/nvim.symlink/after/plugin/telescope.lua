local has_telescope, telescope = pcall(require, "telescope")

if not has_telescope then
	return
end

telescope.setup({})

pcall(telescope.load_extension, "fzf")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>t", builtin.find_files)
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
