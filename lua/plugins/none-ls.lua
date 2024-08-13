return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Formatting
        -- luafmt
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.formatting.clang_format.with({
          extra_args = { "--style=file" },
          filetypes = { "c", "cpp", "objc", "objcpp" },
        }),
        -- Ensures the .clang-format file is used

      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
