function _peco_select_zellij
    if test (count $argv) = 0
        set peco_flags --layout=bottom-up
    else
        set peco_flags --layout=bottom-up --query "$argv"
    end
end

function peco_select_zellij
    zellij list-sessions | wc -l | read count

    set count_flag 1
    set zero_flag 0

    if test $count -eq $zero_flag
        zellij attach -c dev_test
    else 
        if test $count -eq $count_flag
            zellij list-sessions | read tmp
            echo $tmp | sed -r "s/\x1B\[[0-9;]*[mK]//g" | sed 's/ \[.*$//'| read foo
        end

        if test $count -gt $count_flag
            zellij list-sessions | peco $peco_flags --layout=bottom-up | read tmp
            echo $tmp | sed -r "s/\x1B\[[0-9;]*[mK]//g" | sed 's/ \[.*$//' | read foo
        end
        # echo 'tmp is '
        # echo $tmp
        # echo 'foo is '
        # echo $foo

        if [ $foo ]
            zellij attach $foo
        else
            commandline ''
        end
    end
end
