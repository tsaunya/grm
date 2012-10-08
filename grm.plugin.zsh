# Aliases

function grm() {
  if [ "x$1" != "x" ]; then
    origin=$(git rev-parse --abbrev-ref HEAD)
    echo $origin
    current=$1
    echo $current
    if [ "$current" != "$origin" ]; then
      git pull origin $origin
      git checkout $current
      co=$(git rev-parse --abbrev-ref HEAD)
      if [[ $co != $current ]]; then
        git checkout -b $current origin/$current
      fi
      git rebase -p $origin
      git checkout $origin
      git merge --no-ff $current
    fi
  fi
}
