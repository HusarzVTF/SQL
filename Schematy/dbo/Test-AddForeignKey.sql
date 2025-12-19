USE Stacja_Paliw

GO

/*
Co moze byc nie tak?

- 1. walidacja parametrow
- 2. niestniejace obiekty : schema, tabele, kolumny
- 3. FK  check : 
		FK o tej nazwie juz istnieje wersja na tych tabelach i w ogole w bazie, 
		FK o innej nazwie, ale miedzy kolumnami na ktorych juz jest FK, 
		niegozdne typy danych pod FK
		Za dluga nazwa proponwoanego FK, 
		'' jako proponowana nazwa  FK
		nie podana nazwa FK, ale skladowe suma > 128 znakow -> nie przejzie, bo nie ma takich obiektow  w bazie i zlapie na zmyslonych z punkt 2

- 4. utworzenie poprawnego FK
	nazwa podana
	nazwa domyslna



*/



--1. walidacja parametrow procki--

EXEC dbo.AddForeignKey null,null,null,null,null,null,1 --checked

EXEC dbo.AddForeignKey '','','','','','',1 --checked

EXEC dbo.AddForeignKey '','','','','',null,1 --checked

EXEC dbo.AddForeignKey null,'',null,'','',null,1 --checked

EXEC dbo.AddForeignKey 
'Typ_Platnosciwnowvnvwvwvonvowvnwvwuvnrwnvwuonrwvnwvuw[vwrvnwuvnwovwvwnvunwuvwvnrvowvnwvownvwnvnvanuvsnvpnsdop  jsd jdas[v svsd s s u',
'Typ_Platnosciwnowvnvwvwvonvowvnwvwuvnrwnvwuonrwvnwvuw[vwrvnwuvnwovwvwnvunwuvwvnrvowvnwvownvwnvnvanuvsnvpnsdop  jsd jdas[v svsd s s u',
'Typ_Platnosciwnowvnvwvwvonvowvnwvwuvnrwnvwuonrwvnwvuw[vwrvnwuvnwovwvwnvunwuvwvnrvowvnwvownvwnvnvanuvsnvpnsdop  jsd jdas[v svsd s s u',
'Typ_Platnosciwnowvnvwvwvonvowvnwvwuvnrwnvwuonrwvnwvuw[vwrvnwuvnwovwvwnvunwuvwvnrvowvnwvownvwnvnvanuvsnvpnsdop  jsd jdas[v svsd s s u',
'Typ_Platnosciwnowvnvwvwvonvowvnwvwuvnrwnvwuonrwvnwvuw[vwrvnwuvnwovwvwnvunwuvwvnrvowvnwvownvwnvnvanuvsnvpnsdop  jsd jdas[v svsd s s u',
'Typ_Platnosciwnowvnvwvwvonvowvnwvwuvnrwnvwuonrwvnwvuw[vwrvnwuvnwovwvwnvunwuvwvnrvowvnwvownvwnvnvanuvsnvpnsdop  jsd jdas[v svsd s s u',1 --checked

EXEC dbo.AddForeignKey 'Ope','Sprzedaz',null,'Ope','Typ_Platnosci','Typ_Platnosci',1 --checked

EXEC dbo.AddForeignKey 'Ope','Sprzedaz','','Ope','Typ_Platnosci','Typ_Platnosci',1 --checked

EXEC dbo.AddForeignKey 'Ope','Sprzedaz','','Ope','Typ_Platnosci',null,1 --checked

--poni¿sze stestowane  checked
EXEC dbo.AddForeignKey 'Ope','Sprzedaz','TypPlatnosci','Ope','Typ_Platnosci',
'Typ_Platnosciwnowvnvwvwvonvowvnwvwuvnrwnvwuonrwvnwvuw[vwrvnwuvnwovwvwnvunwuvwvnrvowvnwvownvwnvnvanuvsnvpnsdop  jsd jdas[v svsd s s u',1

