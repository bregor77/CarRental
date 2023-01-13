# README

git init
git add .
git commit -m "first commit - partials, navbar, devise, ransack"
git remote add origin https://github.com/bregor77/CarRental.git
git branch -M main
git push -u origin main

AFTER ADDING SOME CHANGES
git status
git add .
git commit -m "comment added"
git push origin main

CHANGE BRANCH to for example api
git checkout -b api
git status
git add .
git commit -m "reminder to work on API"
git push origin api

MERGE
# Start a new feature
git checkout -b new-feature main
# Edit some files
git add <file>
git commit -m "Start a feature"
# Edit some files
git add <file>
git commit -m "Finish a feature"
# Merge in the new-feature branch
git checkout main
git merge new-feature
git branch -d new-feature
