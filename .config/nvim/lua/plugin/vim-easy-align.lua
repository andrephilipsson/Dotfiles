local xmap = vim.keymap.xmap
local nmap = vim.keymap.nmap

-- Start interactive EasyAlign in visual mode (e.g. vipga)
xmap { "ga", "<Plug>(EasyAlign)" }

-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap { "ga", "<Plug>(EasyAlign)" }
