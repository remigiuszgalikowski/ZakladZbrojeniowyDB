--Automatyczne ustalenie daty wystawienia faktury
CREATE OR REPLACE TRIGGER faktura_autodate_trg BEFORE
    INSERT ON faktura
    FOR EACH ROW
    WHEN ( new.data_wystawienia IS NULL )
BEGIN
    :new.data_wystawienia := SYSDATE;
END;
/

--Automatyczne ustalenie daty dokonania zmiany
CREATE OR REPLACE TRIGGER zmiana_autodate_trg BEFORE
    INSERT ON zmiany
    FOR EACH ROW
    WHEN ( new.data_zmiany IS NULL )
BEGIN
    :new.data_zmiany := SYSDATE;
END;
/

--Automatyczne ustalenie daty dokonania testu
CREATE OR REPLACE TRIGGER testy_autodate_trg BEFORE
    INSERT ON testy
    FOR EACH ROW
    WHEN ( new.data_testu IS NULL )
BEGIN
    :new.data_testu := SYSDATE;
END;
/

--Sprawdzanie poprawnoœci kodu pocztowego
CREATE OR REPLACE TRIGGER kod_poczt_check_trg BEFORE INSERT ON adres
    FOR EACH ROW
    WHEN (SUBSTR(new.kod,1,1) NOT IN ('0','1','2','3','4','5','6','7','8','9') OR SUBSTR(new.kod,2,1) NOT IN ('0','1','2','3','4','5','6','7','8','9') OR SUBSTR(new.kod,3,1) NOT IN ('-')  OR SUBSTR(new.kod,4,1) NOT IN ('0','1','2','3','4','5','6','7','8','9') OR SUBSTR(new.kod,5,1) NOT IN ('0','1','2','3','4','5','6','7','8','9') OR SUBSTR(new.kod,6,1) NOT IN ('0','1','2','3','4','5','6','7','8','9'))
BEGIN
    RAISE_APPLICATION_ERROR(-20002, 'Bledny kod pocztowy');
END;
/

--Sprawdzanie czy faktura zosta³a wystawiona po transakcji
CREATE OR REPLACE TRIGGER faktura_date_check_trg BEFORE INSERT ON faktura
    FOR EACH ROW
    WHEN (new.data_wystawienia > new.data_transakcji)
BEGIN
    RAISE_APPLICATION_ERROR(-20003, 'Faktura nie moze zostac wystawiona po transakcji.');
END;
/

--Poprawianie wpisywanych imion i nazwisk, aby zaczynaly siê wielka litera, a reszta liter byla mala
CREATE OR REPLACE TRIGGER imie_nazwisko_trg BEFORE INSERT ON pracownik FOR EACH ROW
BEGIN
    :new.imie := UPPER(SUBSTR(:new.imie,1,1)) || LOWER(SUBSTR(:new.imie,2,32));
    :new.nazwisko := UPPER(SUBSTR(:new.nazwisko,1,1)) || LOWER(SUBSTR(:new.nazwisko,2,32));
END;
/

--Sprawdzanie czy zadne stanowisko poza administratorem nie otrzyma uprawnien administratorskich (rownych 3)
CREATE OR REPLACE TRIGGER sprawdzacz_upr_trg BEFORE
    INSERT ON uprawnienia
    FOR EACH ROW
BEGIN
    IF :new.stanowisko_id != 1 
        THEN IF :new.upr_pojazdy = 3 OR :new.upr_warsztat = 3 OR :new.upr_test = 3 OR :new.upr_magazyn = 3 OR :new.upr_ksiegowosc = 3 OR :new.upr_zarzad = 3 OR :new.upr_it = 3
            THEN RAISE_APPLICATION_ERROR(-20001, 'Nie mozna przydzielic uprawnien administratorskich dla konta nieadministratorskiego');
        END IF;
    END IF;
END;
/