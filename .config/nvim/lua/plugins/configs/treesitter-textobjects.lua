local status_ok, textobject = pcall(require, "nvim-treesitter-textobjects")
if not status_ok then
    vim.notify("treesistter-textobject not loaded", vim.log.levels.ERROR)
    return
end

textobject.setup({
    select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
        },
    },
})
