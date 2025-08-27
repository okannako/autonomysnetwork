## Tavsiye Edilen Sistem Gereksinimleri
- CPU: 4+ ÇEKİRDEK
- RAM: 8+ GB
- SSD: Kodda gireceğiniz boyut dışında 100GB yer olmalı.
- İşletim Sistemi: Ubuntu 22.04LTS

## Kurulum Adımları ve Kodları
- Daha önce testlere katıldıysanız aynı cüzdanı kullanın. Eğer ilk defa katılıyorsanız 2. adımdan cüzdan oluşturun.
- https://polkadot.js.org/extension/ sitesinden cüzdan kurulumu yapıp cüzdan oluşturuyoruz ve bize verdiği gizli kelimeleri kesinlikle saklıyoruz. Ayrıca .json dosyasını da indirip yedeklemeyi unutmayın.
- Daha sonra aşağıdaki kodlarla adım adım yükleme işlemine geçiyoruz.Script ile kurulum kısa bir zamanda tamamlanıyor o yüzden yükleme adımı için onu kullanıyoruz.

## Disk Temizleme
- Eğer testte node çalıştırdıysanız ve mainnet nodenu aynı makinaya kuracaksanız öncelikle eski testnet ile ilgili her şeyi temizlemelisiniz. Bunun için alttaki kodları sırasıyla girdiğinizden emin olun.
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
wget -q -O mainnet.sh https://raw.githubusercontent.com/okannako/autonomysnetwork/main/mainnet.sh && chmod +x mainnet.sh && sudo /bin/bash mainnet.sh
```

- Yukarıdaki kodları sırayla girdikten sonra ilk olarak bir soruyla karşılaşıyoruz eğer önceden kurulumunuz varsa 'n' yazıp ilerliyorsunuz kurulumunuz yoksa ne yazdığınız önemli değil.
- Daha sonra polkadot cüzdan ile oluşturduğunuz cüzdanınızın adresi sonra node nuza vermek istediğiniz ismi girdikten sonra gelen soruya 'y' diyerek devam ediyoruz ve kurulumu bitiriyoruz ve bize verdiği node kontrol kodlarını bir yere kopyalıyoruzi ilerde kontrol için kullanacağız.

## Log Komutları
```
journalctl -u subspace-farmer.service -f
```
```
journalctl -u subspace-node.service -f
```

## 26 Ağustos Güncellemesi
```
sudo systemctl stop subspace-farmer.service
sudo systemctl stop subspace-node.service
wget https://github.com/autonomys/subspace/releases/download/mainnet-2025-aug-20/subspace-farmer-ubuntu-x86_64-skylake-mainnet-2025-aug-20
wget https://github.com/autonomys/subspace/releases/download/mainnet-2025-aug-20/subspace-node-ubuntu-x86_64-skylake-mainnet-2025-aug-20
sudo mv subspace-node-ubuntu-x86_64-skylake-mainnet-2025-aug-20 /usr/local/bin/subspace-node
sudo mv subspace-farmer-ubuntu-x86_64-skylake-mainnet-2025-aug-20 /usr/local/bin/subspace-farmer
sudo chmod +x /usr/local/bin/subspace*
sudo systemctl start subspace-farmer.service
sudo systemctl start subspace-node.service
```

## Core Dump Hatası Alanlar
- Bazı versiyonlu makinelerde Core Dump hatası veriyor. Aşağıdaki tek kodda yukarıdaki versiyondan daha farklı mainnet versiyonu mevcut. Bu kodu çalıştırarak deneyebilirsiniz
```
wget -q -O mainnet2.sh https://raw.githubusercontent.com/okannako/autonomysnetwork/main/mainnet2.sh && chmod +x mainnet2.sh && sudo /bin/bash mainnet2.sh
```

## Core Dump 26 Ağustos Güncellemesi
```
sudo systemctl stop subspace-farmer.service
sudo systemctl stop subspace-node.service
wget https://github.com/autonomys/subspace/releases/download/mainnet-2025-aug-20/subspace-farmer-ubuntu-x86_64-v2-mainnet-2025-aug-20
wget https://github.com/autonomys/subspace/releases/download/mainnet-2025-aug-20/subspace-node-ubuntu-x86_64-v2-mainnet-2025-aug-20
sudo mv subspace-node-ubuntu-x86_64-v2-mainnet-2025-aug-20 /usr/local/bin/subspace-node
sudo mv subspace-farmer-ubuntu-x86_64-v2-mainnet-2025-aug-20 /usr/local/bin/subspace-farmer
sudo systemctl start subspace-farmer.service
sudo systemctl start subspace-node.service
```

- Başlatma işlemini yaptıktan sonra şu sitede isminizin bir süre sonra görünmesi gerekiyor.
     - https://telemetry.subspace.network/#list/0x66455a580aabff303720aa83adbe6c44502922251c03ba73686d5245da9e21bd
- Son olarak aşağıdaki siteye giderek ve cüzdanımıza izin vererek blok imzaladıkça kazandığınımız ödülü görebiliriz.
     - https://polkadot.js.org/apps/?rpc=wss%3A%2F%2Frpc-0.mainnet.subspace.network%2Fws#/accounts
