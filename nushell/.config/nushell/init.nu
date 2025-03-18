# commands
export def egd [...rest] {
    with-env [GIT_EXTERNAL_DIFF 'difft'] { git diff $rest }
}

# we need to export the env we create with load-env
# because we are `use`-ing here and not `source`-ing this file
export-env {
    load-env {
        BROWSER: "zen-browser"
        CARGO_TARGET_DIR: "~/.cargo/target"
        EDITOR: "hx"
        VISUAL: "hx"
        PAGER: "bat"
        SHELL: "/usr/bin/nu"
        SHOW_USER: true
    }
}

