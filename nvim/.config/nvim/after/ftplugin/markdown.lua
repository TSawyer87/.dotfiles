local function augroup(name)
    return vim.api.nvim_create_augroup(name, { clear = true })
end
vim.api.nvim_create_autocmd("FileType", {
    group = augroup "various_textobjs_mklink",
    pattern = { "markdown", "toml" },
    callback = function()
        map(
            { "o", "x" },
            "il",
            "<cmd>lua require('various-textobjs').mdlink(true)<CR>",
            { buffer = true, noremap = true, silent = true, desc = "inner link" }
        )
        map(
            { "o", "x" },
            "al",
            "<cmd>lua require('various-textobjs').mdlink(false)<CR>",
            { buffer = true, noremap = true, silent = true, desc = "around link" }
        )
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = augroup "various_textobjs_mk_fenced_code_block",
    pattern = { "markdown" },
    callback = function()
        map(
            { "o", "x" },
            "iC",
            "<cmd>lua require('various-textobjs').mdFencedCodeBlock(true)<CR>",
            { buffer = true, noremap = true, silent = true, desc = "inner fenced code block" }
        )
        map(
            { "o", "x" },
            "aC",
            "<cmd>lua require('various-textobjs').mdFencedCodeBlock(false)<CR>",
            { buffer = true, noremap = true, silent = true, desc = "around fenced code block" }
        )
    end,
})
