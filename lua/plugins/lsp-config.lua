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
			lspconfig.lua_ls.setup({
				on_attach = function(client, bufnr)
					local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
					local opts = { noremap = true, silent = true }

					-- Keymaps for LSP
					buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
					buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
					buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
				end,
			})
			lspconfig.clangd.setup({
				on_attach = function(client, bufnr)
					local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
					local opts = { noremap = true, silent = true }

					-- Keymaps for LSP
					buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
					buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
					buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
				end,
			})
			lspconfig.pyright.setup({
				on_attach = function(client, bufnr)
					local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
					local opts = { noremap = true, silent = true }

					-- Keymaps for LSP
					buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
					buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
					buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
				end,
			})
			lspconfig.rust_analyzer.setup({
				on_attach = function(client, bufnr)
					local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
					local opts = { noremap = true, silent = true }

					-- Keymaps for LSP
					buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
					buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
					buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
				end,
			})
			lspconfig.tsserver.setup({
				on_attach = function(client, bufnr)
					local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
					local opts = { noremap = true, silent = true }

					-- Keymaps for LSP
					buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
					buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
					buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
				end,
			})
		end,
	},
	{
		"MysticalDevil/inlay-hints.nvim",
		after = "neovim/nvim-lspconfig", -- Ensure this is loaded after nvim-lspconfig
		config = function()
			require("inlay-hints").setup({
				autocmd = { enable = true },  -- Enable the inlay hints on LspAttach event
				commands = { enable = true }, -- Enable InlayHints commands
			})

			-- Function to enable inlay hints for specific LSP servers
			local function enable_inlay_hints(client)
				if client.supports_method("textDocument/inlayHint") then
					require("inlay-hints").on_attach(client)
				end
			end

			-- Set up inlay hints for specific servers
			local lspconfig = require("lspconfig")
			for _, server in ipairs({ "clangd", "pyright", "rust_analyzer", "tsserver" }) do
				lspconfig[server].setup({
					on_attach = function(client, bufnr)
						enable_inlay_hints(client)
					end,
				})
			end
		end,
	},
}

