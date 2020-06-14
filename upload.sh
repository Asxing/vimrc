#!/bin/sh

vimrc1FilePath="~/.vimrc"

ideavimrcFilePath="~/.ideavimrc"


cp -f  ~/.vimrc vimrc
echo "copy $vimrc1FilePath to vimrc"
cp -f  ~/.ideavimrc idea 
echo "copy $ideavimrcFilePath to vimrc"

git add -A

git commit -m 'deploy'

git push
