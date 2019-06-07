#Shortcuts
alias reload="source~/.zshrc"
alias_="sudo"
alias fuck="rm-rf";

#Listdeclaredaliasandfunctions
alias aliases="alias|sed's/=.*//'"
alias functions="declare-f|grep'^[a-z].*()'|sed's/{$//'"
alias paths='echo-e${PATH//:/\\n}'

#npm

alias ni="npminstall"
alias nu="npmuninstall"
alias nup="npmupdate"
alias nri="rm-rnode_modules&&npminstall"
alias ncd="npm-check-su"

#SIGFIG
gre(){
git pull--rebase upstream "$1"
}
