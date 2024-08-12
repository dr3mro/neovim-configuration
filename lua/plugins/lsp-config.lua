---@diagnostic disable: undefined-global
return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "pyright", "rust_analyzer", "tsserver" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			-- General on_attach function
			local on_attach = function(client, bufnr)
				local function buf_set_keymap(...)
					vim.api.nvim_buf_set_keymap(bufnr, ...)
				end
				local opts = { noremap = true, silent = true }

				-- Keymaps for LSP
				buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
				buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
				buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

				-- Enable inlay hints if supported
				if client.supports_method("textDocument/inlayHint") then
					require("inlay-hints").on_attach(client, bufnr)
				end
			end

			-- LSP server configurations
			local servers = { "lua_ls", "clangd", "pyright", "rust_analyzer", "tsserver" }
			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					on_attach = on_attach,
					-- other settings can go here
				})
			end
		end,
	},
	{
		"MysticalDevil/inlay-hints.nvim",
		after = "neovim/nvim-lspconfig",
		config = function()
			require("inlay-hints").setup({
				autocmd = { enable = true },
				commands = { enable = true },
			})
		end,
	},
}
