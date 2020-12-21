#!/bin/bash

echo "Checking out project"

git config --global user.name "$GITHUB_ACTOR"
git config --global user.email "$GITHUB_ACTOR@users.noreply.github.com"

git clone "https://${GH_PERSONAL_ACCESS_TOKEN}@github.com/$GITHUB_REPOSITORY.git" /repo

cd /

mkdir /wiki

yes | cp -rf /repo/wiki/* /wiki/
python3 /create_sidebar.py

cd /wiki
git init
git config user.name "$GITHUB_ACTOR"
git config user.email "$GITHUB_ACTOR@users.noreply.github.com"
echo "$GITHUB_ACTOR@users.noreply.github.com"
echo "https://$GITHUB_ACTOR:$GH_PERSONAL_ACCESS_TOKEN@github.com/$GITHUB_REPOSITORY.wiki.git"
git remote set-url origin "https://$GITHUB_ACTOR:$GH_PERSONAL_ACCESS_TOKEN@github.com/$GITHUB_REPOSITORY.wiki.git"
git add .
git commit -m "Automatic Wiki Deployment"
git push origin master