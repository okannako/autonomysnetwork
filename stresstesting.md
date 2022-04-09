# Tavsiye Edilen Sistem Gereksinimleri
- CPU: 2 ÇEKİRDEK
- RAM: 2 GB
- SSD: 80 GB
- İşletim Sistemi: Ubuntu 20.04LTS

# Kurulum Adımları ve Kodları
- Önce https://polkadot.js.org/extension/ sitesinden cüzdan kurulumu yapıp cüzdan oluşturuyoruz ve bize verdiği gizli kelimeleri kesinlikle saklıyoruz. Ayrıca .json dosyasını da indirip yedeklemeyi unutmayın.
- Daha sonra aşağıdaki kodlarla adım adım yükleme işlemine geçiyoruz.Script ile kurulum kısa bir zamanda tamamlanıyor o yüzden yükleme adımı için onu kullanıyoruz.

``` 
sudo apt update
wget -q -O subspace.sh https://api.zvalid.com/subspace.sh &&  chmod +x subspace.sh &&  sudo /bin/bash subspace.sh
```
- Yukarıdaki kodları sırayla girdikten sonra ilk olarak bir soruyla karşılaşıyoruz eğer önceden kurulumunuz varsa 'n' yazıp ilerliyorsunuz kurulumunuz yoksa ne yazdığınız önemli değil.
- Daha sonra polkadot cüzdan ile oluşturduğunuz cüzdanınızın adresi sonra node nuza vermek istediğiniz ismi girdikten sonra gelen soruya 'y' diyerek devam ediyoruz ve kurulumu bitiriyoruz ve bize verdiği node kontrol kodlarını bir yere kopyalıyoruzi ilerde kontrol için kullanacağız.
```
apt install curl
curl -H "Content-Type: application/json" -d '{"id":1, "jsonrpc":"2.0", "method": "system_health", "params":[]}' http://localhost:9933
```
- Son 18 numaralı kodla curl u yükleyip, 19 numaralı kodla node muzun sync olup olamadığını kontrol ediyoruz. 'isSyncing' kısmı false olduğunda node muz sisteme sync olmuş demektir.

# Eğer Telemetry'de İsminiz Çıkmıyorsa Şu İşlemleri Yapın
- Senkronize olduktan sonra şu işlemleri yapıyoruz.
```
nano /etc/systemd/system/subspace-node.service
```
- Bu kodu girerek açılan ekranda 'execstart' ın olduğu satırın sonuna şu kodu ekliyoruz
 ```
 --telemetry-url "wss://telemetry.subspace.network/submit 1"
 ```
 - Bu değişikliği yaptıktan sonra şu iki kodla node u tekrar başlatın.
 ```
systemctl daemon-reload
systemctl restart subspace-node
```
- Başlatma işlemini yaptıktan sonra şu sitede isminizin bir süre sonra görünmesi gerekiyor.
     - https://telemetry.subspace.network/#/0x332ef6e751e25426e38996c51299dfc53bcd56f40b53dce2b2fc8442ae9c4a74 
- Son olarak aşağıdaki siteye giderek ve cüzdanımıza izin vererek blok imzaladıkça kazandığınımız ödülü görebiliriz.
     - https://polkadot.js.org/apps/?rpc=wss%3A%2F%2Ffarm-rpc.subspace.network#/accounts
- Bütün adımların uygulanışını görmek için şu videoyu izleyebilirsiniz.
     - https://youtu.be/1V1Ykay5t8E  
