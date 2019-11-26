# Motability entries:
alias guom='git update-from origin master'
alias gitcheck='for ii in *; do if [ -d ${ii}/.git ]; then echo ========= $ii ======; (cd $ii ; git status); fi; done| egrep -v "nothing to commit, working tree clean|On branch master|Your branch is up to date with |Already up to date|^\$"'
alias gs='git status'
alias gpll='git pull'
alias gpsh='git push'
alias gdmh='git diff master..HEAD'
alias gcm='git commit -m'
alias gco='git checkout'
#alias reagent='eval $(ssh-agent -s); ssh-add ~/.ssh/id_rsa; ssh-add ~/.ssh/id_rsa_bitbucket'
#alias reagent='eval $(ssh-agent -s); ssh-add ~/.ssh/id_rsa; ssh-add ~/.ssh/id_rsa_bitbucket; ssh-add ~/.ssh/osmo-nonprod; ssh-add ~/.ssh/osmo-sandpit'
alias reagent='. ~/bin/reagent'

# RHOSP Demo shortcuts
alias rhosp_kube='export KUBECONFIG=/home/sar/Work/Ammeon/RHOSP_DEMO/auth/kubeconfig'



function cd1repos {
  cd ~/src/Motability_v1/${1}
  pwd
}
function cdrepos {
  cd ~/src/Motability/${1}
  pwd
}

function gobastion {
  pkill ssh-agent
  . ~/bin/reagent 2>/dev/null
  ssh -A bastion.${1}.theosmo.com
}

alias esme='ssh -p 143 192.168.0.15'
alias toclovis='ssh -tp 3270 sar@tobermory.simonreap.com ssh -p 143 192.168.0.27'
alias pigarage='ssh pi@192.168.0.23'
alias pi31='pi 31 sar 143'
alias pi27='pi 27 sar 143'
alias pi32='pi 32 sar 3270'
#alias tobermory='ssh -p 3270 sar@tobermory.simonreap.com'
alias tobermory='pi tobermory.simonreap.com sar 3270'
alias pi41='pi 41'
alias pi41back='pi 41 backuppc'
alias pi51='pi 51 sar'
alias pi52='pi 52 cubie 36000'
alias pi53='pi 53 pi 143'
alias pbtwo='pi 58 pi 143'
alias pbpolo='ssh -p 143 pi@192.168.42.1'
alias pi59='pi 59'
alias pi26='pi 26'
alias pi81='pi 81'
alias pifarm='pi 81'
alias pi93='pi 93'
alias piwipi='pi 97'
alias pimum='eastcote'
alias eastcote='pi eastcote135.simonreap.com pi 5150'
alias films='get_iplayer --category=films'
alias radio='get_iplayer --preset=radio'
alias chkdf="df -h ~ /"

#alias bbc4extra="lynx -accept_all_cookies -term=vt100 http://www.bbc.co.uk/radio4extra/programmes/schedules"
#alias r4="lynx -accept_all_cookies -term=vt100 http://www.bbc.co.uk/radio4/programmes/schedules/fm"
alias bbc4extra='lynx -accept_all_cookies -term=vt100 http://www.bbc.co.uk/schedules/p00fzl7l'
alias r4='lynx -accept_all_cookies -term=vt100 http://www.bbc.co.uk/schedules/p00fzl7j'
alias radio='get_iplayer --preset=radio'
alias youtube-dl-mp3='youtube-dl -x --audio-format mp3'

# stop typos ruingin my life....  :-)
alias cd..="cd .."
alias ls-ltr="ls -ltr"
alias alais="alias"

alias towidth='cut -c1-${COLUMNS}'

alias ft="find * -type f -print0 | xargs -0 file | grep -v '/\.[gs][iv][tn]/' | awk -F: '/text/{printf \"%s%c\",\$1,0}'| xargs -0 grep"
function ftdirs {
  indirs="$1"
  shift
  find $indirs -type f -print0 | xargs -0 file | grep -v '/\.[gs][iv][tn]/' | awk -F: '/text/{printf "%s%c",$1,0}'| xargs -0 grep "$@"
}

alias edalias="vi ~/.bash_aliases && realias"
alias edalais="vi ~/.bash_aliases && realias"
alias realias=". ~/.bash_aliases"
alias realais=". ~/.bash_aliases"

function redo { for ii in $@ ;do if [ "${ii##*.}" = "done" ]; then mv -v $ii ${ii%%.done}.todo; elif [ "${ii##*.}" = "fone" ]; then mv -v $ii ${ii%%.fone}.tofu; else echo $ii not a '"done"' file; fi;  done }

function mkcd {
  # Make a directory, and cd to it if successful
  mkdir -p "$1" && cd "$1"
}

function clone_osmo {
  git clone ssh://simon3270@bitbucket.org/motabilityoperations/$1.git
  cd $1
}

