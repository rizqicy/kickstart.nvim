-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>tt", "<cmd>Neotree toggle<cr>", desc = "Neo[t]ree [t]oggle" },
	},
	config = function()
		require('neo-tree').setup({
			event_handlers = {
				{
					event = "file_opened",
					handler = function(file_path)
						--auto close
						require("neo-tree").close_all()
					end
				},
			}
		})
	end,
}
