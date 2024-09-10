local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

vim.keymap.set({ "i" }, "<C-K>", function()
    ls.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function()
    ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
    ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })

ls.add_snippets("markdown", {
    s("frontmatter", {
        t({ "---", "title:" }),
        i(1, "Document Title"),
        t({ "", "date: " }),
        i(2, os.date("%Y-%m-%d")),
        t({ "", "tags: [" }),
        i(3, "tag1, tag2"),
        t({ "]", "---", "" }),
        i(2), -- Insert cursor after line 2 (title)
    }),
})
