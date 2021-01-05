CREATE TRIGGER wyzwalacz1 BEFORE INSERT ON Pracownicy
FOR EACH ROW SET NEW.dataZatrudnienia = now();

CREATE TRIGGER wyzwalacz2 BEFORE UPDATE ON Produkty
FOR EACH ROW SET NEW.ilośćProduktu = NEW.ilośćProduktu + OLD.ilośćProduktu;

CREATE PROCEDURE procedura(OUT ile INT)
SELECT COUNT(*) INTO ile FROM Dostawcy

delimiter //
CREATE FUNCTION funkcja(dataWysyłki DATE)
RETURNS VARCHAR(25)
	DETERMINISTIC
    BEGIN
     DECLARE wynik VARCHAR(3);
        IF curdate() >= dataWysyłki
            THEN SET wynik = 'Wysłane';
        ELSEIF  curdate() < return_date
            THEN SET wynik = 'Niewysłane';
        END IF;
     RETURN wynik;
    END//
delimiter ;


    
