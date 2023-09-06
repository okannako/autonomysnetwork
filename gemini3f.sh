#!/bin/bash
echo -e "\033[0;37m"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++";
echo " #####   ####        ####        ####  ####    ######    ##########  ####    ####  ###########   ####  ####";
echo " ######  ####       ######       #### ####    ########   ##########  ####    ####  ####   ####   #### ####";
echo " ####### ####      ###  ###      ########    ####  ####     ####     ####    ####  ####   ####   ########";   
echo " #### #######     ##########     ########   ####    ####    ####     ####    ####  ###########   ########";
echo " ####  ######    ############    #### ####   ####  ####     ####     ####    ####  ####  ####    #### ####";  
echo " ####   #####   ####      ####   ####  ####   ########      ####     ############  ####   ####   ####  ####";
echo " ####    ####  ####        ####  ####   ####    ####        ####     ############  ####    ####  ####   ####";
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++";
echo -e '\e[36mTwitter :\e[39m' https://twitter.com/NakoTurk
echo -e '\e[36mGithub  :\e[39m' https://github.com/okannako
echo -e '\e[36mYoutube :\e[39m' https://www.youtube.com/@CryptoChainNakoTurk
echo -e "\e[0m"
sleep 5
echo -e "\e[1m\e[32m Guncellemeler/Updates \e[0m" && sleep 2
sudo apt update && sudo apt install ocl-icd-opencl-dev ocl-icd-libopencl1 libopencl-clang-dev libgomp1 -y && sudo apt install wget -y && cd $HOME
sleep 1
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
sleep 1
echo -e "\e[1m\e[32m Dosyalar İndiriliyor/Downloading Files \e[0m" && sleep 2
wget https://github.com/subspace/pulsar/releases/download/v0.6.6-alpha/pulsar-ubuntu-x86_64-skylake-v0.6.6-alpha
chmod +x pulsar-ubuntu-x86_64-skylake-v0.6.6-alpha
sleep 1
echo -e "\e[1m\e[91m Yuklemeler bitti kilavuzdan diger adimlara gecebilirsiniz/The installations are finished, you can move on to the next steps in the guide \e[0m"
