return {
    {
        'echasnovski/mini.animate',
        event = 'VeryLazy',
        enabled = false,
        opts = function()
            local animate = require 'mini.animate'
            return {
                resize = {
                    enable = false,
                    timing = animate.gen_timing.quadratic {
                        duration = 64,
                        unit = 'total',
                    },
                },
                open = {
                    enable = false,
                    timing = animate.gen_timing.quadratic {
                        duration = 64,
                        unit = 'total',
                    },
                },
                close = {
                    enable = false,
                    timing = animate.gen_timing.quadratic {
                        duration = 64,
                        unit = 'total',
                    },
                },
                cursor = {
                    enable = false,
                },
                scroll = {
                    timing = animate.gen_timing.quadratic {
                        duration = 24,
                        unit = 'total',
                    },
                    subscroll = animate.gen_subscroll.equal {
                        predicate = function(total_scroll)
                            return total_scroll > 1
                        end,
                    },
                },
            }
        end,
    },
}
-- vim: ts=2 sts=2 sw=2 et
