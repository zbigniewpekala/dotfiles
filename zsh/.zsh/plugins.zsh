plugins=(git)
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

unalias cdg 2> /dev/null
cdg() {
   local dest_dir=$(cdscuts_glob_echo | fzf )
   if [[ $dest_dir != '' ]]; then
      cd "$dest_dir"
   fi
}
export -f cdg > /dev/null

test -s "./.env" && load-local-conf
add-zsh-hook chpwd load-local-conf
