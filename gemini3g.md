## Tavsiye Edilen Sistem Gereksinimleri
- CPU: 4+ ÇEKİRDEK
- RAM: 8+ GB
- SSD: Kodda gireceğiniz boyut dışında +70GB yer olmalı. (Kodda Plot Size:10GB girilecekse HDD'nin en az 80GB olması öneriyorum.)
- İşletim Sistemi: Ubuntu 20.04LTS

## Kurulum Adımları ve Kodları
- Daha önce testlere katıldıysanız aynı cüzdanı kullanın. Eğer ilk defa katılıyorsanız 2. adımdan cüzdan oluşturun.
- https://polkadot.js.org/extension/ sitesinden cüzdan kurulumu yapıp cüzdan oluşturuyoruz ve bize verdiği gizli kelimeleri kesinlikle saklıyoruz. Ayrıca .json dosyasını da indirip yedeklemeyi unutmayın.
- Daha sonra aşağıdaki kodlarla adım adım yükleme işlemine geçiyoruz.Script ile kurulum kısa bir zamanda tamamlanıyor o yüzden yükleme adımı için onu kullanıyoruz.

-Kurulumu aşağıdaki kodlarla başlatıyoruz. Öncelikle 3f den kalan datayı temizlemek için eski node ```Ctrl+C``` ye basarak durduruyoruz daha sonra aşağıdaki kodu çalıştırın ve her şeyi onaylayın. Daha sonra diğer kodla yeni node muzu kuruyoruz.
```
./pulsar-ubuntu-x86_64-skylake-v0.6.14-alpha wipe
```
```
wget -q -O gemini3g.sh https://raw.githubusercontent.com/okannako/subspacenetwork/main/gemini3g.sh && chmod +x gemini3g.sh && sudo /bin/bash gemini3g.sh
```
- Yukarıdaki kodları sırayla girdikten sonra ilk olarak bir soruyla karşılaşıyoruz eğer önceden kurulumunuz varsa 'n' yazıp ilerliyorsunuz kurulumunuz yoksa ne yazdığınız önemli değil.
- Daha sonra polkadot cüzdan ile oluşturduğunuz cüzdanınızın adresi sonra node nuza vermek istediğiniz ismi girdikten sonra gelen soruya 'y' diyerek devam ediyoruz ve kurulumu bitiriyoruz ve bize verdiği node kontrol kodlarını bir yere kopyalıyoruzi ilerde kontrol için kullanacağız.

- ``No journal files were found`` hatasını çözmek için aşağıdaki kodu girip, daha sonra log kontrol kodunu giriyorsunuz. 

```
sudo systemctl restart systemd-journald
```
## Node Silmek

```
sudo systemctl stop subspace-node.service
sudo systemctl stop subspace-farmer.service
sudo systemctl disable subspace-farmer.service
rm -rf ~/.local/share/subspace*
rm -rf /etc/systemd/system/subspaced*
rm -rf /usr/local/bin/subspace*
rm -rf subspacenode
rm -rf subspacefarmer
```


- Başlatma işlemini yaptıktan sonra şu sitede isminizin bir süre sonra görünmesi gerekiyor.
     - https://telemetry.subspace.network/#list/0x418040fc282f5e5ddd432c46d05297636f6f75ce68d66499ff4cbda69ccd180b
- Son olarak aşağıdaki siteye giderek ve cüzdanımıza izin vererek blok imzaladıkça kazandığınımız ödülü görebiliriz.
     - https://polkadot.js.org/apps/?rpc=wss%3A%2F%2Frpc-0.gemini-3g.subspace.network%2Fws#/explorer
