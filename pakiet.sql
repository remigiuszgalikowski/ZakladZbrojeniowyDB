CREATE OR REPLACE PACKAGE firma_zbrojeniowa IS
FUNCTION wymiana_raport(rodzaj_komponent VARCHAR2, czesc_stara_id INTEGER, czesc_nowa_id INTEGER) RETURN VARCHAR2;
FUNCTION licz_pojazdy_z( nazwa VARCHAR2, ajdi INTEGER ) RETURN INTEGER;
FUNCTION liczPracownikow(stanowisko VARCHAR2) RETURN INTEGER;
FUNCTION faktura_file( nazwa_pliku VARCHAR2 ) RETURN VARCHAR2;
FUNCTION kontrakt_file( nazwa_pliku VARCHAR2 ) RETURN VARCHAR2;
PROCEDURE wymiana(id_pojazdu INTEGER, rodzaj_komponent VARCHAR2, czesc_nowa_id INTEGER);
PROCEDURE zmiana_stanowiska(id_pracownika INTEGER, id_stanowisko INTEGER);
PROCEDURE zmiana_stanowiska(id_pracownika INTEGER, nazwa VARCHAR2);
PROCEDURE dodaj_pojazdy(ile INTEGER, przyp INTEGER, kadl INTEGER, wiez INTEGER, dzia INTEGER, siln INTEGER, radi INTEGER);
PROCEDURE dodaj_losowe_pojazdy(ile INTEGER, przyp INTEGER);
END firma_zbrojeniowa;
/
CREATE OR REPLACE PACKAGE BODY firma_zbrojeniowa IS
FUNCTION wymiana_raport(rodzaj_komponent VARCHAR2, czesc_stara_id INTEGER, czesc_nowa_id INTEGER)
RETURN VARCHAR2 IS
BEGIN
    DECLARE
    rodzaj_komponent_celownik VARCHAR2(64);
    czesc_stara_nazwa VARCHAR2(64);
    czesc_nowa_nazwa VARCHAR2(64);
    BEGIN
        CASE LOWER(rodzaj_komponent)
            WHEN 'kadlub' THEN
                SELECT model_kadluba INTO czesc_stara_nazwa FROM kadlub WHERE id=czesc_stara_id;
                SELECT model_kadluba INTO czesc_nowa_nazwa FROM kadlub WHERE id=czesc_nowa_id;
                rodzaj_komponent_celownik := 'kadluba';
            WHEN 'wieza' THEN
                SELECT model_wiezy INTO czesc_stara_nazwa FROM wieza WHERE id=czesc_stara_id;
                SELECT model_wiezy INTO czesc_nowa_nazwa FROM wieza WHERE id=czesc_nowa_id;
                rodzaj_komponent_celownik := 'wiezy';
            WHEN 'dzialo' THEN
                SELECT model_dziala INTO czesc_stara_nazwa FROM dzialo WHERE id=czesc_stara_id;
                SELECT model_dziala INTO czesc_nowa_nazwa FROM dzialo WHERE id=czesc_nowa_id;
                rodzaj_komponent_celownik := 'dziala';
            WHEN 'silnik' THEN
                SELECT model_silnika INTO czesc_stara_nazwa FROM silnik WHERE id=czesc_stara_id;
                SELECT model_silnika INTO czesc_nowa_nazwa FROM silnik WHERE id=czesc_nowa_id;
                rodzaj_komponent_celownik := 'silnika';
            WHEN 'radio' THEN
                SELECT model_radia INTO czesc_stara_nazwa FROM radio WHERE id=czesc_stara_id;
                SELECT model_radia INTO czesc_nowa_nazwa FROM radio WHERE id=czesc_nowa_id;
                rodzaj_komponent_celownik := 'radia';
            ELSE
                RAISE_APPLICATION_ERROR(-20010, 'Brak wprowadzonych danych w bazie.');
        END CASE;
        RETURN 'Wymiana ' || rodzaj_komponent_celownik || ' z ' || czesc_stara_nazwa || ' na ' || czesc_nowa_nazwa || '.';
    END;
END;
FUNCTION licz_pojazdy_z( nazwa VARCHAR2, ajdi INTEGER )
RETURN INTEGER IS
BEGIN
    DECLARE
    zwrot INTEGER;
    BEGIN
        CASE LOWER(nazwa)
            WHEN 'kadlub' THEN SELECT COUNT(kadlub_id) INTO zwrot FROM pojazdy WHERE kadlub_id=ajdi;
            WHEN 'wieza' THEN SELECT COUNT(wieza_id) INTO zwrot FROM pojazdy WHERE wieza_id=ajdi;
            WHEN 'dzialo' THEN SELECT COUNT(dzialo_id) INTO zwrot FROM pojazdy WHERE dzialo_id=ajdi;
            WHEN 'silnik' THEN SELECT COUNT(silnik_id) INTO zwrot FROM pojazdy WHERE silnik_id=ajdi;
            WHEN 'radio' THEN SELECT COUNT(radio_id) INTO zwrot FROM pojazdy WHERE radio_id=ajdi;
            ELSE
                RAISE_APPLICATION_ERROR(-20010, 'Brak wprowadzonych danych w bazie.');
            END CASE;
        RETURN zwrot;
    END;
