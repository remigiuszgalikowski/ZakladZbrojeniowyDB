--Generowanie opisu wymiany czesci
CREATE OR REPLACE FUNCTION wymiana_raport(rodzaj_komponent VARCHAR2, czesc_stara_id INTEGER, czesc_nowa_id INTEGER)
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
/

--Policzenie pojazdow skladajacych sie z okreslonego modulu
CREATE OR REPLACE FUNCTION licz_pojazdy_z( nazwa VARCHAR2, ajdi INTEGER )
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
/

--Policzenie pracownikow na okreslonym stanowisku
CREATE OR REPLACE FUNCTION liczPracownikow(stanowisko VARCHAR2)
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
/

--Generowanie sciezki do pliku faktury o okreslonej nazwie
CREATE OR REPLACE FUNCTION faktura_file( nazwa_pliku VARCHAR2 )
RETURN VARCHAR2 IS
BEGIN
RETURN 'F:/Faktury/' || extract(year from SYSDATE) || '/' || nazwa_pliku;
END;
/


--Generowanie sciezki do pliku kontraktu o okreslonej nazwie
CREATE OR REPLACE FUNCTION kontrakt_file( nazwa_pliku VARCHAR2 )
RETURN VARCHAR2 IS
BEGIN
RETURN 'K:/Kontrakty/' || extract(year from SYSDATE) || '/' || nazwa_pliku;
END;
/