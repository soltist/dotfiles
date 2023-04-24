return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = true,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*",
  opts = {
    languages = {
      python = {
        template = {
          annotation_convention = "reST",
        },
      },
    },
  },
}