END;
FUNCTION liczPracownikow(stanowisko VARCHAR2)
RETURN INTEGER IS
BEGIN
    DECLARE
    zwrot INTEGER;
    ajdi INTEGER;
    BEGIN
        SELECT id INTO ajdi FROM stanowisko WHERE nazwa_stanowiska=LOWER(REPLACE(stanowisko, '_', ' '));
        SELECT COUNT(stanowisko_id) INTO zwrot FROM pracownik WHERE stanowisko_id=ajdi;
        RETURN zwrot;
    END;
END;
FUNCTION faktura_file( nazwa_pliku VARCHAR2 )
RETURN VARCHAR2 IS
BEGIN
RETURN 'F:/Faktury/' || extract(year from SYSDATE) || '/' || nazwa_pliku;
END;
FUNCTION kontrakt_file( nazwa_pliku VARCHAR2 )
RETURN VARCHAR2 IS
BEGIN
RETURN 'K:/Kontrakty/' || extract(year from SYSDATE) || '/' || nazwa_pliku;
END;
PROCEDURE wymiana(id_pojazdu INTEGER, rodzaj_komponent VARCHAR2, czesc_nowa_id INTEGER)
IS
czesc_stara_id INTEGER;
BEGIN
EXECUTE IMMEDIATE 'SELECT ' || LOWER(rodzaj_komponent) ||'_id FROM pojazdy WHERE id ='|| id_pojazdu  INTO czesc_stara_id;
INSERT INTO zmiany(opis_zmiany, pojazdy_id) VALUES (wymiana_raport(rodzaj_komponent, czesc_stara_id, czesc_nowa_id), id_pojazdu);
EXECUTE IMMEDIATE 'UPDATE pojazdy SET '||LOWER(rodzaj_komponent)||'_id = '||czesc_nowa_id||' WHERE id=' || id_pojazdu;
END;
PROCEDURE zmiana_stanowiska(id_pracownika INTEGER, id_stanowisko INTEGER)
IS
BEGIN
UPDATE pracownik SET stanowisko_id = id_stanowisko where id=id_pracownika;
UPDATE konto SET uprawnienia_stanowisko_id = id_stanowisko where pracownik_id=id_pracownika;
END;
PROCEDURE zmiana_stanowiska(id_pracownika INTEGER, nazwa VARCHAR2)
IS
BEGIN
UPDATE pracownik SET stanowisko_id = (SELECT id FROM stanowisko WHERE nazwa_stanowiska=LOWER(nazwa)) where id=id_pracownika;
UPDATE konto SET uprawnienia_stanowisko_id = (SELECT id FROM stanowisko WHERE nazwa_stanowiska=LOWER(nazwa)) where pracownik_id=id_pracownika;
END;
PROCEDURE dodaj_pojazdy(ile INTEGER, przyp INTEGER, kadl INTEGER, wiez INTEGER, dzia INTEGER, siln INTEGER, radi INTEGER)
IS
BEGIN
    FOR i IN 1 .. ile LOOP
        INSERT INTO pojazdy(przypis_id, kadlub_id, wieza_id, dzialo_id, silnik_id, radio_id) VALUES (przyp, kadl, wiez, dzia, siln, radi);
    END LOOP;
END;
PROCEDURE dodaj_losowe_pojazdy(ile INTEGER, przyp INTEGER)
IS
kadl INTEGER;
wiez INTEGER;
dzia INTEGER;
siln INTEGER;
radi INTEGER;
BEGIN
    FOR i IN 1 .. ile LOOP
    SELECT dbms_random.value(1,(SELECT COUNT(id) FROM kadlub)) num INTO kadl FROM dual;
    SELECT dbms_random.value(1,(SELECT COUNT(id) FROM wieza)) num INTO wiez FROM dual;
    SELECT dbms_random.value(1,(SELECT COUNT(id) FROM dzialo)) num INTO dzia FROM dual;
    SELECT dbms_random.value(1,(SELECT COUNT(id) FROM silnik)) num INTO siln FROM dual;
    SELECT dbms_random.value(1,(SELECT COUNT(id) FROM radio)) num INTO radi FROM dual;
        INSERT INTO pojazdy(przypis_id, kadlub_id, wieza_id, dzialo_id, silnik_id, radio_id) VALUES (przyp, kadl, wiez, dzia, siln, radi);
    END LOOP;
END;
END firma_zbrojeniowa;
/