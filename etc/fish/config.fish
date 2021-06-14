set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)
set -x DOTFILES $HOME/.dotfiles
set -x BROWSER w3m

set PATH $HOME/.local/bin $HOME/Library/Application\ Support/Coursier/bin /usr/local/bin $PATH

fish_add_path -m ~/.local/bin

thefuck --alias | source
starship init fish | source

function tm
    if [ "$argv[1]" = "1" ]; set num 一; end
    if [ "$argv[1]" = "2" ]; set num 二; end
    if [ "$argv[1]" = "3" ]; set num 三; end
    if [ "$argv[1]" = "4" ]; set num 四; end
    if [ "$argv[1]" = "5" ]; set num 五; end
    if [ "$argv[1]" = "6" ]; set num 六; end
    if [ "$argv[1]" = "7" ]; set num 七; end
    if [ "$argv[1]" = "8" ]; set num 八; end
    if [ "$argv[1]" = "9" ]; set num 九; end
    if [ "$argv[1]" = "10" ]; set num 十; end

    echo "$num";
    tmux new -s "康$num";
end

function mkcd
    mkdir -p $argv[1];
    cd $argv[1];
end

function ls
    exa --icons --header --git --group-directories-first
end

function l
    exa --icons --oneline --git --group-directories-first
end

function ll
    exa --icons --long --git --group-directories-first --octal-permissions --no-permissions --time-style=long-iso
end

function la
    exa --all --icons --long --header --git --group-directories-first
end

function lt
    exa --tree --git --icons
end

function lr
    ls -lhtFG
end

function lra
    ls -lhatFG
end

function dots
    cd $DOTFILES
end
