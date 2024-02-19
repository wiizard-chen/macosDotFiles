function peco_select_zellij
    if test (count $argv) = 0
        set peco_flags --layout=bottom-up
    else
        set peco_flags --layout=bottom-up --query "$argv"
    end

    zellij list-sessions
    # | peco $peco_flags | read foo

    # if [ $foo ]
    #     echo $foo
    #     # commandline $foo
    # else
    #     # commandline ''
    # end
end
