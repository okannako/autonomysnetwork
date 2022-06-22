## Tavsiye Edilen Sistem Gereksinimleri
- CPU: 2 ÇEKİRDEK
- RAM: 4+ GB (Önerilen 8)
- SSD: 100 GB
- İşletim Sistemi: Ubuntu 20.04LTS
- Not: Yeni gelen güncellemelerle birlikte scriptte plot değeri girerken hdd toplam boyutunuzun 30G altını girmenizi öneririm (Disk boyutu 100G ise scriptte plot değerini en fazla 70G girin). İşletim sistemi ve ek dosyalar olduğu için node hdd yi full doldurabiliyor. Bu değer benim kişisel tercihim, son karar sizin.

## Kurulum Adımları ve Kodları
- Önce https://polkadot.js.org/extension/ sitesinden cüzdan kurulumu yapıp cüzdan oluşturuyoruz ve bize verdiği gizli kelimeleri kesinlikle saklıyoruz. Ayrıca .json dosyasını da indirip yedeklemeyi unutmayın.
- Daha sonra aşağıdaki kodlarla adım adım yükleme işlemine geçiyoruz.Script ile kurulum kısa bir zamanda tamamlanıyor o yüzden yükleme adımı için onu kullanıyoruz.
- Script ZVALID e aittir. Yeni kod yayınlamadı ve kendisine ulaşamadım. Eğer yayınlarsa o kodu alacağım buraya. Ben de eskisini yeni versiyona göre uyarlayıp githubıma yükledim. Kendisine teşekkür ederim.

```
timedatectl | grep "System clock"
```
-Bu kodun çıktısı şöyle olmalı ``System clock synchronized: yes`` 

-Eğer çıktıyı böyle vermezse aşağıdaki kodları girip tekrar kontrol ediyorsunuz.

```
apt install ntp
ntpq -p
``` 
-Kurulumu aşağıdaki kodlarla başlatıyoruz.
```
wget -q -O subspace.sh https://raw.githubusercontent.com/okannako/subspacenetwork/main/subspace.sh && chmod +x subspace.sh && sudo /bin/bash subspace.sh
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
     - https://telemetry.subspace.network/#list/0x9ee86eefc3cc61c71a7751bba7f25e442da2512f408e6286153b3ccc055dccf0
- Son olarak aşağıdaki siteye giderek ve cüzdanımıza izin vererek blok imzaladıkça kazandığınımız ödülü görebiliriz.
     - https://polkadot.js.org/apps/?rpc=wss%3A%2F%2Feu.gemini-1b.subspace.network%2Fws#/accounts
- Bütün adımların uygulanışını görmek için şu videoyu izleyebilirsiniz.
     - https://www.youtube.com/watch?v=F1hSXOj44tI
