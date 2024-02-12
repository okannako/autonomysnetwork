## Tavsiye Edilen Sistem Gereksinimleri
- CPU: 4+ ÇEKİRDEK
- RAM: 8+ GB
- SSD: Kodda gireceğiniz boyut dışında +70GB yer olmalı. (Kodda Plot Size:10GB girilecekse HDD'nin en az 80GB olması öneriyorum.)
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

-Kurulumu aşağıdaki kodlarla başlatıyoruz ve root kullanıcısında olun.
```
wget -q -O gemini3h.sh https://raw.githubusercontent.com/okannako/subspacenetwork/main/gemini3h.sh && chmod +x gemini3h.sh && sudo /bin/bash gemini3h.sh
```

-Öncesinde eski bir node olsun ya da olmasın wipe komutunu çalıştırıyoruz.
```
./pulsar-ubuntu-x86_64-skylake-v0.8.0-alpha wipe
```

- Yükleme bittikten sonra öncelikle aşağıdaki kodlarla Tmux yükleyip bir tmux sayfası açıyorsunuz. Tmux olmazsa sürekli çalışmaz.
 ```
 cd
 sudo apt install tmux
 tmux new -s subspace
 ```

- Sayfayı açtıktan sonra ilk olarak ayarlarımızı yapmak için alttaki kodu çalıştırıyoruz.
```
./pulsar-ubuntu-x86_64-skylake-v0.8.0-alpha init
```
   -Burada sırayla bize sorduğu sorulara şu cevapları veriyoruz.
    ```1-) y
    2-) Cüzdan adresimizi soruyor, subspace adresimizi giriyoruz.
    3-) Node isminizi soruyor, istediğiniz bir ismi verebilirsiniz, listede bu isminiz görünecek.
    4-) Enter
    5-) Enter
    6-) Plot Size sorusunda minimum değer olarak 2GB (Değer girme şekli böyle olmalı yoksa hata alırsınız) girebilirsiniz, maximum yok.
    7-) Enter
    ```
    
- Şimdi aşağıdaki kodla da nodenumuzu başlatıyoruz. Bir süre sonra ```Node started successfully!``` uyarısı verecek ve sisteme eşitlenmeye başlayacak.
```
./pulsar-ubuntu-x86_64-skylake-v0.8.0-alpha farm
```
- Bundan sonra Tmux ekranını arkaya atmak için ```ctri+b d``` kombinasyonunu kullanabilirsiniz. Tekrar girmek içinse ```tmux attach -t subspace``` kodunu kullanabilirsiniz.

- ## Node Silmek
 -Node silmek için tmux ekranında ```ctrl+c``` yaptıktan sonra aşağıdaki kodları girmeniz yeterli

```
rm -rf ~/.local/share/subspace-cli*
rm -rf /etc/systemd/system/subspaced*
rm -rf /usr/local/bin/subspace-cli*
rm -rf /root/.local/share/pulsar/farms
rm -rf /root/.local/share/pulsar/node
./pulsar-ubuntu-x86_64-skylake-v0.8.0-alpha wipe
```

- Ödül toplamaya başladığınızda cüzdan adresinizi siteden aratabilirsiniz.
     - https://explorer.subspace.network/#/gemini-3h/consensus/accounts
- Başlatma işlemini yaptıktan sonra şu sitede isminizin bir süre sonra görünmesi gerekiyor.
     - https://telemetry.subspace.network/#/0x0c121c75f4ef450f40619e1fca9d1e8e7fbabc42c895bc4790801e85d5a91c34
- Son olarak aşağıdaki siteye giderek ve cüzdanımıza izin vererek blok imzaladıkça kazandığınımız ödülü görebiliriz.
     - https://polkadot.js.org/apps/?rpc=wss%3A%2F%2Frpc-0.gemini-3h.subspace.network%2Fws#/accounts
