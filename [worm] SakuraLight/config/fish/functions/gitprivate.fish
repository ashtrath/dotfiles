function gitprivate --description "Apply private git configs with one command."
  if test -z "$argv[1]"
    echo "Usage: gitprivate <username> <email> <gpg_key_id>" 1>&2
    return 1
  end

  git config user.name $argv[1]
  git config user.email $argv[2]
  git config user.signinkey $argv[3]
end
