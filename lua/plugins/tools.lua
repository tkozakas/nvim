return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			linehl = false,
			numhl = true,
			current_line_blame = false,
			current_line_blame_opts = {
				delay = 1000,
			},
		},
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			vim.keymap.set("n", "M", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "mm", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "ma", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "ms", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "md", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "mf", function()
				harpoon:list():select(4)
			end)
		end,
	},
	{
		"rgroli/other.nvim",
		lazy = false,
		config = function()
			require("other-nvim").setup({
				mappings = {
					"golang",
					"python",
					{
						pattern = "/app/(.*)/(.*).rb",
						target = {
							{ context = "test", target = "/spec/%1/%2_spec.rb" },
						},
					},
					{
						pattern = "(.+)/spec/(.*)/(.*)_spec.rb",
						target = {
							{ target = "%1/app/%2/%3.rb" },
						},
					},
				},
			})
		end,
		keys = {
			{
				"<leader>o",
				function()
					require("other-nvim").open()
				end,
				mode = "n",
			},
			{
				"<leader>O",
				function()
					require("other-nvim").openVSplit()
				end,
				mode = "n",
			},
		},
	},
	{
		"hat0uma/csvview.nvim",
		---@module "csvview"
		---@type CsvView.Options
		opts = {
			view = {
				display_mode = "border",
			},
			parser = { comments = { "#", "//" } },
			keymaps = {
				-- Text objects for selecting fields
				textobject_field_inner = { "if", mode = { "o", "x" } },
				textobject_field_outer = { "af", mode = { "o", "x" } },
				-- Excel-like navigation:
				-- Use <Tab> and <S-Tab> to move horizontally between fields.
				-- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
				-- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
				jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
				jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
				jump_next_row = { "<Enter>", mode = { "n", "v" } },
				jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
			},
		},
		keys = {
			{ "<leader>csv", "<cmd>CsvViewToggle<cr>", desc = "Toggle CSV view" },
		},
		cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
	},
}
