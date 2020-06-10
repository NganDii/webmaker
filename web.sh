echo
echo
echo "Website Name: "
read -r website
if [ ! -e "$HOME/web" ]; then
cd ~ && mkdir web
else
echo "Fine! File existed.."
fi
echo
if [ ! -e "/mnt/d/web" ]; then
cd /mnt/d/ && mkdir web
fi
if [ ! -e "/mnt/d/web/$website" ]; then 
echo "Fine! File existed"
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
cp Go.sh run.sh post.php usernames.txt /mnt/d/web/$website
cd ..
rm -rf webmakerfiles
echo "copy this: "
echo " cd $HOME/web/$website && bash Go.sh"
echo " Press enter after finish copying"
read -r yes
echo "Paste in the next dialog... Press enter to proceed.."
read -r yes
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
chmod +x * 
bash run.sh
echo ""
