USE Praca;

CREATE TABLE Pracownicy(idPracownika INT PRIMARY KEY AUTO_INCREMENT, nazwisko VARCHAR(25) NOT NULL, imię VARCHAR(25) NOT NULL, stanowisko VARCHAR(25) DEFAULT 'Pomocnik', wiek INT CHECK(wiek>18), dataZatrudnienia DATE, płaca INT DEFAULT 3000, telefon VARCHAR(9) DEFAULT NULL UNIQUE);
CREATE TABLE Klienci(idKlienta INT PRIMARY KEY AUTO_INCREMENT, nazwaFirmy VARCHAR(25) NOT NULL, przedstawiciel VARCHAR(25) NOT NULL, miasto VARCHAR(50) NOT NULL, kraj VARCHAR(25) NOT NULL DEFAULT 'Polska', telefon VARCHAR(9) NOT NULL UNIQUE);
CREATE TABLE Dostawcy(idDostawcy INT PRIMARY KEY AUTO_INCREMENT, nazwaFirmy VARCHAR(25) NOT NULL, przedstawiciel VARCHAR(25) NOT NULL, miasto VARCHAR(50) NOT NULL, kraj VARCHAR(25) NOT NULL DEFAULT 'Polska',telefon VARCHAR(9) NOT NULL UNIQUE);
CREATE TABLE Produkty(idProduktu INT PRIMARY KEY AUTO_INCREMENT, nazwaProduktu VARCHAR(50) NOT NULL, idDostawcy INT, ilośćProduktu INT DEFAULT 100, cenaJednostki INT NOT NULL DEFAULT 25, FOREIGN KEY (idDostawcy) REFERENCES Dostawcy (idDostawcy) ON DELETE CASCADE);
CREATE TABLE Zamówienia(idZamówienia INT PRIMARY KEY AUTO_INCREMENT, idKlienta INT NOT NULL, idSprzedawcy INT NOT NULL, idProduktu INT NOT NULL, ilość INT NOT NULL, dataZamówienia DATE NOT NULL, dataWysyłki DATE DEFAULT NULL, FOREIGN KEY (idKlienta) REFERENCES Klienci (idKlienta) ON DELETE CASCADE, FOREIGN KEY (idSprzedawcy) REFERENCES Pracownicy (idPracownika) ON DELETE CASCADE, FOREIGN KEY (idProduktu) REFERENCES Produkty (idProduktu) ON DELETE CASCADE);

INSERT Pracownicy (nazwisko,imię,stanowisko,wiek,dataZatrudnienia,płaca,telefon) VALUES
('Nowak','Adam',DEFAULT,30,'2018-05-12',DEFAULT,'123456789'),
('Kowalski','Karol',DEFAULT,35,'2018-05-12',DEFAULT,'111222333'),
('Wójcik','Jadwiga',DEFAULT,42,'2018-05-13',DEFAULT,'987654321'),
('Lewandowska','Maria',DEFAULT,21,'2018-07-17',DEFAULT,'123123123'),
('Kwiatkowski','Adam',DEFAULT,44,'2018-06-30',DEFAULT,'444555666'),
('Wożniak','Mateusz','Sprzedawca',30,'2020-05-12',6000,'777888999'),
('Wiśniewski','Dariusz','Sprzedawca',24,'2018-06-12',6000,'456456456'),
('Kowalczyk','Adam','Sprzedawca',55,'2020-02-22',6000,'789789789'),
('Szymański','Szymon','Sprzedawca',34,'2019-03-21',6000,'321321321'),
('Szymańska','Ola','Sprzedawca',32,'2019-03-20',8000,'654654654'),
('Dąbrowski','Karol','Sprzedawca',52,'2018-02-14',8000,'987987987'),
('Kozioł','Hubert','Księgowy',30,'2019-10-21',8000,'123454321'),
('Janowski','Jakub','Księgowy',30,'2018-01-01',9000,'987656789'),
('Mazur','Dominika','Sekretarka',29,'2018-01-01',5000,'333222111'),
('Nowak','Stefan','Prezes',28,'2018-01-01',10000,'666555444');

