#!/bin/bash
echo ==== Boilerplate Generator 1.0 ====
wget https://github.com/delainewendling/angular_boilerplate/archive/master.zip
echo * Unzipping
unzip master.zip
rm master.zip
mv angular_boilerplate-master/* .
mv angular_boilerplate-master/.* .
rm -rf angular_boilerplate-master/
cd lib
bower install
npm install
cd ..
echo -n "Make a new repo for this project? [yes] [no]"
read answer
if [ "$answer" = "yes" ]
then
  echo "🤔  Repo name:"
  read name
  echo "✨  Creating repo: $name"
  curl -u delainewendling https://api.github.com/user/repos -d '{ "name": "'"$name"'" }'
  git init
  git add .
  git commit -m "first commit"
  git remote add origin "git@github.com:delainewendling/${name}.git"
  git push -u origin master
  echo * 👍 Done!
else
  echo "No new repo created. To make a new repo, run 'mkrepo'."
fi