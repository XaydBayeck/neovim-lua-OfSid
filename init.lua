-- 基础设置
require('basic')
-- Packer插件管理
require('plugins')
-- 快捷键映射
require('keybindings')

-- 插件配置
require('plugin_config')

-- vim.keymap.del('n', 'gb')
-- vim.keymap.del('n', 'gc')

-- lsp
require('lsp/nvim-cmp-config')
require('lsp/diagnostic_signs')
require('lsp/language_servers')

-- language support
require("langs")

-- 复制到windows剪贴板
-- https://stackoverflow.com/questions/44480829/how-to-copy-to-clipboard-in-vim-of-bash-on-windows
-- autocmd TextYankPost * if v:event.operator ==# 'y' | call system('/mnt/c/Windows/System32/clip.exe', @0) | endif
