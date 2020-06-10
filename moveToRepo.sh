#!/bin/sh

vimrc1FilePath="~/.vimrc\~"

ideavimrcFilePath="~/.ideavimrc"


cp -f  ~/.vimrc~ vimrc
mv vimrc/.vimrc~ vimrc/.vimrc
echo "copy $vimrc1FilePath to vimrc"
cp -f  ~/.ideavimrc idea 
echo "copy $ideavimrcFilePath to vimrc"
cp -r -f ~/.SpaceVim.d  spacevim
echo 'copy spacevim.d to spacevim '

git add -A

git commit -m 'deploy'

git push
