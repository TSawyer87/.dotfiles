return {
    {
        "CRAG666/code_runner.nvim",
        cmd = "RunCode",
        enabled = true,
        keys = {
            { "<leader>cr", ":RunCode<cr>", desc = "Code Runner" },
        },
        dependencies = "nvim-lua/plenary.nvim",
        opts = {
            mode = "toggleterm",
            startinsert = true,
            filetype = {
                c = "cd $dir && clang $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
                cpp = "cd $dir && clang++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
                go = "go run",
                haskell = "runhaskell",
                lua = "luajit",
                javascript = "node",
                ["objective-c"] = "cd $dir && gcc -framework Cocoa $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
                python = "python3 -u",
                r = "Rscript",
                rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
                typescript = "ts-node",

                zsh = "$dir/$fileName",
                bash = "$dir/$fileName",
                shell = "$dir/$fileName",
            },
        },
    },
}
