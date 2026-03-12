local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{
			"LazyVim/LazyVim",
			import = "lazyvim.plugins",
		},
		{
			"saghen/blink.cmp",
			opts = {
				keymap = {
					["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
					["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
				},
				completion = {
					list = {
						selection = {
							preselect = false,
						},
					},
				},
			},
		},
	},
	defaults = {
		lazy = false,
		version = false, -- always use the latest git commit
	},
	install = { colorscheme = { "tokyonight", "habamax" } },
	checker = {
		enabled = true, -- check for plugin updates periodically
		notify = false, -- notify on update
	}, -- automatically check for plugin updates
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

vim.opt.relativenumber = false
vim.g.autoformat = false
vim.opt.list = true
vim.opt.listchars = {
  tab = '»»',       -- Tab 键显示为 » 加一个空格
  trail = '•',      -- 行尾多余的空格显示为点
  nbsp = '␣',       -- 不换行空格
  extends = '→',    -- 当设置了 nowrap 时，行向右延伸的指示
  precedes = '←',   -- 当设置了 nowrap 时，行向左延伸的指示
  -- eol = '↲',        -- 每一行的结尾显示换行符 (可选)
}
vim.opt.showbreak = "↳"
