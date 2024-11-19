status is-interactive || exit

function fzf-kill-key-bindings --on-variable fish_key_bindings
    set -l modes
    if test "$fish_key_bindings" = fish_default_key_bindings
        set modes default insert
    else
        set modes insert default
    end

    bind --mode $modes[1] \cx\ck fzf-kill-widget
end

fzf-kill-key-bindings

function fzf-kill-uninstall --on-event fzf-kill_uninstall
    bind --erase \cx\ck
    functions --erase (functions --all | string match "fzf-kill-*")
end
