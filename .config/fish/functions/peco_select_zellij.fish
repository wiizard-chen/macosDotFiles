function peco_select_zellij
    if test (count $argv) = 0
        set peco_flags --layout=bottom-up
    else
        set peco_flags --layout=bottom-up --query "$argv"
    end

    zellij list-sessions | wc -l | read count

    set count_flag 1
    echo $count
    if test $count -gt $count_flag
        zellij list-sessions | peco $peco_flags | read tmp
        echo $tmp  | sed -r "s/\x1B\[[0-9;]*[mK]//g" | grep -o '[a-zA-Z]*' | read foo
    else 
        zellij list-sessions | read tmp
        echo $tmp  | sed -r "s/\x1B\[[0-9;]*[mK]//g" | grep -o '[a-zA-Z]*' | read foo
    end

    if [ $foo ]
        zellij attach $foo
    else
        commandline ''
    end
end
