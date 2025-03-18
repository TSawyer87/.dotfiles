zoxide init nushell | save -f ~/.zoxide.nu
$env.XDG_DATA_HOME = "~/.local/share"

$env.NUPM_HOME = ($env.XDG_DATA_HOME | default "~/.local/share" | path join "nupm") #or ~/.config/nushell/nupm if you want it there.
$env.NU_LIB_DIRS = [
    # ...
    ($env.NUPM_HOME | path join "modules")
]

$env.PATH = (
    $env.PATH
        | split row (char esep)
        | prepend ($env.NUPM_HOME | path join "scripts")
        | uniq
)