EXEC dbo.AddForeignKey '','Sprzedaz','TypPlatnosci','Ope','Typ_Platnosci',
'Typ_Platnosciwnowvnvwvwvonvowvnwvwuvnrwnvwuonrwvnwvuw[vwrvnwuvnwovwvwnvunwuvwvnrvowvnwvownvwnvnvanuvsnvpnsdop  jsd jdas[v svsd s s u',1

EXEC dbo.AddForeignKey '',null,'TypPlatnosci','Ope','Typ_Platnosci',
'Typ_Platnosciwnowvnvwvwvonvowvnwvwuvnrwnvwuonrwvnwvuw[vwrvnwuvnwovwvwnvunwuvwvnrvowvnwvownvwnvnvanuvsnvpnsdop  jsd jdas[v svsd s s u',1

EXEC dbo.AddForeignKey 'Typ_Platnosciwnowvnvwvwvonvowvnwvwuvnrwnvwuonrwvnwvuw[vwrvnwuvnwovwvwnvunwuvwvnrvowvnwvownvwnvnvanuvsnvpnsdop  jsd jdas[v svsd s s u',
null,'Typ_Platnosciwnowvnvwvwvonvowvnwvwuvnrwnvwuonrwvnwvuw[vwrvnwuvnwovwvwnvunwuvwvnrvowvnwvownvwnvnvanuvsnvpnsdop  jsd jdas[v svsd s s u',
'Typ_Platnosciwnowvnvwvwvonvowvnwvwuvnrwnvwuonrwvnwvuw[vwrvnwuvnwovwvwnvunwuvwvnrvowvnwvownvwnvnvanuvsnvpnsdop  jsd jdas[v svsd s s u',
'Typ_Platnosciwnowvnvwvwvonvowvnwvwuvnrwnvwuonrwvnwvuw[vwrvnwuvnwovwvwnvunwuvwvnrvowvnwvownvwnvnvanuvsnvpnsdop  jsd jdas[v svsd s s u',
'Typ_Platnosciwnowvnvwvwvonvowvnwvwuvnrwnvwuonrwvnwvuw[vwrvnwuvnwovwvwnvunwuvwvnrvowvnwvownvwnvnvanuvsnvpnsdop  jsd jdas[v svsd s s u',1

EXEC dbo.AddForeignKey 'Typ_Platnosciwnowvnvwvwvonvowvnwvwuvnrwnvwuonrwvnwvuw[vwrvnwuvnwovwvwnvunwuvwvnrvowvnwvownvwnvnvanuvsnvpnsdop  jsd jdas[v svsd s s u',
'Typ_Platnosciwnowvnvwvwvonvowvnwvwuvnrwnvwuonrwvnwvuw[vwrvnwuvnwovwvwnvunwuvwvnrvowvnwvownvwnvnvanuvsnvpnsdop  jsd jdas[v svsd s s u',
'','Typ_Platnosciwnowvnvwvwvonvowvnwvwuvnrwnvwuonrwvnwvuw[vwrvnwuvnwovwvwnvunwuvwvnrvowvnwvownvwnvnvanuvsnvpnsdop  jsd jdas[v svsd s s u',
'Typ_Platnosciwnowvnvwvwvonvowvnwvwuvnrwnvwuonrwvnwvuw[vwrvnwuvnwovwvwnvunwuvwvnrvowvnwvownvwnvnvanuvsnvpnsdop  jsd jdas[v svsd s s u',
'Typ_Platnosciwnowvnvwvwvonvowvnwvwuvnrwnvwuonrwvnwvuw[vwrvnwuvnwovwvwnvunwuvwvnrvowvnwvownvwnvnvanuvsnvpnsdop  jsd jdas[v svsd s s u',1




--2.niestniejace obiekty

--niestniejca tabela Typ_Platnosci jako Ref Table--

EXEC dbo.AddForeignKey 'Ope','Sprzedaz','TypPlatnosci','Ope','Typ_Platnosci','Typ_Platnosci',1 -- checked

--niestniejca tabela Typ_Platnosci jako Parent Table--

