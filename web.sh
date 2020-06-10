echo
echo
echo "Website Name: "
read -r website
if [ ! -e "$HOME/web" ]; then
cd ~ && mkdir web
fi
echo
if [ ! -e "/mnt/d/web" ]; then
cd /mnt/d/ && mkdir web
fi
cd /mnt/d/web && mkdir "$website"
echo "      Put your index.html inside web/$website folder" 
echo " Press Y if already inserted else press N"
read -p $"  Yes / No:  " option
if [[ $option == "Y" || $option == "y" ]]; then
cd /mnt/d/web/$website
git clone https://github.com/NganDii/webmakerfiles
cd webmakerfiles
cp Go.sh run.sh post.php usernames.txt /mnt/d/web/$website
cd ..
rm -rf webmakerfiles
echo "copy this: "
echo " cd $HOME/web/$website && bash Go.sh"
sleep 20
echo "Paste"
nano run.sh
cd /mnt/d/web/
cp -r $website ~/web
cd ~
fi
if [ ! -e "$HOME/ngrok" ]; then
git clone https://github.com/NganDii/remngrok
cd remngrok && bash ngrok.sh
fi
cd ~
cp -R ngrok web/$website
cd web/$website
chmod +x ngrok 
chmod +x Go.sh
chmod +x run.sh
bash run.sh
echo ""
