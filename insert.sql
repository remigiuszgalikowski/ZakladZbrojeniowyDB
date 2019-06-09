INSERT INTO przypis(id) VALUES (1);
INSERT INTO przypis(id) VALUES (2);
INSERT INTO przypis(id) VALUES (3);
INSERT INTO przypis(id) VALUES (4);
INSERT INTO przypis(id) VALUES (5);
/
INSERT INTO adres(miasto, kod, ulica, numer) VALUES ('Warszawa','00-911','Aleja Niepodleg³oœci',218);
INSERT INTO adres(miasto, kod, ulica, numer) VALUES ('Gdansk','80-020','Dmowskiego',22);
INSERT INTO adres(miasto, kod, ulica, numer) VALUES ('Gdansk','80-020','Kolobrzeska',33);
INSERT INTO adres(miasto, kod, ulica, numer) VALUES ('Gdynia','80-299','Portowa',11);
INSERT INTO adres(miasto, kod, ulica, numer) VALUES ('Gdynia','80-299','Slaska',15);
INSERT INTO adres(miasto, kod, ulica, numer) VALUES ('Gdansk','80-020','Nad Stawem',9);
INSERT INTO adres(miasto, kod, ulica, numer) VALUES ('Gdynia','80-299','Swietojansaka',13);
INSERT INTO adres(miasto, kod, ulica, numer) VALUES ('Czersk','89-650','Starogardzka',32);
INSERT INTO adres(miasto, kod, ulica, numer) VALUES ('Gdynia','80-299','Pilsudskiego',22);
INSERT INTO adres(miasto, kod, ulica, numer) VALUES ('Czersk','89-650','Derdowskiego',25);
INSERT INTO adres(miasto, kod, ulica, numer) VALUES ('Gdansk','80-020','Olsztynska',21);
INSERT INTO adres(miasto, kod, ulica, numer) VALUES ('Czersk','89-650','Sportowa',41);
INSERT INTO adres(miasto, kod, ulica, numer) VALUES ('Gdansk','80-020','Kolobrzeska',3);
/
INSERT INTO stanowisko(id, nazwa_stanowiska, placa) VALUES (1, 'administrator', 12000.00);
INSERT INTO stanowisko(id, nazwa_stanowiska, placa) VALUES (2, 'prezes', 20000.00);
INSERT INTO stanowisko(id, nazwa_stanowiska, placa) VALUES (3, 'czlonek zarzadu', 16000.00);
INSERT INTO stanowisko(id, nazwa_stanowiska, placa) VALUES (4, 'ksiegowy', 10000.00);
INSERT INTO stanowisko(id, nazwa_stanowiska, placa) VALUES (5, 'pracownik warsztatu', 7000.00);
INSERT INTO stanowisko(id, nazwa_stanowiska, placa) VALUES (6, 'kierownik warsztatu', 8000.00);
INSERT INTO stanowisko(id, nazwa_stanowiska, placa) VALUES (7, 'pracownik walidacji', 7000.00);
INSERT INTO stanowisko(id, nazwa_stanowiska, placa) VALUES (8, 'kierownik walidacji', 8000.00);
INSERT INTO stanowisko(id, nazwa_stanowiska, placa) VALUES (9, 'pracownik magazynu', 7000.00);
INSERT INTO stanowisko(id, nazwa_stanowiska, placa) VALUES (10, 'kierownik magazynu', 8000.00);
/
INSERT INTO uprawnienia(upr_pojazdy, upr_warsztat, upr_test, upr_magazyn, upr_ksiegowosc, upr_zarzad, upr_it, stanowisko_id) VALUES (3,3,3,3,3,3,3,1);
INSERT INTO uprawnienia(upr_pojazdy, upr_warsztat, upr_test, upr_magazyn, upr_ksiegowosc, upr_zarzad, upr_it, stanowisko_id) VALUES (1,1,1,1,1,2,1,2);
INSERT INTO uprawnienia(upr_pojazdy, upr_warsztat, upr_test, upr_magazyn, upr_ksiegowosc, upr_zarzad, upr_it, stanowisko_id) VALUES (1,1,1,1,1,1,1,3);
INSERT INTO uprawnienia(upr_pojazdy, upr_warsztat, upr_test, upr_magazyn, upr_ksiegowosc, upr_zarzad, upr_it, stanowisko_id) VALUES (0,0,0,0,2,0,0,4);
INSERT INTO uprawnienia(upr_pojazdy, upr_warsztat, upr_test, upr_magazyn, upr_ksiegowosc, upr_zarzad, upr_it, stanowisko_id) VALUES (1,2,0,0,0,0,0,5);
INSERT INTO uprawnienia(upr_pojazdy, upr_warsztat, upr_test, upr_magazyn, upr_ksiegowosc, upr_zarzad, upr_it, stanowisko_id) VALUES (2,2,1,0,0,0,0,6);
INSERT INTO uprawnienia(upr_pojazdy, upr_warsztat, upr_test, upr_magazyn, upr_ksiegowosc, upr_zarzad, upr_it, stanowisko_id) VALUES (1,0,2,0,0,0,0,7);
INSERT INTO uprawnienia(upr_pojazdy, upr_warsztat, upr_test, upr_magazyn, upr_ksiegowosc, upr_zarzad, upr_it, stanowisko_id) VALUES (2,1,2,0,0,0,0,8);
INSERT INTO uprawnienia(upr_pojazdy, upr_warsztat, upr_test, upr_magazyn, upr_ksiegowosc, upr_zarzad, upr_it, stanowisko_id) VALUES (1,0,0,2,0,0,0,9);
INSERT INTO uprawnienia(upr_pojazdy, upr_warsztat, upr_test, upr_magazyn, upr_ksiegowosc, upr_zarzad, upr_it, stanowisko_id) VALUES (2,1,0,2,0,0,0,10);
/
INSERT INTO pracownik(imie, nazwisko, adres_id, stanowisko_id) VALUES ('Augustyn','Brodka', 2, 1);
INSERT INTO pracownik(imie, nazwisko, adres_id, stanowisko_id) VALUES ('Adolf','Konopijski', 3, 3);
INSERT INTO pracownik(imie, nazwisko, adres_id, stanowisko_id) VALUES ('Leopold','Muszniok', 4, 2);
INSERT INTO pracownik(imie, nazwisko, adres_id, stanowisko_id) VALUES ('Kleofas','Pejk', 5, 7);
INSERT INTO pracownik(imie, nazwisko, adres_id, stanowisko_id) VALUES ('Marcin','Patkiewicz', 6, 8);
INSERT INTO pracownik(imie, nazwisko, adres_id, stanowisko_id) VALUES ('Irena','Patkiewicz', 6, 4);
INSERT INTO pracownik(imie, nazwisko, adres_id, stanowisko_id) VALUES ('Anna','Prus', 7, 7);
INSERT INTO pracownik(imie, nazwisko, adres_id, stanowisko_id) VALUES ('Andrzej','Nowak', 8, 10);
INSERT INTO pracownik(imie, nazwisko, adres_id, stanowisko_id) VALUES ('Joachim','Kowal', 9, 5);
INSERT INTO pracownik(imie, nazwisko, adres_id, stanowisko_id) VALUES ('Artur','Majek', 10, 5);
INSERT INTO pracownik(imie, nazwisko, adres_id, stanowisko_id) VALUES ('Kacper','Walinski', 11, 5);
INSERT INTO pracownik(imie, nazwisko, adres_id, stanowisko_id) VALUES ('Jan','Majek', 10, 6);
INSERT INTO pracownik(imie, nazwisko, adres_id, stanowisko_id) VALUES ('Michal','Zerginski', 12, 9);
/
INSERT INTO konto(login, haslo, pracownik_id, uprawnienia_stanowisko_id) VALUES ('Aug98', 'LubieBananowySok200', 1, 1);
INSERT INTO konto(login, haslo, pracownik_id, uprawnienia_stanowisko_id) VALUES ('Adiss', 'AdidN0thingWr0ng', 2, 3);
INSERT INTO konto(login, haslo, pracownik_id, uprawnienia_stanowisko_id) VALUES ('Leolol', 'L0Lol0LoL0l', 3, 2);
INSERT INTO konto(login, haslo, pracownik_id, uprawnienia_stanowisko_id) VALUES ('Klejof39', '1939Frvr', 4, 7);
INSERT INTO konto(login, haslo, pracownik_id, uprawnienia_stanowisko_id) VALUES ('Marc92', 'AjaK0ch0mM0j0mMume5', 5, 8);
INSERT INTO konto(login, haslo, pracownik_id, uprawnienia_stanowisko_id) VALUES ('Irifirijaj', 'KrawatyMoj3goTaty', 6, 4);
INSERT INTO konto(login, haslo, pracownik_id, uprawnienia_stanowisko_id) VALUES ('AnaMana', 'Rosomaki2000', 7, 7);
INSERT INTO konto(login, haslo, pracownik_id, uprawnienia_stanowisko_id) VALUES ('PanAnt', 'Mrowka123Krowka', 8, 10);
INSERT INTO konto(login, haslo, pracownik_id, uprawnienia_stanowisko_id) VALUES ('JoaJa', 'qwerty123', 9, 5);
INSERT INTO konto(login, haslo, pracownik_id, uprawnienia_stanowisko_id) VALUES ('Arti55', 'ArrrIPiratee33', 10, 5);
INSERT INTO konto(login, haslo, pracownik_id, uprawnienia_stanowisko_id) VALUES ('KacpiWal', '12skiwalinperKac21', 11, 5);
INSERT INTO konto(login, haslo, pracownik_id, uprawnienia_stanowisko_id) VALUES ('JaJan', 'JaJeJaJ0', 12, 6);
INSERT INTO konto(login, haslo, pracownik_id, uprawnienia_stanowisko_id) VALUES ('Michu2', 'K3rr1gan', 13, 9);
/
INSERT INTO klient(nazwa_firmy, adres_id) VALUES ('MON RP', 1);
/
INSERT INTO kontrakt(sciezka_pliku_kontrakt) VALUES ('K:\Kontrakty\2014\ZAx2-5');
INSERT INTO kontrakt(sciezka_pliku_kontrakt) VALUES ('K:\Kontrakty\2018\ZAx9-3');
INSERT INTO kontrakt(sciezka_pliku_kontrakt) VALUES ('K:\Kontrakty\2019\ZAx1-7');
/
INSERT INTO zamowienie(klient_adres_id, kontrakt_id, przypis_id, opis_zamowienia) VALUES (1, 1, 1, 'Diagnostyka, serwis i naprawy.');
INSERT INTO zamowienie(klient_adres_id, kontrakt_id, przypis_id, opis_zamowienia) VALUES (1, 1, 2, 'Diagnostyka, serwis i naprawy.');
INSERT INTO zamowienie(klient_adres_id, kontrakt_id, przypis_id, opis_zamowienia) VALUES (1, 2, 3, 'Wymiana wiez na ZSSW-30 i dzia³ na Mk44S.');
INSERT INTO zamowienie(klient_adres_id, kontrakt_id, przypis_id, opis_zamowienia) VALUES (1, 3, 4, 'Diagnostyka, serwis i naprawy.');
/
INSERT INTO faktura(data_wystawienia, data_transakcji, pracownik_id, klient_adres_id, sciezka_pliku_faktura, zamowienie_id) VALUES (to_date('15/05/2015','DD/MM/YYYY'), to_date('19/05/2015','DD/MM/YYYY'), 6, 1, 'F:\Faktury\2015\FaZ2-5-n1', 1);
INSERT INTO faktura(data_wystawienia, data_transakcji, pracownik_id, klient_adres_id, sciezka_pliku_faktura, zamowienie_id) VALUES (to_date('10/06/2017','DD/MM/YYYY'), to_date('20/06/2017','DD/MM/YYYY'), 6, 1, 'F:\Faktury\2017\FaZ2-5-n2', 1);
INSERT INTO faktura(data_wystawienia, data_transakcji, pracownik_id, klient_adres_id, sciezka_pliku_faktura, zamowienie_id) VALUES (to_date('19/06/2018','DD/MM/YYYY'), to_date('25/06/2018','DD/MM/YYYY'), 6, 1, 'F:\Faktury\2014\FaZ9-3-n1', 2);
INSERT INTO faktura(data_wystawienia, data_transakcji, pracownik_id, klient_adres_id, sciezka_pliku_faktura, zamowienie_id) VALUES (to_date('11/08/2020','DD/MM/YYYY'), to_date('18/08/2020','DD/MM/YYYY'), 6, 1, 'F:\Faktury\2014\ZAx1-7-n1', 3);
/
INSERT INTO producent(nazwa_producenta) VALUES ('Alliant Techsystems Inc.');
INSERT INTO producent(nazwa_producenta) VALUES ('Huta Stalowa Wola');
INSERT INTO producent(nazwa_producenta) VALUES ('Oto Melara');
INSERT INTO producent(nazwa_producenta) VALUES ('Rosomak SA');
INSERT INTO producent(nazwa_producenta) VALUES ('Scania AB');
INSERT INTO producent(nazwa_producenta) VALUES ('MTU Friedrichshafen GmbH');
INSERT INTO producent(nazwa_producenta) VALUES ('Bumar-Labedy');
INSERT INTO producent(nazwa_producenta) VALUES ('Wojskowe Zaklady Lacznosci');
/
INSERT INTO kadlub(model_kadluba, producent_id) VALUES ('KTO M', 4);
INSERT INTO kadlub(model_kadluba, producent_id) VALUES ('KTO XP', 4);
INSERT INTO kadlub(model_kadluba, producent_id) VALUES ('BORSUK', 2);
/
INSERT INTO wieza(model_wiezy, producent_id) VALUES ('Hitfist-30P', 7);
INSERT INTO wieza(model_wiezy, producent_id) VALUES ('Wieza Rak', 2);
INSERT INTO wieza(model_wiezy, producent_id) VALUES ('ZSSW-30', 2);
/
INSERT INTO dzialo(model_dziala, kaliber_dziala, producent_id) VALUES ('Mk44 Bushmaster II', 30, 1);
INSERT INTO dzialo(model_dziala, kaliber_dziala, producent_id) VALUES ('M120 Rak', 120, 2);
INSERT INTO dzialo(model_dziala, kaliber_dziala, producent_id) VALUES ('Mk44S Bushmaster II', 30, 1);
/
INSERT INTO silnik(model_silnika, uklad_silnika, hp_silnika, producent_id) VALUES ('Scania D1 12 56A03PE', 'V6', 490, 5);
INSERT INTO silnik(model_silnika, uklad_silnika, hp_silnika, producent_id) VALUES ('6V199TE20', 'V6', 352, 6);
/
INSERT INTO radio(model_radia, zasieg_radia, producent_id) VALUES ('RF-5200', 80, 8);
/
INSERT INTO pojazdy(przypis_id, kadlub_id, wieza_id, dzialo_id, silnik_id, radio_id) VALUES (1, 1, 1, 1, 1, 1);
INSERT INTO pojazdy(przypis_id, kadlub_id, wieza_id, dzialo_id, silnik_id, radio_id) VALUES (1, 1, 1, 1, 1, 1);
INSERT INTO pojazdy(przypis_id, kadlub_id, wieza_id, dzialo_id, silnik_id, radio_id) VALUES (1, 2, 1, 1, 1, 1);
INSERT INTO pojazdy(przypis_id, kadlub_id, wieza_id, dzialo_id, silnik_id, radio_id) VALUES (1, 1, 2, 2, 1, 1);
INSERT INTO pojazdy(przypis_id, kadlub_id, wieza_id, dzialo_id, silnik_id, radio_id) VALUES (1, 1, 2, 2, 1, 1);
INSERT INTO pojazdy(przypis_id, kadlub_id, wieza_id, dzialo_id, silnik_id, radio_id) VALUES (2, 1, 1, 1, 1, 1);
INSERT INTO pojazdy(przypis_id, kadlub_id, wieza_id, dzialo_id, silnik_id, radio_id) VALUES (2, 2, 1, 1, 1, 1);
INSERT INTO pojazdy(przypis_id, kadlub_id, wieza_id, dzialo_id, silnik_id, radio_id) VALUES (2, 2, 1, 3, 1, 1);
INSERT INTO pojazdy(przypis_id, kadlub_id, wieza_id, dzialo_id, silnik_id, radio_id) VALUES (2, 1, 2, 2, 1, 1);
INSERT INTO pojazdy(przypis_id, kadlub_id, wieza_id, dzialo_id, silnik_id, radio_id) VALUES (2, 2, 2, 2, 1, 1);
INSERT INTO pojazdy(przypis_id, kadlub_id, wieza_id, dzialo_id, silnik_id, radio_id) VALUES (2, 2, 2, 2, 1, 1);
INSERT INTO pojazdy(przypis_id, kadlub_id, wieza_id, dzialo_id, silnik_id, radio_id) VALUES (3, 2, 3, 3, 1, 1);
INSERT INTO pojazdy(przypis_id, kadlub_id, wieza_id, dzialo_id, silnik_id, radio_id) VALUES (3, 2, 3, 3, 1, 1);
INSERT INTO pojazdy(przypis_id, kadlub_id, wieza_id, dzialo_id, silnik_id, radio_id) VALUES (4, 3, 3, 3, 2, 1);
INSERT INTO pojazdy(przypis_id, kadlub_id, wieza_id, dzialo_id, silnik_id, radio_id) VALUES (4, 3, 3, 3, 2, 1);
/
INSERT INTO zmiany(data_zmiany, opis_zmiany, pojazdy_id) VALUES (to_date('11/05/2015','DD/MM/YYYY'), 'Naprawa silnika.', 1);
INSERT INTO zmiany(data_zmiany, opis_zmiany, pojazdy_id) VALUES (to_date('11/05/2015','DD/MM/YYYY'), 'Naprawa silnika.', 2);
INSERT INTO zmiany(data_zmiany, opis_zmiany, pojazdy_id) VALUES (to_date('12/05/2015','DD/MM/YYYY'), 'Naprawa silnika i wymiana radia na nowe tego samego modelu.', 3);
INSERT INTO zmiany(data_zmiany, opis_zmiany, pojazdy_id) VALUES (to_date('13/05/2015','DD/MM/YYYY'), 'Wymiana silnika na nowy tego samego modelu.', 4);
INSERT INTO zmiany(data_zmiany, opis_zmiany, pojazdy_id) VALUES (to_date('14/05/2015','DD/MM/YYYY'), 'Wymiana silnika na nowy tego samego modelu.', 5);
INSERT INTO zmiany(data_zmiany, opis_zmiany, pojazdy_id) VALUES (to_date('22/05/2017','DD/MM/YYYY'), 'Serwis dziala.', 6);
INSERT INTO zmiany(data_zmiany, opis_zmiany, pojazdy_id) VALUES (to_date('23/05/2017','DD/MM/YYYY'), 'Serwis dziala.', 7);
INSERT INTO zmiany(data_zmiany, opis_zmiany, pojazdy_id) VALUES (to_date('23/05/2017','DD/MM/YYYY'), 'Wymiana dziala z Mk44 Bushmaster II na Mk44S Bushmaster II.', 8);
INSERT INTO zmiany(data_zmiany, opis_zmiany, pojazdy_id) VALUES (to_date('01/06/2017','DD/MM/YYYY'), 'Wymiana silnika na nowy tego samego modelu.', 9);
INSERT INTO zmiany(data_zmiany, opis_zmiany, pojazdy_id) VALUES (to_date('02/06/2017','DD/MM/YYYY'), 'Powazny remont silnika', 10);
INSERT INTO zmiany(data_zmiany, opis_zmiany, pojazdy_id) VALUES (to_date('04/06/2017','DD/MM/YYYY'), 'Wymiana silnika na nowy tego samego modelu.', 11);
INSERT INTO zmiany(data_zmiany, opis_zmiany, pojazdy_id) VALUES (to_date('14/06/2018','DD/MM/YYYY'), 'Wymiana wiezy z Hitfist-30P na ZSSW-30. Wymiana dziala z Mk44 Bushmaster II na Mk44S Bushmaster II.', 12);
INSERT INTO zmiany(data_zmiany, opis_zmiany, pojazdy_id) VALUES (to_date('14/06/2018','DD/MM/YYYY'), 'Wymiana wiezy z Hitfist-30P na ZSSW-30. Wymiana dziala z Mk44 Bushmaster II na Mk44S Bushmaster II.', 13);
INSERT INTO zmiany(data_zmiany, opis_zmiany, pojazdy_id) VALUES (to_date('29/07/2020','DD/MM/YYYY'), 'Przeglad serwisowy.', 14);
INSERT INTO zmiany(data_zmiany, opis_zmiany, pojazdy_id) VALUES (to_date('30/07/2020','DD/MM/YYYY'), 'Przeglad serwisowy i naprawa silnika.', 15);
/
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('07/05/2015','DD/MM/YYYY'), 'Jazda testowa i testy ogólne. Wykryto problemy z silnikiem.', 1);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('07/05/2015','DD/MM/YYYY'), 'Jazda testowa i testy ogólne. Wykryto problemy z silnikiem.', 2);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('07/05/2015','DD/MM/YYYY'), 'Jazda testowa i testy ogólne. Wykryto powazne problemy z silnikiem oraz radiem..', 3);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('08/05/2015','DD/MM/YYYY'), 'Jazda testowa i testy ogólne. Wykryto powazne problemy z silnikiem.', 4);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('08/05/2015','DD/MM/YYYY'), 'Jazda testowa i testy ogólne. Wykryto powazne problemy z silnikiem.', 5);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('15/05/2015','DD/MM/YYYY'), 'Jazda testowa i testy silnika. Wyniki pomyslne.', 1);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('15/05/2015','DD/MM/YYYY'), 'Jazda testowa i testy silnika. Wyniki pomyslne.', 2);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('15/05/2015','DD/MM/YYYY'), 'Jazda testowa i testy silnika. Wyniki pomyslne.', 4);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('15/05/2015','DD/MM/YYYY'), 'Jazda testowa i testy silnika. Wyniki pomyslne.', 5);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('16/05/2015','DD/MM/YYYY'), 'Jazda testowa i testy silnika oraz radia. Wyniki pomyslne.', 3);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('20/05/2017','DD/MM/YYYY'), 'Jazda testowa i testy ogólne. Wykryto problemy z dzialem.', 6);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('20/05/2017','DD/MM/YYYY'), 'Jazda testowa i testy ogólne. Wykryto problemy z dzialem.', 7);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('20/05/2017','DD/MM/YYYY'), 'Jazda testowa i testy ogólne. Wykryto powazne problemy z dzialem.', 8);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('25/05/2017','DD/MM/YYYY'), 'Testy dzia³a. Wyniki pomyslne.', 6);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('25/05/2017','DD/MM/YYYY'), 'Testy dzia³a. Wyniki pomyslne.', 7);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('25/05/2017','DD/MM/YYYY'), 'Testy dzia³a. Wyniki pomyslne.', 8);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('29/05/2017','DD/MM/YYYY'), 'Jazda testowa i testy ogólne. Wykryto powazne problemy z silnikiem.', 9);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('30/05/2017','DD/MM/YYYY'), 'Jazda testowa i testy ogólne. Wykryto powazne problemy z silnikiem.', 10);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('01/06/2017','DD/MM/YYYY'), 'Jazda testowa i testy ogólne. Wykryto powazne problemy z silnikiem.', 11);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('05/06/2017','DD/MM/YYYY'), 'Jazda testowa i testy silnika. Wyniki pomyslne.', 9);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('05/06/2017','DD/MM/YYYY'), 'Jazda testowa i testy silnika. Wyniki pomyslne.', 10);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('05/06/2017','DD/MM/YYYY'), 'Jazda testowa i testy silnika. Wyniki pomyslne.', 11);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('12/06/2018','DD/MM/YYYY'), 'Jazda testowa i testy ogólne.', 12);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('12/06/2018','DD/MM/YYYY'), 'Jazda testowa i testy ogólne.', 13);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('15/06/2018','DD/MM/YYYY'), 'Jazda testowa i testy wiezy oraz dziala. Testy z wynikiem pomyslnym.', 12);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('16/06/2018','DD/MM/YYYY'), 'Jazda testowa i testy wiezy oraz dziala. Testy z wynikiem pomyslnym.', 13);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('28/07/2020','DD/MM/YYYY'), 'Jazda testowa i testy ogólne. Wykryto problemy z silnikiem.', 15);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('28/07/2020','DD/MM/YYYY'), 'Jazda testowa i testy ogólne. Brak wykrytych problemow.', 14);
INSERT INTO testy(data_testu, opis_testu, pojazdy_id) VALUES (to_date('02/08/2020','DD/MM/YYYY'), 'Jazda testowa i testy silnika. Wyniki pomyslne.', 15);
/