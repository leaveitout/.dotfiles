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

# Enable autojump command
#source /usr/share/autojump/autojump.fish ^/dev/null
#if test -e /usr/share/autojump/autojump.fish
#source /usr/share/autojump/autojump.fish
#end

set -gx BD_OPT 'insensitive'
alias b "bd"

# Force 256 colors
set -x TERM xterm-256color

# No greeting
set fish_greeting ""

set -x EDITOR vim

function e
  vim $argv
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
