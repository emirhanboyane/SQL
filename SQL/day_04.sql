--ALIASES

CREATE TABLE calisanlar  (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO calisanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO calisanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO calisanlar VALUES(345678901, 'Mine Bulut', 'Izmir');

select * from calisanlar
select calisan_id as id from calisanlar

-- eger iki stunun verilerini birleştirmek istersek concet sembolu olan||kullanırız
select calisan_id as id, calisan_isim ||' ' || calisan_dogdugu_sehir as calisan_bilgisi from calisanlar

--2.yol
select calisan_id as id, concat(calisan_isim,' ', calisan_dogdugu_sehir )as calisan_bilgisi from calisanlar

--IS NULL CONDITION arama yapılan field da null değeri almış kayıtları getirir
CREATE TABLE insanlar1
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar1 VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar1 VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar1 VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar1 (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar1 (ssn, adres) VALUES(567890123, 'Denizli');

select * from insanlar1

-- nae stununda null olan değerleri listeleyelim

select name from insanlar1 where name is null

--insanlar tablosunda sadece null olmayan değeri listeleyiniz

select name from insanlar1 where name is not null

--insanlar1 tablosunda null değer almış verileri no name olarak değiştiriniz

update insanlar1
set name='No Name'
where name is null;

--ORDER BY KOMUTU
/*
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar asc 
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/
CREATE TABLE insanlar2
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar2 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar2 VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar2 VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar2 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar2 VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar2 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');
 select * from insanlar2
 
--insanlar2 tablosundaki dataları adrese göre sırala

select *from insanlar2 order by adres;
select *from insanlar2 order by soyisim;

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin

select * from insanlar2 where isim='Mine'order by ssn

--NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin

select * from insanlar2 where soyisim='Bulut'order by 4;

--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
select * from insanlar2 order by ssn desc;

-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
select * from insanlar2 order by isim asc,soyisim desc;

-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
/*
eger sütun uzunluğuna göre sıralamak istersek lenght komutunu kullanırız ve yine
uzunluğu büyükten küçüğe sıralaak istersek sonuna desc komutunu ekleriz
*/
select isim,soyisim from insanlar2 order by length(soyisim);
select isim,soyisim from insanlar2 order by length(soyisim)desc;

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
select isim||' '||soyisim as isim_soyisim from insanlar2 order by length(isim||soyisim);

select isim||' '||soyisim as isim_soyisim from insanlar2 order by length(isim)+length(soyisim);

select concat (isim,' ',soyisim) as isim_soyisim from insanlar2 order by length(isim)+length(soyisim);

select concat (isim,' ',soyisim) as isim_soyisim from insanlar2 order by length(concat(isim,soyisim))

	--GROUP BY CLAUSE
/*
Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT
komutuyla birlikte kullanılır.
*/
CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav

--isme göre alınan toplam ürünleri bulun
select isim,sum(urun_miktar)as aldığı_toplam_urun from manav
group by isim;

--isme göre alınan toplam ürünleri bulun ve ürünleri büyükten küçüğe sıralayınız
select isim,sum(urun_miktar)as aldığı_toplam_urun from manav
group by isim
order by aldığı_toplam_urun desc;

-- Urun ismine gore urunu alan toplam kisi sayisi
select urun_adi,count (isim)from manav
group by urun_adi;

select isim,count( urun_adi)as aldığı_urun_miktarı from manav 
group by isim;