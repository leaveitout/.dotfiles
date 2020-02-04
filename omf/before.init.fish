source /usr/share/autojump/autojump.fish

# Source keychain
if status --is-interactive
#   keychain --eval --quiet -Q ~/.ssh/id_rsa
    keychain --quiet --agents ssh github
end
