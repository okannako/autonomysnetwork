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
echo -e "\e[1m\e[32m Güncellemeler/Updating \e[0m" && sleep 2
sudo apt update && sudo apt install ocl-icd-opencl-dev ocl-icd-libopencl1 libopencl-clang-dev libgomp1 -y && sudo apt install wget -y && cd $HOME

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

echo -e "\e[1m\e[91m Eğer node çalıştırıyorsanız eski datayı silmek için onaylayın / If you are already running node, confirm to delete the old data. (y/n) \e[0m"
read -p "(y/n)?" response
if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then   
    sudo systemctl stop subspace-farmer.service
    sudo systemctl stop subspace-node.service
    subspace-farmer wipe
    subspace-node purge-chain --chain gemini-3h
fi

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

wget https://github.com/autonomys/subspace/releases/download/mainnet-2024-nov-06/subspace-farmer-ubuntu-x86_64-skylake-mainnet-2024-nov-06
wget https://github.com/autonomys/subspace/releases/download/mainnet-2024-nov-06/subspace-node-ubuntu-x86_64-skylake-mainnet-2024-nov-06
sudo mv subspace-node-ubuntu-x86_64-skylake-mainnet-2024-nov-06 /usr/local/bin/subspace-node
sudo mv subspace-farmer-ubuntu-x86_64-skylake-mainnet-2024-nov-06 /usr/local/bin/subspace-farmer

sudo chmod +x /usr/local/bin/subspace*
sudo systemctl start subspace-farmer.service
sudo systemctl start subspace-node.service

mkdir subspacenode
sudo chmod 700 ~/subspacenode
mkdir subspacefarmer
sudo chmod 700 ~/subspacefarmer

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

echo -e "\e[1m\e[32m Subspace Cüzdan Adresi / Enter Subspace wallet address. \e[0m"
read -p "Address: " ADDRESS

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

echo -e "\e[1m\e[32m Node İsmi Girin / Enter a name for the node. \e[0m"
read -p "Node Name : " NODE_NAME

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

echo -e "\e[1m\e[32m Plot Değeri Girin / Enter the Plot Size value. \e[0m"
read -p "Plot Size : " PLOTSIZE

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

echo -e "\e[1m\e[92m Node Name: \e[0m" $NODE_NAME

echo -e "\e[1m\e[92m Address:  \e[0m" $ADDRESS

echo -e "\e[1m\e[92m Plot Size:  \e[0m" $PLOTSIZE

echo -e "\e[1m\e[91m    11.1 Do you confirm the information (y/n) \e[0m"
read -p "(y/n)?" response
if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

echo -e "\e[1m\e[32m Servis Oluşturma / Create a service file for the Node \e[0m"

echo "[Unit]
Description=Subspace Node

[Service]
User=$USER
ExecStart=subspace-node run  --chain mainnet --base-path /root/subspacenode --farmer --name '$NODE_NAME'
Restart=always
RestartSec=10
LimitNOFILE=10000

[Install]
WantedBy=multi-user.target" > $HOME/subspace-node.service

sudo mv $HOME/subspace-node.service /etc/systemd/system

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

echo -e "\e[1m\e[32m Create a service file for the Farmer \e[0m"

echo "[Unit]
Description=Subspace Farmer

[Service]
User=$USER
ExecStart=subspace-farmer farm --reward-address $ADDRESS path=/root/subspacefarmer,size=$PLOTSIZE
Restart=always
RestartSec=10
LimitNOFILE=10000

[Install]
WantedBy=multi-user.target" > $HOME/subspace-farmer.service

sudo mv $HOME/subspace-farmer.service /etc/systemd/system

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

    sudo systemctl daemon-reload
    sudo systemctl enable subspace-farmer.service
    sudo systemctl enable subspace-node.service

    sudo systemctl restart subspace-node.service
    sudo systemctl restart subspace-farmer.service

echo -e "\e[1m\e[32mNode Started \e[0m"
echo -e "\e[1m\e[32mFarmer Started \e[0m"

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

echo -e "\e[1m\e[32mRelated Codes\e[0m"

echo -e "\e[1m\e[32mStart and Stop Node: \e[0m"
echo -e "\e[1m\e[39msystemctl start subspace-node.service \n \e[0m"
echo -e "\e[1m\e[39msystemctl stop subspace-node.service \n \e[0m" 

echo -e "\e[1m\e[32mNode Logs: \e[0m" 
echo -e "\e[1m\e[39mjournalctl -u subspace-node.service -f \n \e[0m" 

echo -e "\e[1m\e[32mStart and Stop Farmer: \e[0m"
echo -e "\e[1m\e[39msystemctl start subspace-farmer.service \n \e[0m" 
echo -e "\e[1m\e[39msystemctl stop subspace-farmer.service \n \e[0m" 

echo -e "\e[1m\e[32mFarmer Logs: \e[0m" 
echo -e "\e[1m\e[39mjournalctl -u subspace-farmer.service -f \n \e[0m" 
else
echo -e "\e[1m\e[91mYou have terminated the process \e[0m"
fi

