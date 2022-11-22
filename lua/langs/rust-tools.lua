-- rust-tools options
local rt = require("rust-tools")
rt.setup({
  tools = {
    inlay_hints = {
      auto = true,
      show_parameter_hints = true,
      parameter_hints_prefix = ":: ",
      other_hints_prefix = "-> ",
    },
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
      settings = {
          -- to enable rust-analyzer settings visit:
          -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
          ["rust-analyzer"] = {
              -- enable clippy on save
              checkOnSave = {
                  command = "clippy"
              },
          }
      }
  },
})

-- Command:
-- RustSetInlayHints
-- RustDisableInlayHints
-- RustToggleInlayHints

-- set inlay hints
rt.inlay_hints.enable()
