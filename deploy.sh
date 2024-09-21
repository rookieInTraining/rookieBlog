#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

git config --global user.email "rookie-in-training-bot@users.noreply.github.com"
git config --global user.name "rookie-in-training-bot"
git config --global push.default simple

rm -rf deployment
git clone -b master https://rookie-in-training-bot:${ACTIONS_DEPLOY_KEY}@github.com/rookieInTraining/rookieintraining.github.io.git deployment
rsync -av --delete --exclude ".git" public/ deployment
cd deployment

echo ishabbi.tech >> CNAME

git add -A

# we need the || true, as sometimes you do not have any content changes
# and git woundn't commit and you don't want to break the CI because of that
git commit -m "rebuilding site on `date`, commit ${{ github.event.head_commit.message }} and job ${{github.job}}" || true

git push --force origin HEAD:master

cd ..
rm -rf deployment
