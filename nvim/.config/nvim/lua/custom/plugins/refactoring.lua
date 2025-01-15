return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    { '<leader>re',  ':Refactor extract ',              mode = 'x',          desc = ':Refactor extract ' },
    { '<leader>rf',  ':Refactor extract_to_file ',      mode = 'x',          desc = ':Refactor extract_to_file ' },
    { '<leader>rv',  ':Refactor extract_var ',          mode = 'x',          desc = ':Refactor extract_var ' },
    { '<leader>ri',  ':Refactor inline_var',            mode = { 'n', 'x' }, desc = ':Refactor inline_var' },
    { '<leader>rI',  ':Refactor inline_func',           mode = 'n',          desc = ':Refactor inline_func' },
    { '<leader>rb',  ':Refactor extract_block',         mode = 'n',          desc = ':Refactor extract_block' },
    { '<leader>rtf', ':Refactor extract_block_to_file', mode = 'n',          desc = ':Refactor extract_block_to_file' },
  },
}
