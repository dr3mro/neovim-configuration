return {
	"aznhe21/actions-preview.nvim",
	lazy = false,
	opts = {},
	config = function()
		-- add hint to keymap to show code actions
		vim.keymap.set("n", "<leader><space>", require("actions-preview").code_actions)
	end,
}
