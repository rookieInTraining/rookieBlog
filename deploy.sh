#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

rm -rf deployment
git clone -b master git@github.com:rookieInTraining/rookieintraining.github.io.git deployment
rsync -av --delete --exclude ".git" public/ deployment
cd deployment

git add -A

# we need the || true, as sometimes you do not have any content changes
# and git woundn't commit and you don't want to break the CI because of that
git commit -m "rebuilding site on `date`, commit ${TRAVIS_COMMIT} and job ${TRAVIS_JOB_NUMBER}" || true

git push --force origin HEAD:master

cd ..
rm -rf deployment
