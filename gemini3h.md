## Tavsiye Edilen Sistem Gereksinimleri
- CPU: 4+ ÇEKİRDEK
- RAM: 8+ GB
- SSD: Kodda gireceğiniz boyut dışında +90GB yer olmalı. (Kodda Plot Size:10GB girilecekse HDD'nin en az 100GB olması öneriyorum.)
- İşletim Sistemi: Ubuntu 20.04LTS

## Kurulum Adımları ve Kodları
- Daha önce testlere katıldıysanız aynı cüzdanı kullanın. Eğer ilk defa katılıyorsanız 2. adımdan cüzdan oluşturun.
- https://polkadot.js.org/extension/ sitesinden cüzdan kurulumu yapıp cüzdan oluşturuyoruz ve bize verdiği gizli kelimeleri kesinlikle saklıyoruz. Ayrıca .json dosyasını da indirip yedeklemeyi unutmayın.
- Daha sonra aşağıdaki kodlarla adım adım yükleme işlemine geçiyoruz.Script ile kurulum kısa bir zamanda tamamlanıyor o yüzden yükleme adımı için onu kullanıyoruz.

## Disk Temizleme
- Eğer 3g de node çalıştırdıysanız öncelikle eski testnet ile ilgili her şeyi temizlemelisiniz. Bunun için alttaki kodları sırasıyla girdiğinizden emin olun.
```
sudo systemctl stop subspace-node.service
sudo systemctl stop subspace-farmer.service
sudo systemctl disable subspace-farmer.service
sudo systemctl disable subspace-node.service
rm -rf ~/.local/share/subspace*
rm -rf /etc/systemd/system/subspaced*
rm -rf /usr/local/bin/subspace*
rm -rf subspacenode
rm -rf subspacefarmer
```

- Kurulumu aşağıdaki kodlarla başlatıyoruz ve root kullanıcısında olun.
```
wget -q -O gemini3h.sh https://raw.githubusercontent.com/okannako/autonomysnetwork/main/gemini3h.sh && chmod +x gemini3h.sh && sudo /bin/bash gemini3h.sh
```

- Yukarıdaki kodları sırayla girdikten sonra ilk olarak bir soruyla karşılaşıyoruz eğer önceden kurulumunuz varsa 'n' yazıp ilerliyorsunuz kurulumunuz yoksa ne yazdığınız önemli değil.
- Daha sonra polkadot cüzdan ile oluşturduğunuz cüzdanınızın adresi sonra node nuza vermek istediğiniz ismi girdikten sonra gelen soruya 'y' diyerek devam ediyoruz ve kurulumu bitiriyoruz ve bize verdiği node kontrol kodlarını bir yere kopyalıyoruzi ilerde kontrol için kullanacağız.

## 3 Eylül Güncelleme Kodları

```
sudo systemctl stop subspace-farmer.service
sudo systemctl stop subspace-node.service
wget https://github.com/autonomys/subspace/releases/download/gemini-3h-2024-sep-03/subspace-farmer-ubuntu-x86_64-skylake-gemini-3h-2024-sep-03
wget https://github.com/autonomys/subspace/releases/download/gemini-3h-2024-sep-03/subspace-node-ubuntu-x86_64-skylake-gemini-3h-2024-sep-03
sudo mv subspace-farmer-ubuntu-x86_64-skylake-gemini-3h-2024-sep-03 /usr/local/bin/subspace-node
sudo mv subspace-node-ubuntu-x86_64-skylake-gemini-3h-2024-sep-03 /usr/local/bin/subspace-farmer
sudo chmod +x /usr/local/bin/subspace*
sudo systemctl start subspace-farmer.service
sudo systemctl start subspace-node.service
```

## Log Komutları
```
journalctl -u subspace-farmer.service -f
```
```
journalctl -u subspace-node.service -f
```

- Ödül toplamaya başladığınızda cüzdan adresinizi siteden aratabilirsiniz.
     - https://explorer.subspace.network/#/gemini-3h/consensus/accounts
- Başlatma işlemini yaptıktan sonra şu sitede isminizin bir süre sonra görünmesi gerekiyor.
     - https://telemetry.subspace.network/#/0x0c121c75f4ef450f40619e1fca9d1e8e7fbabc42c895bc4790801e85d5a91c34
- Son olarak aşağıdaki siteye giderek ve cüzdanımıza izin vererek blok imzaladıkça kazandığınımız ödülü görebiliriz.
     - https://polkadot.js.org/apps/?rpc=wss%3A%2F%2Frpc-0.gemini-3h.subspace.network%2Fws#/accounts
