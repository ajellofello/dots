-- PACKS
vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/oskarnurm/koda.nvim",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require("koda").setup({
  theme = {
    dark = "dark",
  },
  styles = {
    functions = { bold = false },
    comments  = { italic = true }
  },
  on_highlights = function(hl, _)
    hl["@keyword.directive.bash"] = { fg = "#8ebeec" }
    hl["@variable.bash"]          = { fg = "#d9ba73" }
    hl["@type.builtin"]           = { fg = "#d9ba73" }
    hl["@type"]                   = { fg = "#d9ba73" }
    hl["@string"]                 = { fg = "#777777" }
  end
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    "c", "C",
    "h", "H",
    "lua",
    "toml",
    "yaml",
    "json", "jsonc",
    "bash", "zsh", "sh",
    "css", "html", "javascript"
  },
  callback = function()
    vim.treesitter.start()
  end,
})
vim.lsp.enable({ "lua_ls", "clangd" })

-- OPTIONS
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.scrolloff = 8
vim.o.cul = true
vim.o.culopt = "number"
vim.o.winborder = "single"
vim.o.clipboard = "unnamedplus"
vim.o.background = "dark"
vim.o.laststatus = 0
vim.o.swapfile = false
vim.o.signcolumn = "yes"
vim.o.cot = "fuzzy,menu"
vim.o.timeoutlen = 200
vim.diagnostic.config({
  float = true,
  severity_sort = false,
  signs = true,
  status = false,
  underline = false,
  virtual_text = false,
  virtual_lines = false,
})
vim.g.c_syntax_for_h = true

vim.cmd([[ colorscheme koda ]])

vim.cmd([[
  set guicursor=n-v-c:block,i-ci-ve-r-cr-o:hor50
]])

-- BINDS
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>d',  vim.diagnostic.open_float) -- check diagsnotic

 -- move to next/previous diagnostic 
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev)

vim.keymap.set('n', '<leader>ff', ":e <Insert>") -- open a file
vim.keymap.set('n', '<leader>r', function() -- refresh configuration
  vim.cmd([[ :w ]])
  vim.cmd([[ :source ]])
  vim.cmd([[ :restart ]])
end)

