#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

git config --global user.email "rookie-in-training-bot@users.noreply.github.com"
git config --global user.name "rookie-in-training-bot"
git config --global push.default simple

echo -e "\033[0;32mRemoving current deployment folder...\033[0m"
rm -rf deployment
git clone -b master https://rookie-in-training-bot:$DEPLOY_KEY@github.com/rookieintraining/rookieintraining.github.io.git deployment

echo -e "\033[0;32mSyncing the files and folders to deployment...\033[0m"
rsync -av --delete --exclude ".git" public/ deployment

echo -e "\033[0;32mChanging directory...\033[0m"
cd deployment

echo -e "\033[0;32mAdding CNAME...\033[0m"
echo ishabbi.tech >> CNAME

echo -e "\033[0;32mAdding all files to the repository...\033[0m"
git add -A

echo -e "\033[0;32mCommitting the changes...\033[0m"
# we need the || true, as sometimes you do not have any content changes
# and git woundn't commit and you don't want to break the CI because of that
git commit -m "rebuilding site on `date`, commit $GITHUB_COMMIT_MESSAGE and job $GITHUB_JOB_NAME" || true

echo -e "\033[0;32mPush to remote...\033[0m"
git push --force origin HEAD:master

cd ..

echo -e "\033[0;32mRemove the folder...\033[0m"
rm -rf deployment
