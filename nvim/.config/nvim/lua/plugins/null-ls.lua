return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      local nls_diagnostics = nls.builtins.diagnostics
      local nls_formatting = nls.builtins.formatting
      local diagnostics = {
        -- The linter that needs to be added is loaded here
        -- nls_diagnostics.golangci_lint.with(require("plugins.extras.lsp.null-ls.diagnostics.golangci_lint")),
        -- nls_diagnostics.buf.with(require("plugins.extras.lsp.null-ls.diagnostics.buf")),
        nls_diagnostics.ruff.with({ only_local = ".venv/bin" }),
        -- nls_diagnostics.mypy.with(require("plugins.extras.mypy")),
        nls_diagnostics.mypy.with({ only_local = ".venv/bin" }), --.with(require("plugins.extras.mypy")),
      }
      local formatting = {
        -- The formatter that needs to be added is loaded here
        -- nls_formatting.goimports.with(require("plugins.extras.lsp.null-ls.formatting.goimports")),
        -- nls_formatting.buf.with(require("plugins.extras.lsp.null-ls.formatting.buf")),
        nls_formatting.black.with({ only_local = ".venv/bin", timeout = 5000 }),
        nls_formatting.isort.with({ only_local = ".venv/bin", timeout = 5000 }),
      }
      if type(opts.sources) == "table" then
        opts.sources = vim.list_extend(opts.sources, diagnostics)
        opts.sources = vim.list_extend(opts.sources, formatting)
      end
      opts.debug = true
    end,
  },
}
