return {
        'nvim-telescope/telescope-file-browser.nvim',
        cond = cond,
        dependencies = {
                { 'nvim-telescope/telescope.nvim' },
        },
        event = { 'CmdLineEnter', 'CursorHold' },
}
