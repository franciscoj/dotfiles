function c(){
  cd /projects/$1;
}

function v(){
  cd /projects/$1;
  mvim;
}

function h(){
  cd ~/$1;
}


# Completion functions

function _rake_tasks_completion(){
  if [ -f Rakefile ]; then
    recent=`last_modified .rake_tasks~ Rakefile **/*.rake`
    if [[ $recent != '.rake_tasks~' ]]; then
      rake --silent --tasks | cut -d " " -f 2 > .rake_tasks~
    fi
    compadd `cat .rake_tasks~`
  fi
}

function last_modified(){
  ls -t $* 2> /dev/null | head -n 1
}
