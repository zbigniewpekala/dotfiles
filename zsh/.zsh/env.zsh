export ZSH=/usr/share/oh-my-zsh
export LC_ALL=en_US.UTF-8
export GPG_TTY=$(tty)

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH
export PATH=$PATH:~/src/priv/erlang/bumperl/_build/default/bin
export PATH=$PATH:/opt/apache-cassandra-3.9/bin
export PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH 
export PATH=$PATH:/opt/go/go1.13.7/bin
export PATH=$PATH:/opt/asdf/bin

export SED=gsed
export ERL_AFLAGS="-kernel shell_history enabled"

eval $(keychain --eval --quiet ~/.ssh/id_rsa)
