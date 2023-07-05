## Tavsiye Edilen Sistem Gereksinimleri
- CPU: 4+ ÇEKİRDEK
- RAM: 4+ GB (Önerilen 8)
- SSD: Kodda gireceğiniz boyut  ile bağlantılı gireceğiniz değer dışında +200GB yer olmalı. (Kodda Plot Size:1GB girilecekse HDD'nin BOYUTU en az 201GB OLMALI.)
- İşletim Sistemi: Ubuntu 20.04LTS

## Kurulum Adımları ve Kodları
- Daha önce testlere katıldıysanız aynı cüzdanı kullanın. Eğer ilk defa katılıyorsanız 2. adımdan cüzdan oluşturun.
- https://polkadot.js.org/extension/ sitesinden cüzdan kurulumu yapıp cüzdan oluşturuyoruz ve bize verdiği gizli kelimeleri kesinlikle saklıyoruz. Ayrıca .json dosyasını da indirip yedeklemeyi unutmayın.
- Daha sonra aşağıdaki kodlarla adım adım yükleme işlemine geçiyoruz.Script ile kurulum kısa bir zamanda tamamlanıyor o yüzden yükleme adımı için onu kullanıyoruz.

-Kurulumu aşağıdaki kodlarla başlatıyoruz ve root kullanısında olun.
```
rm -rf gemini3e.sh
wget -q -O gemini3e.sh https://raw.githubusercontent.com/okannako/subspacenetwork/main/gemini3e.sh && chmod +x gemini3e.sh && sudo /bin/bash gemini3e.sh
```

-Eğer eski versionda bir node çalışıyorsa öncelikle onun ```tmux``` ekranına girip ```ctrl+c``` ile durdurup aşağıdaki kodu çalıştırıp geçmişi temizlemeniz gerekiyor.
```
./subspace-cli-ubuntu-x86_64-skylake-v0.5.1-alpha-2 wipe
```

- Yükleme bittikten sonra öncelikle aşağıdaki kodlarla Tmux yükleyip bir tmux sayfası açıyorsunuz. Tmux olmazsa sürekli çalışmaz.
 ```
 cd
 sudo apt install tmux
 tmux new -s subspace
 ```
- Sayfayı açtıktan sonra ilk olarak ayarlarımızı yapmak için alttaki kodu çalıştırıyoruz.
```
./subspace-cli-ubuntu-x86_64-skylake-v0.5.1-alpha-2 init
```
   -Burada sırayla bize sorduğu sorulara şu cevapları veriyoruz.
    1-) Cüzdan adresimizi soruyor, subspace adresimizi giriyoruz.
    2-) Node isminizi soruyor, istediğiniz bir ismi verebilirsiniz, listede bu isminiz görünecek.
    3-) Enter
    4-) Plot Size sorusunda minimum değer olarak 1GB (Değer girme şekli böyle olmalı yoksa hata alırsınız) girebilirsiniz, maximum yok.
    5-) Enter
    6-) Enter
    
- Şimdi aşağıdaki kodla da nodenumuzu başlatıyoruz. Bir süre sonra ```Node started successfully!``` uyarısı verecek ve sisteme eşitlenmeye başlayacak.
```
./subspace-cli-ubuntu-x86_64-skylake-v0.5.1-alpha-2 farm
```
- Bundan sonra Tmux ekranını arkaya atmak için ```ctri+b d``` kombinasyonunu kullanabilirsiniz. Tekrar girmek içinse ```tmux attach -t subspace``` kodunu kullanabilirsiniz.

## Node Silmek
 -Node silmek için tmux ekranında ```ctrl+c``` yaptıktan sonra aşağıdaki kodları girmeniz yeterli

```
rm -rf ~/.local/share/subspace-cli*
rm -rf /etc/systemd/system/subspaced*
rm -rf /usr/local/bin/subspace-cli*
```

- Ödül toplamaya başladığınızda cüzdan adresinizi siteden aratabilirsiniz.
     - https://explorer.subspace.network/#/gemini-3e/accounts
- Başlatma işlemini yaptıktan sonra şu sitede isminizin bir süre sonra görünmesi gerekiyor.
     - https://telemetry.subspace.network/#list/0xa3cd4b592d93f79943fbc58fc90ca8f516106699c9cf4d7ada98ca22877bc1ae
- Son olarak aşağıdaki siteye giderek ve cüzdanımıza izin vererek blok imzaladıkça kazandığınımız ödülü görebiliriz.
     - https://polkadot.js.org/apps/?rpc=wss%3A%2F%2Frpc-0.gemini-3e.subspace.network%2Fws#/explorer



