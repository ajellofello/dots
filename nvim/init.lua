-- PACKS
local gh = function(path) return "https://github.com/" .. path end

vim.api.nvim_create_user_command("Packls",   function(opts) vim.pack.update(nil, { offline = true }) end, { nargs = 0   }) -- Lists all installed packages
vim.api.nvim_create_user_command("Packdel",  function(opts) vim.pack.del(opts.fargs) end,                 { nargs = "+" }) -- Deletes given packages
vim.api.nvim_create_user_command("Packup", -- Updates given packages if none are given all will be updated
  function(opts)
    if opts.fargs[1] == nil then
      opts.fargs = nil
    end

    vim.pack.update(opts.fargs)
  end,
  { nargs = "*" })

vim.api.nvim_create_user_command("Packadd", -- Installs the given packages
  function(opts) 
    local fullpaths = {}
    for _, path in ipairs(opts.fargs) do
      table.insert(fullpaths, gh(path))
    end
    vim.pack.add(fullpaths)
  end,
  { nargs = "+" })

vim.pack.add({
  gh("neanias/everforest-nvim"),
  { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
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
    hl["@constant"] = { fg = palette.purple }
    hl["@string"] = { fg = palette.yellow }
    hl["@character"] = { fg = palette.yellow }
    hl["@type.builtin"] = { fg = palette.blue }
    hl["@type.definition.c"] = { fg = palette.blue }
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
vim.o.timeoutlen = 200
vim.o.list = true
vim.o.listchars = "tab:» ,space:.,lead:.,trail:."
vim.o.shm = "I"
vim.o.wrap = false
vim.g.c_syntax_for_h = true

vim.cmd([[ colorscheme everforest ]])

-- BINDS
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>pl', "<CMD>:Packls<CR>")
vim.keymap.set('n', '<leader>pu', "<CMD>:Packup<CR>")
vim.keymap.set('n', '<leader>pd', ":Packdel <Insert>")
vim.keymap.set('n', '<leader>pa', ":Packadd <Insert>")

vim.keymap.set('n', '<leader>ff', ":e <Insert>") -- open a file
vim.keymap.set('n', '<leader>r', function() -- refresh configuration
  vim.cmd([[ w ]])
  vim.cmd([[ source ]])
  vim.cmd([[ restart ]])
end)

