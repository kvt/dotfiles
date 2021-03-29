require('plugins')
require('config')

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and [[\<C-n>]] or [[\<Tab>]]
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
