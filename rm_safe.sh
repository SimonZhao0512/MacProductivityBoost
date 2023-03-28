# copy and paste this in your ~/.bashrc file to ban any flag of rm function, 
# such as rm -r, they are too powerful for novice even seasoned programmers. 
# However, rm function is not banned itself.

function rm_confirmation {
  echo "Are you sure you want to delete this file/directory? [y/n]"
  read answer1
  if [[ $answer1 == "y" || $answer1 == "Y" ]]; then
    echo "Are you really sure? [y/n]"
    read answer2
    if [[ $answer2 == "y" || $answer2 == "Y" ]]; then
       /bin/rm "$@"
    fi
  fi
}

function rm {
  local cmd="$(which rm)"
  local banned_options=(-r -R -f -rf -rd -df -fr -dr -Rf -fR -dR -Rd )

  for arg in "$@"; do
    local has_banned_option=false
    for option in "${banned_options[@]}"; do
      if [[ $arg == $option ]]; then
        echo "Error: the use of the '$arg' option is not allowed in this system. \
it's too dangerous, dont use it"
        has_banned_option=true
        break
      fi
    done

    if [ "$has_banned_option" = true ]; then
      break
    fi
  done

  if [ "$has_banned_option" = false ]; then
    rm_confirmation "$@"
  fi
}