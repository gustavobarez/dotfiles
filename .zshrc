#asdf
 
#zsh autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#config java home
export JAVA_HOME="$HOME/.asdf/installs/java/openjdk-17"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$HOME/.asdf/shims:$PATH"


# starship
if [ -f ~/.config/starship.toml ]; then
  eval "$(starship init zsh)"
fi

# Zsh Auto Suggestions
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history

export PATH="$HOME:$PATH"

#zsh-highlightning

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Remover sublinhado no zsh-syntax-highlighting
ZSH_HIGHLIGHT_STYLES[default]='fg=white'         # Texto padrão
ZSH_HIGHLIGHT_STYLES[command]='fg=green'          # Comandos
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=green' # Palavras reservadas
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green'         # Comandos internos
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=green'  # Opções com um hífen
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=green' # Opções com dois hífens
ZSH_HIGHLIGHT_STYLES[alias]='fg=green'             # Aliases
ZSH_HIGHLIGHT_STYLES[path]='fg=white'           # Caminhos
ZSH_HIGHLIGHT_STYLES[global_alias]='fg=green'     # Alias globais
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=grey'  # Separadores de comando

# Remover o sublinhado (underline) de todas as palavras destacadas
for style in ${(k)ZSH_HIGHLIGHT_STYLES}; do
  ZSH_HIGHLIGHT_STYLES[$style]="${ZSH_HIGHLIGHT_STYLES[$style]//_}"
done

# Use lf to switch directories and bind it to ctrl-o
#lfcd () {
#    tmp="$(mktemp)"
#    lf -last-dir-path="$tmp" "$@"
#    if [ -f "$tmp" ]; then
#        dir="$(cat "$tmp")"
#        rm -f "$tmp"
#        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
#    fi
#}

# yazi cd
yazi_cd() {
    tmp="$(mktemp)"
    yazi --cwd="$PWD" --chooser-file="$tmp"
    if [ -s "$tmp" ]; then
        dir=$(<"$tmp")
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            cd "$dir"
        fi
    fi
}


export TERM=xterm-256color

# Inicia o tmux automaticamente se não estiver dentro de uma sessão
if command -v tmux &> /dev/null; then
[ -z "$TMUX" ] && exec tmux
fi


bindkey -s '^o' 'lfcd\n'
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
#if [[ $- == *i* ]]; then
#    neofetch
#fi
source ~/.config/aliases.zsh
