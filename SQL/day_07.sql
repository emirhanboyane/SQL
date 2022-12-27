--DİSTİNCT

CREATE TABLE musteri_urun 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);

INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');

select * from musteri_urun 

-- Musteri urun tablosundan urun isimlerini tekrarsız(grup) listeleyiniz

--group by çözümü
select urun_isim from musteri_urun
group by urun_isim

--distinct çozumu 
select distinct(urun_isim) from musteri_urun

--tabloda kaç afarklı meyve vardır 
select urun_isim,count(urun_isim) from musteri_urun
group by urun_isim

--fetch next() row only / offset / limit

-- musteri urun tablosundan ilk üç kaydı listeleyiniz 
select * from musteri_urun order by urun_id 
fetch next 3 row only 

--limit
select * from musteri_urun order by urun_id 
limit 3

--musteri urun tablosundanilk kaydı listeleyiniz 
select * from musteri_urun order by urun_id
limit 1 

CREATE TABLE maas 
(
id int, 
musteri_isim varchar(50),
maas int 
);

INSERT INTO maas VALUES (10, 'Ali', 5000); 
INSERT INTO maas VALUES (10, 'Ali', 7500); 
INSERT INTO maas VALUES (20, 'Veli', 10000); 
INSERT INTO maas VALUES (30, 'Ayse', 9000); 
INSERT INTO maas VALUES (20, 'Ali', 6500); 
INSERT INTO maas VALUES (10, 'Adem', 8000); 
INSERT INTO maas VALUES (40, 'Veli', 8500); 
INSERT INTO maas VALUES (20, 'Elif', 5500);

select *from maas

--en yüksek maaş alanmüşteriyi listeleyiniz

select * from maas order by maas desc limit 1

--maas tablosundan en yuksek ikinci maasi listeleyiniz 

select * from maas order by maas desc limit 1 offset 1 limit 1

--OFSET;satır atlamk istediğimize offsetkomutunu kullanırız 

--DDL ALTER TABLE

drop table personel -- Tabloyu ortadan kaldırmak için kullanılır-

CREATE TABLE personel2  (
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20),
CONSTRAINT personel2_pk PRIMARY KEY (id)
);
INSERT INTO personel2 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel2 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel2 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel2 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel2 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel2 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel2 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

select * from personel2

--ADD defolt değer ile tabloya değer ekleme

alter table personel2
add ulke varchar (30)

alter table personel2
add adres varchar (50)default 'turkiye'--default oluşturduğuuz sutuna belirttiğimiz veiyi tüm satırlara girer

-- DROP tablodan sutun silme 

drop table personel -- Tabloyu ortadan kaldırmak için kullanılırulke

alter table personel2
drop column adres

--RENAME COLUMN sutun adı değiştirme

alter table personel2
rename column sehir to il

--RENAME tablonun ismini değiştirme

alter table personel2
rename to isci

select * from isci

--TAYPE/SET(modify) sutunların özelliklerini değiştirme

drop table personel -- Tabloyu ortadan kaldırmak için kullanılır
alter table isci
alter column il type varchar(30),
alter column maas set not null;

/*
eğer numerik data türüne sahip bir sütunun data türüne string bir data türü atamak istersek
type varchar (30) using (maas::varchar(30)) bu formatı kullanırız
*/
alter table isci
alter column maas 
type varchar(30) using (maas::varchar(30))

--TRANSACTION (begin--savepoint--rollback--commit)

/*
	Transaction baslatmak icin BEGIN komutu kullanmamiz gerekir ve Transaction'i sonlandirmak icin
	COMMIT komutunu calistirmaliyiz.
*/

CREATE TABLE ogrenciler4
(
id serial,---- Serial data turu otomatik olarak birden baslayarak sirali olarak sayi atamasi yapar
		   -- INSERT INTO ile tabloya veri eklerken serial data turunu kullandigim veri degeri yerine DEFAULT yazariz
	
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real       
);
BEGIN;
INSERT INTO ogrenciler4 VALUES(default, 'Ali Can', 'Hasan',75.5);
INSERT INTO ogrenciler4 VALUES(default, 'Merve Gul', 'Ayse',85.3);
savepoint x;
INSERT INTO ogrenciler4 VALUES(default, 'Kemal Yasa', 'Hasan',85.6);
INSERT INTO ogrenciler4 VALUES(default, 'Nesibe Yilmaz', 'Ayse',95.3);
savepoint y;
INSERT INTO ogrenciler4 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler4 VALUES(default, 'Can Bak', 'Ali', 67.5);
ROLLBACK to x;
COMMIT;


select * from ogrenciler4
delete from ogrenciler4



