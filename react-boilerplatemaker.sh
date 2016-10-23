#!/bin/bash
echo ==== Creating React Boilerplate ===
wget https://github.com/delainewendling/react_boilerplate/archive/master.zip
echo * Unzipping
unzip master.zip
rm master.zip
mv react_boilerplate-master/* .
mv react_boilerplater-master/.* .
rm -rf react_boilerplate-master/
npm install
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