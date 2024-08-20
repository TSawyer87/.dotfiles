return {
    {
        'mrjones2014/smart-splits.nvim',
        lazy = true,
        config = function()
            require 'plugins.configs.smart-splits'
        end,
    },
    {
        'norcalli/nvim-colorizer.lua',
        lazy = true,
        cmd = {
            'ColorizerAttachToBuffer',
            'ColorizerReloadAllBuffers',
            'ColorizerDetachFromBuffer',
            'ColorizerToggle',
        },
        config = true,
    },
    {
        'adelarsq/image_preview.nvim',
        event = 'VeryLazy',
        config = function()
            require('image_preview').setup()
        end,
    },
}
