local ht = require('haskell-tools')
local wk = require('which-key')
local def_opts = { prefix = "<leader>", noremap = true, silent = true, }
local default_on_attach = require("lspconfig").util.default_config.on_attach

ht.setup {
  hls = {
    -- See nvim-lspconfig's  suggested configuration for keymaps, etc.
    on_attach = function(client, bufnr)

      local opts = vim.tbl_extend('keep', def_opts, { buffer = bufnr, })
      -- haskell-language-server relies heavily on codeLenses,
      -- so auto-refresh (see advanced configuration) is enabled by default
      wk.register({
        ["lc"] = { vim.lsp.codelens.run, "Code Lens" },
        ["hs"] = { ht.hoogle.hoogle_signature, "Hoogle signature" }
      }, opts)

      default_on_attach(client, bufnr) -- if defined, see nvim-lspconfig
    end,
  },
}
-- Suggested keymaps that do not depend on haskell-language-server
wk.register({
  h = {
    name = ">>=",
    r = { ht.repl.toggle, "toggle haskell repl for the current package" },
    f = {
      function()
        ht.repl.toggle(vim.api.nvim_buf_get_name(0))
      end,
      "toggle haskell repl for the current buffer"
    },
    q = { ht.repl.quit, "quit haskell repl" }
  }
}, def_opts)
