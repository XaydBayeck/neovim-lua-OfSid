require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "rust", "lua", "haskell", "cpp", "html", "javascript", "typescript"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