EXEC dbo.AddForeignKey 'Ope','Typ_Platnosci','Typ_Platnosci','Ope','Sprzedaz','TypPlatnosci',1 -- checked


--obie tabele zmyslone

EXEC dbo.AddForeignKey 'Ope','Typ_Platnosci','ID','Ope','Traktor','TypPlatnosci',1 --checked



--zmyslona parentKolumna

EXEC dbo.AddForeignKey 'Ope','Sprzedaz','ID_Dattw','Ope','Pracownicy','ID_datyZatr','FK_Sprac',1 --checked


--zmyslona Refkolumna

EXEC dbo.AddForeignKey 'Ope','Sprzedaz','ID_Dat','Ope','Pracownicy','ID_datyZatr1','FK_Sprac',1 --checked

--zmyslona ref i parent kolumny

EXEC dbo.AddForeignKey 'Ope','Sprzedaz','ID_Datr','Ope','Pracownicy','ID_datyZatr1','FK_Sprac',1 --checked

--zmyslona Schema oba

EXEC dbo.AddForeignKey 'DFR','Sprzedaz','ID_Dat','drw','Pracownicy','ID_datyZatr','FK_DatSprz*',1 --checked


--zmyslona Schema parent

EXEC dbo.AddForeignKey 'DFR','Sprzedaz','ID_Dat','Ope','Pracownicy','ID_datyZatr','FK_DatSprz*',1 --checked

--zmyslona Schema ref

EXEC dbo.AddForeignKey 'Ope','Sprzedaz','ID_Dat','ryt','Pracownicy','ID_datyZatr','FK_DatSprz*',1 --checked

--zmyslony schema i table

EXEC dbo.AddForeignKey 'Tre','Typ_Platnosci','Typ_Platnosci','Ope','Sprzedaz','TypPlatnosci',1 --checked



--3. FK check

--juz istnieje FK miedzy tabelami na tych kolumnach.--  Sprawdzone dziala ok

EXEC dbo.AddForeignKey 'Ope','Sprzedaz','ID_Dat','Czas','Kalendarz','ID',1 --checked



--istniejace tabele FK o nazwie jaka istnieje miedzy Sprzedaz a Kalendarz

EXEC dbo.AddForeignKey 'Ope','Sprzedaz','ID_Dat','Ope','Pracownicy','ID_datyZatr','FK_DatSprz',1 --checked



--istniejace tabele FK o nazwie jaka istnieje w bazie , ale na innych kolumnach

EXEC dbo.AddForeignKey 'Ope','Lista_Obecnosci','Data','Ope','Pracownicy','data_Zatrudnienia','FK_DatSprz',1 --checked




--niezgodne typy danych na kolumnach pod FK

EXEC dbo.AddForeignKey 'Ope','Sprzedaz','ID_Dat','Ope','Pracownicy','Imie','FK_Sprac',1 --checked

-- FK z proponowana nazwa > 128 znakow
EXEC dbo.AddForeignKey 'Ope','Sprzedaz','ID_Dat','Ope','Pracownicy','ID_datyZatr',
'Typ_Platnosciwnowvnvwvwvonvowvnwvwuvnrwnvwuonrwvnwvuw[vwrvnwuvnwovwvwnvunwuvwvnrvowvnwvownvwnvnvanuvsnvpnsdop  jsd jdas[v svsd s s u',1 --checked

--FK z proponowana nazwa ''
EXEC dbo.AddForeignKey 'Ope','Sprzedaz','ID_Dat','Ope','Pracownicy','ID_datyZatr','',1 --checked

--4. poprawne FOreign key mozliwe do nadania--

--z proponowana nazwa

EXEC dbo.AddForeignKey 'Ope','Sprzedaz','ID_Dat','Ope','Pracownicy','ID_datyZatr','FK_Sprzedaz_DataZatr',1 --checked

--nazwa domyslna

EXEC dbo.AddForeignKey 'Ope','Sprzedaz','ID_Dat','Ope','Pracownicy','ID_datyZatr',null,1 --checked


