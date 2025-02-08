# Commands that should be applied only for interactive shells.
[[ $- == *i* ]] || return

HISTFILESIZE=100000
HISTSIZE=10000

shopt -s shopt -s autocd

alias clock='tty-clock -ctB -C 6'
alias cp='cp -v'
alias diff='diff --color=auto'
alias du='du -h'
alias fzf='fzf --preview="cat {}" --color=16'
alias grep='grep --color=auto'
alias homec='sudo vim /etc/nixos/$(hostname)/home.nix'
alias la='ls -a'
alias lb=lsblk
alias ll='ls -la'
alias lr='ls -R'
alias ls='ls --color=auto --group-directories-first'
alias m=mount
alias mount='sudo mount'
alias mv='mv -v'
alias nixc='sudo vim /etc/nixos/$(hostname)/configuration.nix'
alias nixdir='cd /etc/nixos/'
alias nixs='sudo vim /etc/nixos/shared.nix'
alias nrs='sudo nixos-rebuild switch'
alias nrt='sudo nixos-rebuild test'
alias open=xdg-open
alias rm='rm -v'
alias um=umount
alias umount='sudo umount'
alias usbmount='udiskie-mount -a'
alias usbumount='udiskie-umount -a'
alias v=nvim
alias xres_reload='xrdb -merge -I$HOME ~/.Xresources'

function loop-py() {
  while (true); do
    python $1
    echo "Completed Execution."
    read
  done
}

export PS1="\[\e[0;37m\][\[\e[0;34m\]\u \[\e[0;32m\]\W\[\e[0;37m\]]\[\e[0;32m\]\$\[\e[0m\] ";
#export PATH="/home/jw/.local/bin:$PATH"
clear
pfetch

