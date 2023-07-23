# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias   b='tmp=$PWD; builtin cd $bwd; bwd=$tmp'
alias   bb='tmp=$PWD; builtin cd $bbwd; bbwd=$bwd; bwd=$tmp'
alias   cd='bbwd=$bwd; bwd=$PWD; builtin cd ${*}'
# alias   pwd='echo "PWD:  $PWD"; echo "b:    $bwd"; echo "bb:   $bbwd"'
bwd=$PWD; export bwd;
bbwd=$PWD; export bbwd;

# ionice
alias useionice='ionice -c2 -n7'

# maven
alias mvneclipse='mvn eclipse:clean eclipse:eclipse'
alias mvneclipsesrc='mvn eclipse:clean eclipse:eclipse -DdownloadJavadocs=true -DdownloadSources=true'
alias mvnrebuild='mvn clean install'
alias mvnbuild='mvn install'
alias mvnrepackage='mvn clean package'
alias mvnpackage='mvn package'
alias mvnreverify='mvn clean verify'
alias mvnverify='mvn verify'

# send notification with message like '@mn: '
alias notify='notify-send "@`hostname`: "'

# git
alias gsrebase='git svn rebase'
alias gsfetch='git svn fetch'
alias gscommit='git svn dcommit'
alias gitremupdate='git remote update'

# aptitude
alias aptupdate='sudo aptitude update'
alias aptinstall='sudo aptitude install'
alias aptsearch='apt-cache search'
alias aptupgrade='sudo aptitude safe-upgrade'
alias aptclean='sudo aptitude clean'

# emacs
alias e='emacsclient -t'
alias ec='emacsclient -c'
