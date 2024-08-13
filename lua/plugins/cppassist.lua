-- ~/.config/nvim/lua/plugins.lua
return {
	-- Other plugin configurations

	{
		"Kohirus/cppassist.nvim",
		opt = true, -- Load the plugin on-demand
		ft = { "h", "cpp", "hpp", "c", "cc", "cxx" }, -- File types to load the plugin for
		config = function()
			require("cppassist").setup()

			-- Define key mappings
			local map = vim.api.nvim_set_keymap
			local opts = { noremap = true, silent = true }

			-- Switch between source and header files
			map("n", "<A-o>", "<Cmd>SwitchSourceAndHeader<CR>", opts)

			-- Generate function definition or static variable definition in source
			map("n", "<leader>cf", "<Cmd>ImplementInSource<CR>", opts)
		end,
	},
}
