vim.opt.cmdheight = 1
lvim.plugins = {
  { "ishan9299/nvim-solarized-lua" },
  -- { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' },
}
lvim.colorscheme = "solarized"
lvim.transparent_window = true
lvim.autocommands = {
  { "TermOpen", { pattern = { "*" }, command = "setlocal nonumber norelativenumber" } },
}
lvim.builtin.telescope.defaults.file_ignore_patterns = {
  "vendor/",
  "__pycache__/",
  "node_modules/",
  ".git/",
  ".idea/",
  ".vscode/",
}
-- lvim.builtin.cmp.window = {}