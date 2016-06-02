# Force checking for LS_COLORS
if not set -q LS_COLORS
  if type -q -f dircolors
    set -l colorfile
    for file in ~/.dir_colors ~/.dircolors /etc/DIR_COLORS
      if test -f $file
        set colorfile $file
        break
      end
    end
    # echo $colorfile
    eval (dircolors -c $colorfile | sed 's/>&\/dev\/null$//')
  end
end

# Force 256 colors
set -x TERM xterm-256color

# No greeting
set fish_greeting ""

# vim settings and aliases
set -x EDITOR vim

function e
  vim $argv
end

# ls aliases
function l
  ll $argv
end

# bd settings and aliases
set -gx BD_OPT 'insensitive'

function b
  bd $argv
end

function bb
  cd ../..
end

function bbb
  cd ../../..
end

function bbbb
  cd ../../../..
end

function bbbbb
  cd ../../../../..
end

# tree aliases
function tr
  tree $argv
end

function tra
  tree -a $argv
end

function trd
  tree -d $argv
end

# Git aliases
function gst
  git status $argv
end

function gdf
  git diff $argv
end

function gdt
  git difftool $argv
end

function gps
  git push $argv
end

function gpl
  git pull $argv
end

function gad
  git add $argv
end

function gcm
  git commit $argv
end

# Base16 Shell
eval sh /home/sean/Documents/libraries/base16-shell/base16-tomorrow.dark.sh

# Colored man pages
set -x LESS_TERMCAP_mb (printf "\033[01;31m")  
set -x LESS_TERMCAP_md (printf "\033[01;31m")  
set -x LESS_TERMCAP_me (printf "\033[0m")  
set -x LESS_TERMCAP_se (printf "\033[0m")  
set -x LESS_TERMCAP_so (printf "\033[01;44;33m")  
set -x LESS_TERMCAP_ue (printf "\033[0m")  
set -x LESS_TERMCAP_us (printf "\033[01;32m")  
#set -x LESS="-R"
