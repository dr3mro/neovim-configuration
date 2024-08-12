-- lsp-inlay-hints.lua
return {
	"neovim/nvim-lspconfig",
	config = function()
		-- Function to set up inlay hints for LSP clients that support it
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client.supports_method("textDocument/inlayHint") and type(vim.lsp.inlay_hint) == "function" then
					vim.lsp.inlay_hint(event.buf, true)
					vim.keymap.set("n", "<leader>th", function()
						vim.lsp.inlay_hint(event.buf, nil)
					end, { buffer = event.buf, desc = "[T]oggle Inlay [H]ints" })
				end
			end,
		})
	end,
}
