-- https://github.com/folke/which-key.nvim

local wk = require("which-key")
local mappings = {
  q = {
    name = "Quit",
    q = {":q<CR>", "Quit"},
    w = {":wq<CR>", "Save & Quit"},
  },
  w = {
    name = "window",
    d = {"<C-w>c", "Close window"},
  },
  b = {
    name = "buffer",
    c = {
      name = "close",
      h = {":BufferLineCloseLeft<CR>", "Close left buffer"},
      l = {":BufferLineCloseRight<CR>", "Close right buffer"},
      p = {":BufferLinePickClose<CR>", "Pick buffer to close"}
    },
    p = {":BufferLinePick<CR>", "Pick buffer"}
  },
  e = {":e ~/.config/nvim/init.vim<CR>" , "Edit config"},
  f = {
    name = "files",
    f = {":Telescope find_files<CR>","Telescope Find Files"},
    s = {":w<CR>", "Save"}
  },
  o ={name="open"},
  r = {":Telescope live_grep<CR>","Telescope Live Grep"},
  a = {'<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code action'},
  g = {'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>','Show line diagnostics'},
  l = {
    name = "LSP",
    i = {":LspInfo<cr>", "Connected Language Servers"},
    A = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>','Add workspace folder'},
    R = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>','Remove workspace folder'},
    l = {'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'List workspace'},
    D = {'<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type definition'},
    r = {'<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename'},
    a = {'<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code action'},
    e = {'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', 'Show line diagnostic'},
    q = {'<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', 'Set loclist'},
    f = {'<cmd>lua vim.lsp.buf.formatting()<CR>', 'Format'}
  },
  s = {
    name = "easymotion",
    f = {"<Plug>(easymotion-f)", "Find {char} to the right. See f."},
    F = {"<Plug>(easymotion-F)", "Find {char} to the left. See F."},
    t = {"<Plug>(easymotion-t)", "Till before the {char} to the right. See t."},
    T = {"<Plug>(easymotion-T)", "Till after the {char} to the left. See T."},
    w = {"<Plug>(easymotion-w)", "Beginning of word forward. See w."},
    W = {"<Plug>(easymotion-W)", "Beginning of WORD forward. See W."},
    b = {"<Plug>(easymotion-b)", "Beginning of word backward. See b."},
    B = {"<Plug>(easymotion-B)", "Beginning of WORD backward. See B."},
    e = {"<Plug>(easymotion-e)", "End of word forward. See e."},
    E = {"<Plug>(easymotion-E)", "End of WORD forward. See E."},
    g = {
      name = "End of word/WORD background",
      e = {"<Plug>(easymotion-ge)", "End of word backward. See ge."},
      E = {"<Plug>(easymotion-gE)", "End of WORD backward. See gE."},
    },
    j = {"<Plug>(easymotion-j)", "Line downward. See j."},
    k = {"<Plug>(easymotion-k)", "Line upward. See k."},
    n = {"<Plug>(easymotion-n)", "Jump to latest \"/\" or \"?\" forward. See n."},
    N = {"<Plug>(easymotion-N)", "Jump to latest \"/\" or \"?\" backward. See N."},
    s = {"<Plug>(easymotion-s)", "Find(Search) {char} forward and backward.See f and F."}
  },
  y = {
    name = "youdao cloud dictionary",
    d = {":<C-u>Yde", "input words to translate"}
  }
}
wk.register(mappings, { prefix = "<leader>" })



