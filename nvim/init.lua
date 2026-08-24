-- PACKS
vim.pack.add({
  "https://github.com/neanias/everforest-nvim",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})
require("everforest").setup({
  background = "hard",
  italics = false,
  disable_italic_comments = true,
  sign_column_background = "none",
  float_style = "dim",
  colours_override = function(palette)
    -- swap bg0 with bg_dim
    palette.bg0 = palette.bg_dim
    palette.bg_dim = "#272e33"
  end,
  on_highlights = function(hl, palette)
    hl.FloatBorder = { fg = palette.bg_dim }
    hl.NormalFloat = { bg = palette.bg0 }
    hl.ModeMsg = { fg = palette.blue }
    hl["@keyword.conditional.ternary"] = { fg = palette.orange }
    hl["@string"] = { fg = palette.yellow }
    hl["@character"] = { fg = palette.yellow }
    hl["@type.builtin"] = { fg = palette.blue }
    hl["@type"] = { fg = palette.blue }
    hl["@lsp.type.class"] = { fg = palette.blue }
    hl["@lsp.type.enum"] = { fg = palette.blue }
    hl["@lsp.type.union"] = { fg = palette.blue }
    hl["@keyword.modifier"] = { fg = palette.red }
  end,
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
vim.o.signcolumn = "no"
vim.o.timeoutlen = 200
vim.o.list = true
vim.o.listchars = "tab:» ,space:.,lead:.,trail:."
vim.o.shm = "I"
vim.o.wrap = false
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

vim.cmd([[ colorscheme everforest ]])
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
  vim.cmd([[ w ]])
  vim.cmd([[ source ]])
  vim.cmd([[ restart ]])
end)

