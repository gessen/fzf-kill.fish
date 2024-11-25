status is-interactive || exit

function _fzf-kill-fish-key-bindings --on-variable fish_key_bindings
    set -l modes
    if test "$fish_key_bindings" = fish_default_key_bindings
        set modes default insert
    else
        set modes insert default
    end

    bind --mode $modes[1] \cx\ck _fzf-kill
end

_fzf-kill-fish-key-bindings

function _fzf-kill-uninstall --on-event fzf-kill_uninstall
    bind --erase \cx\ck
    functions --erase (functions --all | string match "_fzf-kill-*")
end
