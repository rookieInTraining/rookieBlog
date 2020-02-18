#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

if [ -n "$GITHUB_AUTH_SECRET" ]
then
    echo $GITHUB_AUTH_SECRET > ~/.git-credentials && chmod 0600 ~/.git-credentials

    git config --global credential.helper store
    git config --global user.email "rookie-in-training-bot@users.noreply.github.com"
    git config --global user.name "rookie-in-training-bot"
    git config --global push.default simple
fi

rm -rf deployment
git clone -b master https://github.com/rookieInTraining/rookieintraining.github.io.git deployment
rsync -av --delete --exclude ".git" public/ deployment
cd deployment

git add -A

# we need the || true, as sometimes you do not have any content changes
# and git woundn't commit and you don't want to break the CI because of that
git commit -m "rebuilding site on `date`, commit ${TRAVIS_COMMIT} and job ${TRAVIS_JOB_NUMBER}" || true

git push --force origin HEAD:master

cd ..
rm -rf deployment
