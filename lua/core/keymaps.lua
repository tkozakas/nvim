-- This file centralizes all keymaps for better organization and discoverability.
-- The philosophy is to use mnemonic prefixes:
--  <leader>f -> file
--  <leader>g -> git
--  <leader>b -> buffer
--  <leader>d -> diagnostics (quickfix)
--  <leader>p -> project (could also be used for plugin-specific actions)

-- disable the default behavior of the space key in normal and visual modes
vim.keymap.set({ "n", "v" }, "<leader>", "<nop>")
-- Center screen on half-page jumps for better context
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down and Center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up and Center" })

-- === Buffer Management ===
vim.keymap.set("n", "<leader>b", "<C-^>", { desc = "Switch to previous [b]uffer" })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "[B]uffer [N]ext" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "[B]uffer [P]revious" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "[B]uffer [D]elete (close)" })
vim.keymap.set("n", "<leader>bD", ":bdelete!<CR>", { desc = "[B]uffer [D]elete (force)" })
vim.keymap.set("n", "<leader>bl", function()
	require("telescope.builtin").buffers()
end, { desc = "[B]uffer [L]ist (fuzzy)" })
vim.keymap.set("n", "<leader>bf", ":bfirst<CR>", { desc = "[B]uffer [F]irst" })
vim.keymap.set("n", "<leader>bL", ":blast<CR>", { desc = "[B]uffer [L]ast" })

-- === Git ===
-- Grouping git commands under <leader>g
vim.keymap.set("n", "<leader>gg", function()
	require("core.functions").lazygit()
end, { desc = "[G]it [G]UI (lazygit)" })
vim.keymap.set("n", "<leader>gc", ":Gcommit<CR>", { desc = "[G]it [C]ommit" })
vim.keymap.set("n", "<leader>gh", ":Gh<CR>", { desc = "Open on [G]it[H]ub" })
vim.keymap.set(
	"n",
	"<leader>gp",
	require("core.functions").open_or_create_pr,
	{ desc = "[G]it: Open or Create [P]ull Request", silent = true }
)

-- === Diagnostics/Quickfix ===
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "[D]iagnostic [N]ext" })
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "[D]iagnostic [P]revious" })
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "[D]iagnostic [D]etails (float)" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "[D]iagnostic [L]ist (location list)" })
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setqflist, { desc = "[D]iagnostic [Q]uickfix list" })

-- Create new tmux splits from Neovim
vim.keymap.set("n", "<leader>th", function()
	require("core.functions").tmux_split_horizontal()
end, { desc = "[T]mux split [H]orizontal" })
vim.keymap.set("n", "<leader>tv", function()
	require("core.functions").tmux_split_vertical()
end, { desc = "[T]mux split [V]ertical" })

-- Delete without yanking to avoid overwriting the clipboard
vim.keymap.set("n", "d", '"_d', { desc = "Delete (no yank)" })
vim.keymap.set("x", "d", '"_d', { desc = "Delete selection (no yank)" })

vim.keymap.set("n", "<leader>cc", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude Code" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })


-- === Oil File Explorer ===
-- Move selection up and down
vim.keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Debugging Keymaps (using nvim-dap)
-- Basic Controls:
-- - <Space>db - Toggle Breakpoint
-- - <Space>dc - Continue execution
-- - <Space>di - Step Into function
-- - <Space>do - Step Over (next line)
-- - <Space>dO - Step Out of function
-- - <Space>dx - Terminate/e*X*it debugger
-- UI & Info:
-- - <Space>dt - Toggle debug UI
-- - <Space>dh - Hover (inspect variable)
-- - <Space>dr - Open REPL
-- - <Space>dl - Run Last debug config
-- How to Use:
-- 1. Set a breakpoint: Put cursor on a line, press <Space>db
-- 2. Start debugging: Press <Space>dc
-- 3. Step through code: Use <Space>di (into) or <Space>do (over)
-- 4. Inspect variables: Hover over them and press <Space>dh
-- 5. Stop debugging: Press <Space>dx
