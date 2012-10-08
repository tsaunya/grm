# Aliases

function grm() {
  if [ "x$1" != "x" ]; then
    local current=$(git rev-parse --abbrev-ref HEAD)
    local origin=$1
    echo $(git checkout $origin && git pull origin $origin && git checkout $current && git rebase -p $origin)
  fi
}