INSERT Klienci(nazwaFirmy,przedstawiciel,miasto,kraj,telefon) VALUES
('SuperBooks','Adam','Warszawa',DEFAULT,'111111111'),
('Biblioteka Nr. Jeden','Jan','Warszawa',DEFAULT,'222222222'),
('Księgarnia Pod Mostem','Aleksander','Warszawa',DEFAULT,'333333333'),
('SuperBooks','Filip','Olsztyn',DEFAULT,'444444444'),
('BBB','Szymon','Olsztyn',DEFAULT,'555555555'),
('Księgarnia Nad Mostem','Mikołaj','Kraków',DEFAULT,'666666666'),
('Biblioteka Wrocławska','Jan','Wrocław',DEFAULT,'777777777'),
('Książki za Tanio','Alicja','Poznań',DEFAULT,'888888888'),
('SuperBooks France','Francis','Lyon','Francja','999999999'),
('Biblioteka Le Petit','Claude','Paryż','Francja','000000000'),
('BibloFan','Alexandria','Rzym','Włochy','101010101'),
('SuperBooks Germany','Bruno','Munich','Niemcy','010101010'),
('UltraBooks','Adrian','Berlin','Niemcy','121212121');

INSERT Dostawcy(nazwaFirmy,przedstawiciel,miasto,kraj,telefon) VALUES
('Tanie Książki','Zenek','Kraków',DEFAULT,'100000000'),
('Tańsze Książki','Arkadiusz','Warszawa',DEFAULT,'010000000'),
('Najtańsze Książki','Bogdan','Warszawa',DEFAULT,'001000000'),
('Książki Naukowe','Aleksandra','Poznań',DEFAULT,'000100000'),
('Best Books','Thomas','New York','USA','000010000'),
('B.C.K.','Billy','Las Vegas','USA','000001000'),
('New and Fresh','Bob','Detroit','USA','000000100'),
('Bookmacher','Abraham','Stockholm','Szwecja','000000001'),
('Biblograph','Alf','Stockholm','Szwecja','110000000'),
('Banned Books','Ludwig','Geneva','Szwajcaria','101000000'),
('Histories and Fiction','Anna','Kazan','Rosja','100100000');

INSERT Produkty(nazwaProduktu,idDostawcy,ilośćProduktu,cenaJednostki) VALUES
('Matematyka nr. 1',6,DEFAULT,DEFAULT),
('Podstawy Geografi',1,DEFAULT,DEFAULT),
('Amazing Spiderman Vol. 1',2,DEFAULT,DEFAULT),
('Władca Pierścienia',3,DEFAULT,DEFAULT),
('Czarna Kompania',4,DEFAULT,DEFAULT),
('Python For Dummies',6,300,DEFAULT),
('Historia Wojny',11,300,30),
('Sztuka Wojenna Sun Zi',11,205,30),
('Rok 1984',10,142,30),
('Harry Potter',8,20,50),
('Śmierć Czarnej Kompanii',9,50,50),
('Hobbit',7,225,50),
('Matematyka dla Gimnazjalistów',5,500,50),
('Kolorowanki dla Najmłodszych',3,1000,12),
('Podstawy Matematyka',9,120,12),
('Kurs Programowania',9,225,80),
('Matematyka dla Studentów',5,1000,80),
('Zadania na Kolokwium',10,2,500);

INSERT Zamówienia (idKlienta,idSprzedawcy,idProduktu,ilość,dataZamówienia,dataWysyłki) VALUES
(1,6,10,10,'2020-02-14','2020-02-20'),
(2,6,10,10,'2020-01-11','2020-01-13'),
(3,9,1,15,'2018-03-13','2018-03-16'),
(4,10,3,15,'2018-09-29','2018-10-12'),
(5,10,16,25,'2019-04-04','2019-04-04'),
(6,6,15,80,'2019-02-14','2019-02-20'),
(7,8,15,20,'2018-02-14','2018-02-20'),
(8,6,16,125,'2018-03-23','2018-03-25'),
(9,7,17,200,'2018-05-15','2018-05-21'),
(10,7,4,45,'2020-08-12',NULL),
(11,7,1,60,'2019-01-11','2020-01-30'),
(11,6,7,100,'2019-06-30','2019-07-05'),
(11,6,7,100,'2018-11-14','2018-11-20'),
(4,8,2,25,'2018-02-14','2020-02-20'),
(5,8,9,70,'2019-06-30','2019-07-07'),
(7,9,8,5,'2019-02-15','2019-02-16'),
(8,10,14,250,'2018-05-16','2018-05-18'),
(1,11,15,20,'2020-08-12',NULL);