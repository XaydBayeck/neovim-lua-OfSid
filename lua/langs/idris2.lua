require("idris2").setup {
  client = {
    hover = {
      use_split = false, -- Persistent split instead of popups for hover
      split_size = '30%', -- Size of persistent split, if used
      auto_resize_split = false, -- Should resize split to use minimum space
      split_position = 'bottom', -- bottom, top, left or right
      with_history = false, -- Show history of hovers instead of only last
      use_as_popup = false, -- Close the split on cursor movement
    },
  },
  server = {}, -- Options passed to lspconfig idris2 configuration
  autostart_semantic = true, -- Should start and refresh semantic highlight automatically
  -- code_action_post_hook = function(action) end, -- Function to execute after a code action is performed:
  use_default_semantic_hl_groups = true, -- Set default highlight groups for semantic tokens
  default_regexp_syntax = true, -- Enable default highlight groups for traditional syntax based highlighting
}

