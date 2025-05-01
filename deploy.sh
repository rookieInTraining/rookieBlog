#!/bin/bash

mkdir -p ~/.ssh
echo $DEPLOY_KEY > ~/.ssh/deploy-key   # Save the private key to a file
chmod 600 ~/.ssh/deploy-key 
ssh-keyscan -H github.com >> ~/.ssh/known_hosts

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

git config --global user.email "rookie-in-training-bot@users.noreply.github.com"
git config --global user.name "rookie-in-training-bot"
git config --global push.default simple

GIT_SSH_COMMAND='ssh -i ~/.ssh/deploy-key -o IdentitiesOnly=yes'

rm -rf deployment
git clone -b master https://rookie-in-training-bot:$DEPLOY_KEY@github.com/rookieintraining/rookieintraining.github.io.git deployment
rsync -av --delete --exclude ".git" public/ deployment
cd deployment

echo ishabbi.tech >> CNAME

git add -A

# we need the || true, as sometimes you do not have any content changes
# and git woundn't commit and you don't want to break the CI because of that
git commit -m "rebuilding site on `date`, commit $GITHUB_COMMIT_MESSAGE and job $GITHUB_JOB_NAME" || true

git push --force origin HEAD:master

cd ..
rm -rf deployment
