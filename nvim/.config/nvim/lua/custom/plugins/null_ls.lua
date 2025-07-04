return {
  'nvimtools/none-ls.nvim',
  -- enabled = false,
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'mason.nvim' },
  opts = function()
    local nls = require 'null-ls'
    return {
      root_dir = require('null-ls.utils').root_pattern('.null-ls-root', '.neoconf.json', 'Makefile', '.git'),
      sources = {
        nls.builtins.formatting.fish_indent,
        nls.builtins.diagnostics.fish,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.prettier,
        nls.builtins.diagnostics.mypy.with { prefer_local = '.venv/bin', temp_dir = '/tmp' },
      },
    }
  end,
}
