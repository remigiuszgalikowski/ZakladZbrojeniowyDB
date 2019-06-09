CREATE TABLE adres (
    id       INTEGER NOT NULL,
    miasto   VARCHAR2(32) NOT NULL,
    kod      VARCHAR2(6) NOT NULL,
    ulica    VARCHAR2(32) NOT NULL,
    numer    INTEGER NOT NULL
);

ALTER TABLE adres ADD CONSTRAINT adres_pk PRIMARY KEY ( id );

CREATE TABLE dzialo (
    id               INTEGER NOT NULL,
    model_dziala     VARCHAR2(32) NOT NULL,
    kaliber_dziala   INTEGER NOT NULL,
    producent_id     INTEGER NOT NULL
);

ALTER TABLE dzialo ADD CONSTRAINT dzialo_pk PRIMARY KEY ( id );

ALTER TABLE dzialo ADD CONSTRAINT dzialo__un UNIQUE ( model_dziala );

CREATE TABLE faktura (
    id                      INTEGER NOT NULL,
    data_wystawienia        DATE NOT NULL,
    data_transakcji         DATE NOT NULL,
    sciezka_pliku_faktura   VARCHAR2(128) NOT NULL,
    klient_adres_id         INTEGER NOT NULL,
    zamowienie_id           INTEGER NOT NULL,
    pracownik_id            INTEGER NOT NULL
);

ALTER TABLE faktura ADD CONSTRAINT faktura_pk PRIMARY KEY ( id );

ALTER TABLE faktura ADD CONSTRAINT faktura__un UNIQUE ( sciezka_pliku_faktura );

CREATE TABLE kadlub (
    id              INTEGER NOT NULL,
    model_kadluba   VARCHAR2(32) NOT NULL,
    producent_id    INTEGER NOT NULL
);

ALTER TABLE kadlub ADD CONSTRAINT kadlub_pk PRIMARY KEY ( id );

ALTER TABLE kadlub ADD CONSTRAINT kadlub__un UNIQUE ( model_kadluba );

CREATE TABLE klient (
    nazwa_firmy   VARCHAR2(32) NOT NULL,
    adres_id      INTEGER NOT NULL
);

ALTER TABLE klient ADD CONSTRAINT klient_pk PRIMARY KEY ( adres_id );

ALTER TABLE klient ADD CONSTRAINT klient__un UNIQUE ( nazwa_firmy );

CREATE TABLE konto (
    login                       VARCHAR2(16) NOT NULL,
    haslo                       VARCHAR2(32) NOT NULL,
    pracownik_id                INTEGER NOT NULL,
    uprawnienia_stanowisko_id   INTEGER NOT NULL
);

ALTER TABLE konto ADD CONSTRAINT konto_pk PRIMARY KEY ( pracownik_id );

ALTER TABLE konto ADD CONSTRAINT konto__un UNIQUE ( login );

CREATE TABLE kontrakt (
    id                       INTEGER NOT NULL,
    sciezka_pliku_kontrakt   VARCHAR2(128) NOT NULL
);

ALTER TABLE kontrakt ADD CONSTRAINT kontrakt_pk PRIMARY KEY ( id );

ALTER TABLE kontrakt ADD CONSTRAINT kontrakt__un UNIQUE ( sciezka_pliku_kontrakt );

CREATE TABLE pojazdy (
    id           INTEGER NOT NULL,
    przypis_id   INTEGER NOT NULL,
    kadlub_id    INTEGER NOT NULL,
    wieza_id     INTEGER NOT NULL,
    dzialo_id    INTEGER NOT NULL,
    silnik_id    INTEGER NOT NULL,
    radio_id     INTEGER NOT NULL
);

ALTER TABLE pojazdy ADD CONSTRAINT pojazdy_pk PRIMARY KEY ( id );

CREATE TABLE pracownik (
    id              INTEGER NOT NULL,
    imie            VARCHAR2(20) NOT NULL,
    nazwisko        VARCHAR2(32) NOT NULL,
    adres_id        INTEGER NOT NULL,
    stanowisko_id   INTEGER NOT NULL
);

ALTER TABLE pracownik ADD CONSTRAINT pracownik_pk PRIMARY KEY ( id );

