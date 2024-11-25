function _fzf-kill --description "Search and kill selected processes"
    set -f pid
    set -f uid (id -u)

    if test $uid != "0"
        set pid (ps -f -u $uid | sed 1d | fzf -m | awk '{print $2}')
    else
        set pid (ps -ef | sed 1m | fzf -m | awk '{print $2}')
    end

    if test "x$pid" != "x"
        echo $pid | xargs kill -9
    end

    commandline --function repaint
end
