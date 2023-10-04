## Tavsiye Edilen Sistem Gereksinimleri
- CPU: 4+ ÇEKİRDEK
- RAM: 8+ GB
- SSD: Kodda gireceğiniz boyut  ile bağlantılı gireceğiniz değer dışında +100GB yer olmalı. (Kodda Plot Size:2GB girilecekse SSD'nin BOYUTU en az 102GB OLMALI. Tavsiyem böyle bir girişte 120GB'dan aşağı olmasın toplam boyut.)
- İşletim Sistemi: Ubuntu 20.04LTS

## Kurulum Adımları ve Kodları
- Daha önce testlere katıldıysanız aynı cüzdanı kullanın. Eğer ilk defa katılıyorsanız 2. adımdan cüzdan oluşturun.
- https://polkadot.js.org/extension/ sitesinden cüzdan kurulumu yapıp cüzdan oluşturuyoruz ve bize verdiği gizli kelimeleri kesinlikle saklıyoruz. Ayrıca .json dosyasını da indirip yedeklemeyi unutmayın.
- Daha sonra aşağıdaki kodlarla adım adım yükleme işlemine geçiyoruz.Script ile kurulum kısa bir zamanda tamamlanıyor o yüzden yükleme adımı için onu kullanıyoruz.

-Kurulumu aşağıdaki kodlarla başlatıyoruz ve root kullanıcısında olun.
```
rm -rf gemini3f.sh && rm -rf gemini3f.sh
wget -q -O gemini3f.sh https://raw.githubusercontent.com/okannako/subspacenetwork/main/gemini3f.sh && chmod +x gemini3f.sh && sudo /bin/bash gemini3f.sh
```

-Öncesinde eski bir node olsun ya da olmasın wipe komutunu çalıştırıyoruz.
```
./pulsar-ubuntu-x86_64-skylake-v0.6.11-alpha
```

- Yükleme bittikten sonra öncelikle aşağıdaki kodlarla Tmux yükleyip bir tmux sayfası açıyorsunuz. Tmux olmazsa sürekli çalışmaz.
 ```
 cd
 sudo apt install tmux
 tmux new -s subspace
 ```
- Sayfayı açtıktan sonra ilk olarak ayarlarımızı yapmak için alttaki kodu çalıştırıyoruz.
```
./pulsar-ubuntu-x86_64-skylake-v0.6.11-alpha init
```
   -Burada sırayla bize sorduğu sorulara şu cevapları veriyoruz.
    1-) y
    2-) Cüzdan adresimizi soruyor, subspace adresimizi giriyoruz.
    3-) Node isminizi soruyor, istediğiniz bir ismi verebilirsiniz, listede bu isminiz görünecek.
    4-) Enter
    5-) Enter
    6-) Plot Size sorusunda minimum değer olarak 2GB (Değer girme şekli böyle olmalı yoksa hata alırsınız) girebilirsiniz, maximum yok.
    7-) Enter
    
- Şimdi aşağıdaki kodla da nodenumuzu başlatıyoruz. Bir süre sonra ```Node started successfully!``` uyarısı verecek ve sisteme eşitlenmeye başlayacak.
```
./pulsar-ubuntu-x86_64-skylake-v0.6.11-alpha farm
```
- Bundan sonra Tmux ekranını arkaya atmak için ```ctri+b d``` kombinasyonunu kullanabilirsiniz. Tekrar girmek içinse ```tmux attach -t subspace``` kodunu kullanabilirsiniz.

## v0.6.10 Güncelleme Adımları

- Eğer v0.6.0'dan güncelleyecekseniz "wipe" kodunu girip temizlik yapmanız lazım eğer v0.6.8'dan yükseltiyorsanız alttaki kodları sırayla girmeniz yeterli.

```
rm -rf gemini3f.sh && rm -rf gemini3f.sh
wget -q -O gemini3f.sh https://raw.githubusercontent.com/okannako/subspacenetwork/main/gemini3f.sh && chmod +x gemini3f.sh && sudo /bin/bash gemini3f.sh
./pulsar-ubuntu-x86_64-skylake-v0.6.11-alpha farm
```

## Node Silmek
 -Node silmek için tmux ekranında ```ctrl+c``` yaptıktan sonra aşağıdaki kodları girmeniz yeterli

```
rm -rf ~/.local/share/subspace-cli*
rm -rf /etc/systemd/system/subspaced*
rm -rf /usr/local/bin/subspace-cli*
```

- Ödül toplamaya başladığınızda cüzdan adresinizi siteden aratabilirsiniz.
     - https://explorer.subspace.network/#/gemini-3f/accounts
- Başlatma işlemini yaptıktan sonra şu sitede isminizin bir süre sonra görünmesi gerekiyor.
     - https://telemetry.subspace.network/#list/0x92e91e657747c41eeabed5129ff51689d2e935b9f6abfbd5dfcb2e1d0d035095
- Son olarak aşağıdaki siteye giderek ve cüzdanımıza izin vererek blok imzaladıkça kazandığınımız ödülü görebiliriz.
     - https://polkadot.js.org/apps/?rpc=wss%3A%2F%2Frpc-0.gemini-3f.subspace.network%2Fws#/accounts