CREATE TABLE producent (
    id                 INTEGER NOT NULL,
    nazwa_producenta   VARCHAR2(32) NOT NULL
);

ALTER TABLE producent ADD CONSTRAINT producent_pk PRIMARY KEY ( id );

ALTER TABLE producent ADD CONSTRAINT producent__un UNIQUE ( nazwa_producenta );

CREATE TABLE przypis (
    id INTEGER NOT NULL
);

ALTER TABLE przypis ADD CONSTRAINT przypis_pk PRIMARY KEY ( id );

CREATE TABLE radio (
    id             INTEGER NOT NULL,
    model_radia    VARCHAR2(32) NOT NULL,
    zasieg_radia   INTEGER NOT NULL,
    producent_id   INTEGER NOT NULL
);

ALTER TABLE radio ADD CONSTRAINT radio_pk PRIMARY KEY ( id );

ALTER TABLE radio ADD CONSTRAINT radio__un UNIQUE ( model_radia );

CREATE TABLE silnik (
    id              INTEGER NOT NULL,
    model_silnika   VARCHAR2(32) NOT NULL,
    uklad_silnika   VARCHAR2(3) NOT NULL,
    hp_silnika      INTEGER NOT NULL,
    producent_id    INTEGER NOT NULL
);

ALTER TABLE silnik ADD CONSTRAINT silnik_pk PRIMARY KEY ( id );

ALTER TABLE silnik ADD CONSTRAINT silnik__un UNIQUE ( model_silnika );

CREATE TABLE stanowisko (
    id                 INTEGER NOT NULL,
    nazwa_stanowiska   VARCHAR2(32),
    placa              NUMBER(11, 2)
);

ALTER TABLE stanowisko ADD CONSTRAINT stanowisko_pk PRIMARY KEY ( id );

CREATE TABLE testy (
    id           INTEGER NOT NULL,
    data_testu   DATE NOT NULL,
    opis_testu   VARCHAR2(256) NOT NULL,
    pojazdy_id   INTEGER NOT NULL
);

ALTER TABLE testy ADD CONSTRAINT testy_pk PRIMARY KEY ( id );

CREATE TABLE uprawnienia (
    upr_pojazdy      NUMBER(1) NOT NULL,
    upr_warsztat     NUMBER(1) NOT NULL,
    upr_test         NUMBER(1) NOT NULL,
    upr_magazyn      NUMBER(1) NOT NULL,
    upr_ksiegowosc   NUMBER(1) NOT NULL,
    upr_zarzad       NUMBER(1) NOT NULL,
    upr_it           NUMBER(1) NOT NULL,
    stanowisko_id    INTEGER NOT NULL
);

ALTER TABLE uprawnienia ADD CONSTRAINT uprawnienia_pk PRIMARY KEY ( stanowisko_id );

CREATE TABLE wieza (
    id             INTEGER NOT NULL,
    model_wiezy    VARCHAR2(32) NOT NULL,
    producent_id   INTEGER NOT NULL
);

ALTER TABLE wieza ADD CONSTRAINT wieza_pk PRIMARY KEY ( id );

ALTER TABLE wieza ADD CONSTRAINT wieza__un UNIQUE ( model_wiezy );

CREATE TABLE zamowienie (
    id                INTEGER NOT NULL,
    opis_zamowienia   VARCHAR2(256) NOT NULL,
    klient_adres_id   INTEGER NOT NULL,
    przypis_id        INTEGER NOT NULL,
    kontrakt_id       INTEGER NOT NULL
);

ALTER TABLE zamowienie ADD CONSTRAINT zamowienia_pk PRIMARY KEY ( id );

CREATE TABLE zmiany (
    id            INTEGER NOT NULL,
    data_zmiany   DATE NOT NULL,
    opis_zmiany   VARCHAR2(128) NOT NULL,
    pojazdy_id    INTEGER NOT NULL
);

ALTER TABLE zmiany ADD CONSTRAINT zmiany_pk PRIMARY KEY ( id );

ALTER TABLE dzialo
    ADD CONSTRAINT dzialo_producent_fk FOREIGN KEY ( producent_id )
        REFERENCES producent ( id );

