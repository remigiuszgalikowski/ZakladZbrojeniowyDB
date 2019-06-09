--Wymiana czesci pojazdu, czyli update tabel i wygenerowanie raportu i insert go do tabeli zmiany
CREATE OR REPLACE PROCEDURE wymiana(id_pojazdu INTEGER, rodzaj_komponent VARCHAR2, czesc_nowa_id INTEGER)
IS
czesc_stara_id INTEGER;
BEGIN
EXECUTE IMMEDIATE 'SELECT ' || LOWER(rodzaj_komponent) ||'_id FROM pojazdy WHERE id ='|| id_pojazdu  INTO czesc_stara_id;
INSERT INTO zmiany(opis_zmiany, pojazdy_id) VALUES (wymiana_raport(rodzaj_komponent, czesc_stara_id, czesc_nowa_id), id_pojazdu);
EXECUTE IMMEDIATE 'UPDATE pojazdy SET '||LOWER(rodzaj_komponent)||'_id = '||czesc_nowa_id||' WHERE id=' || id_pojazdu;
END;
/

--Zmiana stanowiska pracownika, czyli update id stanowiska pracownika oraz update id uprawnien konta
CREATE OR REPLACE PROCEDURE zmiana_stanowiska(id_pracownika INTEGER, id_stanowisko INTEGER)
IS
BEGIN
UPDATE pracownik SET stanowisko_id = id_stanowisko where id=id_pracownika;
UPDATE konto SET uprawnienia_stanowisko_id = id_stanowisko where pracownik_id=id_pracownika;
END;
/

CREATE OR REPLACE PROCEDURE zmiana_stanowiska(id_pracownika INTEGER, nazwa VARCHAR2)
IS
BEGIN
UPDATE pracownik SET stanowisko_id = (SELECT id FROM stanowisko WHERE nazwa_stanowiska=LOWER(nazwa)) where id=id_pracownika;
UPDATE konto SET uprawnienia_stanowisko_id = (SELECT id FROM stanowisko WHERE nazwa_stanowiska=LOWER(nazwa)) where pracownik_id=id_pracownika;
END;
/

--Dodanie okreslonej liczby pojazdow o okreslonych modulach
CREATE OR REPLACE PROCEDURE dodaj_pojazdy(ile INTEGER, przyp INTEGER, kadl INTEGER, wiez INTEGER, dzia INTEGER, siln INTEGER, radi INTEGER)
IS
BEGIN
    FOR i IN 1 .. ile LOOP
        INSERT INTO pojazdy(przypis_id, kadlub_id, wieza_id, dzialo_id, silnik_id, radio_id) VALUES (przyp, kadl, wiez, dzia, siln, radi);
    END LOOP;
END;
/

--Dodanie  okreslonej liczby pojazdow o losowych modulach
CREATE OR REPLACE PROCEDURE dodaj_losowe_pojazdy(ile INTEGER, przyp INTEGER)
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
/