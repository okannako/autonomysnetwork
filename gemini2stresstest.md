## Tavsiye Edilen Sistem Gereksinimleri
- CPU: 2 ÇEKİRDEK
- RAM: 4+ GB (Önerilen 8)
- SSD: Kodda gireceğiniz boyut (Max=100GB dışında +50GB yer olmalı. (Kodda Plot Size:10GB girilecekse HDD'nin en az 70GB olması öneriliyor.)
- İşletim Sistemi: Ubuntu 20.04LTS

## Kurulum Adımları ve Kodları
- Daha önce testlere katıldıysanız aynı cüzdanı kullanın. Eğer ilk defa katılıyorsanız 2. adımdan cüzdan oluşturun.
- https://polkadot.js.org/extension/ sitesinden cüzdan kurulumu yapıp cüzdan oluşturuyoruz ve bize verdiği gizli kelimeleri kesinlikle saklıyoruz. Ayrıca .json dosyasını da indirip yedeklemeyi unutmayın.
- Daha sonra aşağıdaki kodlarla adım adım yükleme işlemine geçiyoruz.Script ile kurulum kısa bir zamanda tamamlanıyor o yüzden yükleme adımı için onu kullanıyoruz.

-Kurulumu aşağıdaki kodlarla başlatıyoruz.
```
wget -q -O subspace.sh https://raw.githubusercontent.com/okannako/subspacenetwork/main/stresstest2.sh && chmod +x stresstest2.sh && sudo /bin/bash stresstest2.sh
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
```


- Başlatma işlemini yaptıktan sonra şu sitede isminizin bir süre sonra görünmesi gerekiyor.
     - https://telemetry.subspace.network/#list/0x43d10ffd50990380ffe6c9392145431d630ae67e89dbc9c014cac2a417759101
- Son olarak aşağıdaki siteye giderek ve cüzdanımıza izin vererek blok imzaladıkça kazandığınımız ödülü görebiliriz.
     - https://polkadot.js.org/apps/?rpc=wss%3A%2F%2Feu-1.gemini-2a.subspace.network%2Fws#/accounts
- Bütün adımların uygulanışını görmek için şu videoyu izleyebilirsiniz.
     - https://www.youtube.com/watch?v=F1hSXOj44tI