ALTER TABLE faktura
    ADD CONSTRAINT faktura_klient_fk FOREIGN KEY ( klient_adres_id )
        REFERENCES klient ( adres_id );

ALTER TABLE faktura
    ADD CONSTRAINT faktura_pracownik_fk FOREIGN KEY ( pracownik_id )
        REFERENCES pracownik ( id );

ALTER TABLE faktura
    ADD CONSTRAINT faktura_zamowienie_fk FOREIGN KEY ( zamowienie_id )
        REFERENCES zamowienie ( id );

ALTER TABLE kadlub
    ADD CONSTRAINT kadlub_producent_fk FOREIGN KEY ( producent_id )
        REFERENCES producent ( id );

ALTER TABLE klient
    ADD CONSTRAINT klient_adres_fk FOREIGN KEY ( adres_id )
        REFERENCES adres ( id );

ALTER TABLE konto
    ADD CONSTRAINT konto_pracownik_fk FOREIGN KEY ( pracownik_id )
        REFERENCES pracownik ( id );

ALTER TABLE konto
    ADD CONSTRAINT konto_uprawnienia_fk FOREIGN KEY ( uprawnienia_stanowisko_id )
        REFERENCES uprawnienia ( stanowisko_id );

ALTER TABLE pojazdy
    ADD CONSTRAINT pojazdy_dzialo_fk FOREIGN KEY ( dzialo_id )
        REFERENCES dzialo ( id );

ALTER TABLE pojazdy
    ADD CONSTRAINT pojazdy_kadlub_fk FOREIGN KEY ( kadlub_id )
        REFERENCES kadlub ( id );

ALTER TABLE pojazdy
    ADD CONSTRAINT pojazdy_przypis_fk FOREIGN KEY ( przypis_id )
        REFERENCES przypis ( id );

ALTER TABLE pojazdy
    ADD CONSTRAINT pojazdy_radio_fk FOREIGN KEY ( radio_id )
        REFERENCES radio ( id );

ALTER TABLE pojazdy
    ADD CONSTRAINT pojazdy_silnik_fk FOREIGN KEY ( silnik_id )
        REFERENCES silnik ( id );

ALTER TABLE pojazdy
    ADD CONSTRAINT pojazdy_wieza_fk FOREIGN KEY ( wieza_id )
        REFERENCES wieza ( id );

ALTER TABLE pracownik
    ADD CONSTRAINT pracownik_adres_fk FOREIGN KEY ( adres_id )
        REFERENCES adres ( id );

ALTER TABLE pracownik
    ADD CONSTRAINT pracownik_stanowisko_fk FOREIGN KEY ( stanowisko_id )
        REFERENCES stanowisko ( id );

ALTER TABLE radio
    ADD CONSTRAINT radio_producent_fk FOREIGN KEY ( producent_id )
        REFERENCES producent ( id );

ALTER TABLE silnik
    ADD CONSTRAINT silnik_producent_fk FOREIGN KEY ( producent_id )
        REFERENCES producent ( id );

ALTER TABLE testy
    ADD CONSTRAINT testy_pojazdy_fk FOREIGN KEY ( pojazdy_id )
        REFERENCES pojazdy ( id );

ALTER TABLE uprawnienia
    ADD CONSTRAINT uprawnienia_stanowisko_fk FOREIGN KEY ( stanowisko_id )
        REFERENCES stanowisko ( id );

ALTER TABLE wieza
    ADD CONSTRAINT wieza_producent_fk FOREIGN KEY ( producent_id )
        REFERENCES producent ( id );

ALTER TABLE zamowienie
    ADD CONSTRAINT zamowienie_klient_fk FOREIGN KEY ( klient_adres_id )
        REFERENCES klient ( adres_id );

ALTER TABLE zamowienie
    ADD CONSTRAINT zamowienie_kontrakt_fk FOREIGN KEY ( kontrakt_id )
        REFERENCES kontrakt ( id );

ALTER TABLE zamowienie
    ADD CONSTRAINT zamowienie_przypis_fk FOREIGN KEY ( przypis_id )
        REFERENCES przypis ( id );

ALTER TABLE zmiany
    ADD CONSTRAINT zmiany_pojazdy_fk FOREIGN KEY ( pojazdy_id )
        REFERENCES pojazdy ( id );





