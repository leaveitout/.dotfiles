source /usr/share/autojump/autojump.fish

# Source keychain
if status --is-interactive
  keychain --eval --quiet -Q id_rsa
end
