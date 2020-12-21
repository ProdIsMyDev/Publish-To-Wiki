#!/bin/bash

echo "Checking out project"

git config --global user.name "$GITHUB_ACTOR"
git config --global user.email "$GITHUB_ACTOR@users.noreply.github.com"

git clone "https://${GH_PERSONAL_ACCESS_TOKEN}@github.com/$GITHUB_REPOSITORY.git" repo
git clone "https://${GH_PERSONAL_ACCESS_TOKEN}@github.com/$GITHUB_REPOSITORY.wiki.git" wiki


cp -r repo/wiki/* wiki/
python3 /create_sidebar.py
cd wiki/
git add .
git commit -m "Automatic Wiki Deployment"
git push origin main