CREATE SEQUENCE producent_id_seq START WITH 1 NOCACHE ORDER;
CREATE OR REPLACE TRIGGER producent_id_trg BEFORE
    INSERT ON producent
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := producent_id_seq.nextval;
END;        
/

CREATE SEQUENCE kadlub_id_seq START WITH 1 NOCACHE ORDER;
CREATE OR REPLACE TRIGGER kadlub_id_trg BEFORE
    INSERT ON kadlub
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := kadlub_id_seq.nextval;
END;
/

CREATE SEQUENCE wieza_id_seq START WITH 1 NOCACHE ORDER;
CREATE OR REPLACE TRIGGER wieza_id_trg BEFORE
    INSERT ON wieza
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := wieza_id_seq.nextval;
END;
/

CREATE SEQUENCE dzialo_id_seq START WITH 1 NOCACHE ORDER;
CREATE OR REPLACE TRIGGER dzialo_id_trg BEFORE
    INSERT ON dzialo
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := dzialo_id_seq.nextval;
END;
/

CREATE SEQUENCE silnik_id_seq START WITH 1 NOCACHE ORDER;
CREATE OR REPLACE TRIGGER silnik_id_trg BEFORE
    INSERT ON silnik
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := silnik_id_seq.nextval;
END;
/

CREATE SEQUENCE radio_id_seq START WITH 1 NOCACHE ORDER;
CREATE OR REPLACE TRIGGER radio_id_trg BEFORE
    INSERT ON radio
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := radio_id_seq.nextval;
END;
/

CREATE SEQUENCE pojazdy_id_seq START WITH 1 NOCACHE ORDER;
CREATE OR REPLACE TRIGGER pojazdy_id_trg BEFORE
    INSERT ON pojazdy
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := pojazdy_id_seq.nextval;
END;
/

CREATE SEQUENCE zmiany_id_seq START WITH 1 NOCACHE ORDER;
CREATE OR REPLACE TRIGGER zmiany_id_trg BEFORE
    INSERT ON zmiany
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := zmiany_id_seq.nextval;
END;
/

CREATE SEQUENCE testy_id_seq START WITH 1 NOCACHE ORDER;
CREATE OR REPLACE TRIGGER testy_id_trg BEFORE
    INSERT ON testy
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := testy_id_seq.nextval;
END;
/

CREATE SEQUENCE przypis_id_seq START WITH 1 NOCACHE ORDER;
CREATE OR REPLACE TRIGGER przypis_id_trg BEFORE
    INSERT ON przypis
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := przypis_id_seq.nextval;
END;
/

CREATE SEQUENCE zamowienie_id_seq START WITH 1 NOCACHE ORDER;
CREATE OR REPLACE TRIGGER zamowienie_id_trg BEFORE
    INSERT ON zamowienie
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := zamowienie_id_seq.nextval;
END;
/

CREATE SEQUENCE kontrakt_id_seq START WITH 1 NOCACHE ORDER;
CREATE OR REPLACE TRIGGER kontrakt_id_trg BEFORE
    INSERT ON kontrakt
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := kontrakt_id_seq.nextval;
END;
/

CREATE SEQUENCE adres_id_seq START WITH 1 NOCACHE ORDER;
CREATE OR REPLACE TRIGGER adres_id_trg BEFORE
    INSERT ON adres
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := adres_id_seq.nextval;
END;
/

CREATE SEQUENCE pracownik_id_seq START WITH 1 NOCACHE ORDER;
CREATE OR REPLACE TRIGGER pracownik_id_trg BEFORE
    INSERT ON pracownik
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := pracownik_id_seq.nextval;
END;
/

CREATE SEQUENCE stanowisko_id_seq START WITH 1 NOCACHE ORDER;
CREATE OR REPLACE TRIGGER stanowisko_id_trg BEFORE
    INSERT ON stanowisko
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := stanowisko_id_seq.nextval;
END;
/

CREATE SEQUENCE faktura_id_seq START WITH 1 NOCACHE ORDER;
CREATE OR REPLACE TRIGGER faktura_id_trg BEFORE
    INSERT ON faktura
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := faktura_id_seq.nextval;
END;
/