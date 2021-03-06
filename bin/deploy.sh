#!/bin/bash
set -eo pipefail

log() {
  echo "$@" >&2
}

error() {
  log "$@"
  exit 1
}

: ${CI_COMMITTER_USERNAME:=anonymous}
: ${CI_COMMITTER_EMAIL:=nobody@example.com}
if [[ -n $CI_COMMIT_ID ]]; then
  SHORT_COMMIT=${CI_COMMIT_ID:0:7}
else
  SHORT_COMMIT='unknown commit'
fi
: ${CI_MESSAGE:=unknown commit}

BUILT_SITE=${1:?first argument should be the directory into which the site was built}
[[ -d $BUILT_SITE ]] || error $BUILT_SITE is not a directory!
REPO=${2:?second argument should be the git repo URL to push to}
BRANCH=${3:?third argument should be the git branch to push to}

DEPLOY_DIR=/tmp/deploy
MESSAGE="[skip ci] Built from $SHORT_COMMIT: $CI_MESSAGE"

git config --global user.name "Robot (on behalf of $CI_COMMITTER_USERNAME)"
git config --global user.email "$CI_COMMITTER_EMAIL"

mkdir "$DEPLOY_DIR"
git clone --branch="$BRANCH" "$REPO" "$DEPLOY_DIR"

rsync -rltvP --delete --exclude=.git "$BUILT_SITE"/ "$DEPLOY_DIR"/
cd "$DEPLOY_DIR"
git add -A
git commit -m "$MESSAGE"
git push origin HEAD:"$BRANCH"
