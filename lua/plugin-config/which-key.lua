-- https://github.com/folke/which-key.nvim

local wk = require("which-key")
local mappings = {
  q = {
    name = "Quit",
    q = { ":q<CR>", "Quit" },
    w = { ":wq<CR>", "Save & Quit" },
  },
  b = {
    name = "buffer",
    c = {
      name = "close",
      h = { ":BufferLineCloseLeft<CR>", "Close left buffer" },
      l = { ":BufferLineCloseRight<CR>", "Close right buffer" },
      p = { ":BufferLinePickClose<CR>", "Pick buffer to close" }
    },
    h = { ":BufferLineCyclePrev<CR>", "switch to previous buffer" },
    l = { ":BufferLineCycleNext<CR>", "switch to next buffer" },
    p = { ":BufferLinePick<CR>", "Pick buffer" }
  },
  e = { ":e ~/.config/nvim/init.vim<CR>", "Edit config" },
  f = {
    name = "files",
    f = { ":Telescope find_files<CR>", "Telescope Find Files" },
    s = { ":w<CR>", "Save" }
  },
  o = {
    name = "open",
    t = { ":NvimTreeToggle<CR>", "Open files manager" }
  },
  r = { ":Telescope live_grep<CR>", "Telescope Live Grep" },
  g = { '<Plug>(lsp-previous-diagnotics)<CR>', 'Show line diagnostics' },
  l = {
    name = "LSP",
    i = { ":LspInfo<cr>", "Connected Language Servers" },
  },
  s = {
    name = "easymotion",
    f = { "<Plug>(easymotion-f)", "Find {char} to the right. See f." },
    F = { "<Plug>(easymotion-F)", "Find {char} to the left. See F." },
    t = { "<Plug>(easymotion-t)", "Till before the {char} to the right. See t." },
    T = { "<Plug>(easymotion-T)", "Till after the {char} to the left. See T." },
    w = { "<Plug>(easymotion-w)", "Beginning of word forward. See w." },
    W = { "<Plug>(easymotion-W)", "Beginning of WORD forward. See W." },
    b = { "<Plug>(easymotion-b)", "Beginning of word backward. See b." },
    B = { "<Plug>(easymotion-B)", "Beginning of WORD backward. See B." },
    e = { "<Plug>(easymotion-e)", "End of word forward. See e." },
    E = { "<Plug>(easymotion-E)", "End of WORD forward. See E." },
    g = {
      name = "End of word/WORD background",
      e = { "<Plug>(easymotion-ge)", "End of word backward. See ge." },
      E = { "<Plug>(easymotion-gE)", "End of WORD backward. See gE." },
    },
    j = { "<Plug>(easymotion-j)", "Line downward. See j." },
    k = { "<Plug>(easymotion-k)", "Line upward. See k." },
    n = { "<Plug>(easymotion-n)", "Jump to latest \"/\" or \"?\" forward. See n." },
    N = { "<Plug>(easymotion-N)", "Jump to latest \"/\" or \"?\" backward. See N." },
    s = { "<Plug>(easymotion-s)", "Find(Search) {char} forward and backward.See f and F." }
  },
  y = {
    name = "youdao cloud dictionary",
    d = { ":<C-u>Yde<CR>", "input words to translate" },
    o = { ":<C-u>Ydc<CR>", "translate words at your point" }
  }
}
wk.register(mappings, { prefix = "<leader>", noremap = true, silent = true })

wk.register({
  ["b"] = { name = "Comment block" },
  ["c"] = { name = "Comment" }
}, { prefix = "g", noremap = true, silent = true })

local export = {}
export.lsp_on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local lspmapping = { g = {
    a = { vim.lsp.buf.code_action, "code action" },
    D = { vim.lsp.buf.declaration, "declaration" },
    d = { vim.lsp.buf.definition, "definition" },
    h = { vim.lsp.buf.hover, "hover" },
    i = { vim.lsp.buf.implementation, "implementation" },
    k = { vim.lsp.buf.signature_help, "signature help" },
    r = {
      name = "references+rename",
      r = { vim.lsp.buf.references, "references" },
      n = { vim.lsp.buf.rename, "rename" },
    },
    t = {
      name = "diagnostic goto",
      e = { vim.diagnostic.open_float, 'Show line diagnostic' },
      n = { vim.diagnostic.goto_next, "goto_next" },
      p = { vim.diagnostic.goto_prev, "goto_prev" },
      q = { vim.diagnostic.set_loclist, 'Set loclist' },
    },
  },
    leader = {
      l = {
        name = "LSP",
        a = { vim.lsp.buf.add_workspace_folder, "add workspace folder" },
        r = { vim.lsp.buf.remove_workspace_folder, "remove workspace folder" },
        l = { function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "list workspace folder" },
        f = { function() vim.lsp.buf.format { async = true } end, "format buffer" },
      }
    }
  }

  wk.register(lspmapping.g, { prefix = "g", buffer = bufnr, noremap = true, silent = true })
  wk.register(lspmapping.leader, { prefix = "<leader>", buffer = bufnr, noremap = true, silent = true })
end

return export
