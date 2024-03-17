--  File for configuring Neovim keybinds/keymaps 
--

-------------------------------------------------------------------------------
-- GENERAL KEYMAPS FOR BETTER DEFAULT EXPERIENCE
-- See `:help vim.keymap.set()`

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Highlight on yank:
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Replace all with sed:
vim.keymap.set('n', 'S', ':%s//g<Left><Left>', {})

-------------------------------------------------------------------------------
-- NERDTREE KEYMAPS

-- Nerd tree open and close shortcut:
vim.cmd[[nnoremap <leader>t :NERDTreeToggle<CR>]]

-------------------------------------------------------------------------------
-- TELESCOPE KEYMAPS
-- See `:help telescope.builtin`

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-------------------------------------------------------------------------------
-- TAB KEYMAPS

-- Move back and forth between tabs:
vim.keymap.set('n', '<A-Q>', '<Cmd>BufferPrevious<CR>', {})
vim.keymap.set('n', '<A-q>', '<Cmd>BufferNext<CR>', {})

-- Go to specific tab:
vim.keymap.set('n', 'A-1', '<Cmd>BufferGoto 1<CR>', {})
vim.keymap.set('n', 'A-2', '<Cmd>BufferGoto 2<CR>', {})
vim.keymap.set('n', 'A-3', '<Cmd>BufferGoto 3<CR>', {})
vim.keymap.set('n', 'A-4', '<Cmd>BufferGoto 4<CR>', {})
vim.keymap.set('n', 'A-5', '<Cmd>BufferGoto 5<CR>', {})
vim.keymap.set('n', 'A-6', '<Cmd>BufferGoto 6<CR>', {})
vim.keymap.set('n', 'A-7', '<Cmd>BufferGoto 7<CR>', {})
vim.keymap.set('n', 'A-8', '<Cmd>BufferGoto 8<CR>', {})
vim.keymap.set('n', 'A-9', '<Cmd>BufferGoto 9<CR>', {})

-- Pin a tab:
vim.keymap.set('n', '<A-p>', '<Cmd>BufferPin<CR>', {})

-- Close a tab:
vim.keymap.set('n', '<A-w>', '<Cmd>BufferClose<CR>', {})

-------------------------------------------------------------------------------
-- DIAGNOSTIC KEYMAPS

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-------------------------------------------------------------------------------
-- GODOT SPECIFIC

vim.keymap.set('n', '<leader>gdl', ':GodotRunLast<CR>', { desc = 'Run last Godot command' })
vim.keymap.set('n', '<leader>gdr', ':GodotRun ', { desc = 'Run specified Godot scene' })
vim.keymap.set('n', '<leader>gdc', ':GodotRunCurrent<CR>', { desc = 'Run the current Godot scene' })
vim.keymap.set('n', '<leader>gdf', ':GodotRunFZF<CR>', { desc = 'Run fuzzy finder to choose a Godot scene' })
