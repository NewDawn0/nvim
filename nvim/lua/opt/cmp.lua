local map = vim.keymap.set

require("blink.cmp").setup({
  keymap = {
    preset = "none",
    -- Completion
    ["<CR>"] = { "accept", "fallback" },
    ["<C-c>"] = { "cancel", "fallback" },
    ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    -- Documentation
    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    ["<C-d>"] = { "show_documentation", "hide_documentation", "fallback" },
    -- Signature
    ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
  },
  completion  = { documentation = { auto_show = false } },
  snippets    = { preset = "luasnip" },
  sources     = { default = { "lsp", "path", "buffer", "snippets" } },
})
