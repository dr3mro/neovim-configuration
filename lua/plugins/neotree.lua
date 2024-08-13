return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	filesystem = {
		follow_current_file = true, -- This will make Neo-tree follow the current file
		hijack_netrw_behavior = "open_default", -- open Neo-tree when you run :Ex (and other netrw commands)
		cwd_target = {
			sidebar = "toplevel", -- This changes the cwd to the top-level directory
		},
	},
	config = function()
		vim.keymap.set("n", "\\", ":Neotree filesystem reveal left<CR>", {})
	end,
}
