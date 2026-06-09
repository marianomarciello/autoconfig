return {
    {
        "saghen/blink.cmp",
        opts = function(_, opts)
            opts.keymap = {
                preset = "super-tab",
                ["<C-y>"] = { "select_next" },
                ["<C-p>"] = { "select_prev" },
                ["<C-Space>"] = { "accept" },
            }
        end,
    },
}
