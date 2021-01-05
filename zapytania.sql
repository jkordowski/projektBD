USE Praca;

CREATE VIEW cenaZamówień AS 
SELECT Zamówienia.idZamówienia, Zamówienia.ilość*Produkty.cenaJednostki AS cenaZamówienia FROM Zamówienia INNER JOIN Produkty ON Zamówienia.idProduktu = Produkty.idProduktu;

CREATE VIEW średniaPłaca2019 AS 
SELECT AVG(płaca) AS średniaPłaca2019 FROM Pracownicy WHERE YEAR(dataZatrudnienia) = 2019;

CREATE VIEW liczbaKraiiKlientów AS 
SELECT COUNT(DISTINCT(kraj)) AS liczbaKraiKlientów FROM Klienci;

CREATE VIEW zamówieniaPracowników AS
SELECT Pracownicy.idPracownika,Zamówienia.idZamówienia FROM Pracownicy RIGHT JOIN Zamówienia ON Pracownicy.idPracownika = Zamówienia.idSprzedawcy;

CREATE VIEW kupującyProdukt AS
SELECT Zamówienia.idZamówienia, Klienci.nazwaFirmy AS nazwaKupującego, Produkty.nazwaProduktu FROM Zamówienia INNER JOIN Klienci ON Zamówienia.idKlienta = Klienci.idKlienta INNER JOIN Produkty ON Zamówienia.idProduktu = Produkty.idProduktu;

CREATE VIEW liczbaStanowisk AS
SELECT stanowisko, COUNT(*) AS liczbaStanowisk FROM Pracownicy GROUP BY stanowisko ORDER BY liczbaStanowisk DESC;

CREATE VIEW daneDokonanychWysyłek AS
SELECT Produkty.idProduktu,Produkty.nazwaProduktu,Zamówienia.ilość,Zamówienia.dataWysyłki FROM Zamówienia LEFT JOIN Produkty ON Zamówienia.idProduktu = Produkty.idProduktu WHERE dataWysyłki IS NOT NULL ORDER BY Produkty.idProduktu ASC;

CREATE VIEW dużeZamówieniaOdLutegoDoLipca AS
SELECT * FROM Zamówienia WHERE ilość>20 AND MONTH(dataZamówienia) BETWEEN 02 AND 07;

CREATE VIEW dostawyZPolski AS
SELECT * FROM Produkty WHERE idDostawcy IN (SELECT idDostawcy FROM Dostawcy WHERE kraj = 'Polska');

CREATE VIEW daneNajdroższegoPracownika AS
SELECT * FROM Pracownicy WHERE płaca = (SELECT MAX(płaca) FROM Pracownicy);

