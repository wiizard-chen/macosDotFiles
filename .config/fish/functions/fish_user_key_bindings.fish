function paste_from_clipboard
    # echo test
    set clipboard_contents (pbpaste)
    commandline -i $clipboard_contents
end

function fish_user_key_bindings
    # peco
    # Bind for peco select history to Ctrl+R
    bind \cr peco_select_history

    # bind \cf peco_change_directory # Bind for peco change directory to Ctrl+F
    # Bind for peco change directory to Ctrl+O
    bind \co peco_change_directory

    # vim-like
    # bind \cl forward-char

    # paste
    bind \cy paste_from_clipboard

    #bind \ci clear

    # prevent iterm2 from closing when typing Ctrl-D (EOF)
    # bind \cd delete-char
end
