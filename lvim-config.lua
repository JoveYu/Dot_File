vim.opt.list = true
lvim.plugins = {
  { "ishan9299/nvim-solarized-lua" },
}
lvim.colorscheme = "solarized"
lvim.transparent_window = true
lvim.autocommands = {
  { "TermOpen", { pattern = { "*" }, command = "setlocal nonumber norelativenumber signcolumn=no" } },
}
lvim.builtin.telescope.defaults.file_ignore_patterns = {
  "vendor/",
  "__pycache__/",
  "node_modules/",
  ".git/",
  ".idea/",
  ".vscode/",
}
lvim.builtin.cmp.window = {}
lvim.builtin.cmp.formatting.fields = { "abbr", "kind", "menu" }
