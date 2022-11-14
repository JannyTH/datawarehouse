CREATE TABLE Kredit (
  kreditID SERIAL PRIMARY KEY, 
  zinsen float,
  kreditvolumen float,
  abschlusskosten float,
  geforderte_garantie float,
  personalkosten float,
  anfangstermin DATE,
  endtermin DATE,
  kundenID INT,
  kreditartID INT,
  gueltig_ab TIMESTAMP,
  gueltig_bis TIMESTAMP
);

CREATE TABLE Kreditart (
  kreditID INT NOT NULL,
  kreditart VARCHAR(50),
  gueltig_ab TIMESTAMP,
  gueltig_bis TIMESTAMP
);

CREATE TABLE Kunde (
  kundenID SERIAL PRIMARY KEY,
  vorname VARCHAR(50),
  nachname VARCHAR(50),
  geburtstag DATE,
  nettoeinkommen_monat float,
  adressID INT,
  berufID INT,
  kundentypID INT,
  gueltig_ab TIMESTAMP,
  gueltig_bis TIMESTAMP
);

CREATE TABLE Beruf (
  BerufID SERIAL PRIMARY KEY,
  berufname varchar(50),
  gueltig_ab TIMESTAMP,
  gueltig_bis TIMESTAMP
);

CREATE TABLE Mitarbeiter (
  MitarbeiterID SERIAL PRIMARY KEY,
  Vorname VARCHAR NOT NULL,
  Nachname VARCHAR NOT NULL,
  AdressID INT NOT NULL,
  KreditID INT NOT NULL,
  Alter INT,
  Gehalt float,
  Beruf VARCHAR(50),
  Gueltig_ab TIMESTAMP,
  Gueltig_bis TIMESTAMP
);

CREATE TABLE Adresse (
  AdressID SERIAL PRIMARY KEY,
  Hausnummer INT,
  Straße VARCHAR (50),
  Stadt VARCHAR (50),
  PLZ INT,
  Land VARCHAR (50),
  gueltig_ab TIMESTAMP,
  gueltig_bis TIMESTAMP
);

CREATE TABLE Partnerarten (
partnerartenID SERIAL PRIMARY KEY,
partnerart VARCHAR(50),
vpartnerID INT,
gueltig_ab TIMESTAMP,
gueltig_bis TIMESTAMP
);


CREATE TABLE Vertriebspartner (
vpartnerID SERIAL PRIMARY KEY,
firmenname VARCHAR(50),
partnerartenID INT,
pvertragID INT,
kreditID INT,
telefonnummer INT,
gueltig_ab TIMESTAMP,
gueltig_bis TIMESTAMP
);

CREATE TABLE Kreditverantwortlicher (
    KreditID INTEGER NOT NULL PRIMARY KEY REFERENCES Kredit(KreditID),
    MitarbeiterID INTEGER NOT NULL PRIMARY KEY REFERENCES Mitarbeiter(MitarbeiterID),
    VertriebspartnerID PRIMARY KEY INTEGER REFERENCES Vertriebspartner(VPartnerID),
);

CREATE TABLE Persons (
    RückzahlungsID SERIAL NOT NULL PRIMARY KEY,
      KreditID INTEGER NOT NULL REFERENCES Kredit(KreditID),
    Tilgungsanteil FLOAT NOT NULL,
    Zisnanteil FLOAT NOT NULL,
    Datum DATE
      Gueltig_ab TIMESTAMP NOT NULL,
      Gueltig_bis TIMESTAMP NOT NULL,
);

CREATE TABLE buergt (
    ID SERIAL NOT NULL PRIMARY KEY,
    KundenID INTEGER NOT NULL PRIMARY KEY REFERENCES Kunde(KundenID),
      BuergenID INTEGER NOT NULL PRIMARY KEY REFERENCES Buergen(BuergenID)
);

CREATE TABLE Kundentyp (
	kundentypID INT NOT NULL SERIAL PRIMARY KEY,
	gueltig_ab TIMESTAMP NOT NULL,
	gueltig_bis TIMESTAMP NOT NULL
);

CREATE TABLE Buergen (
	buergenID INT NOT NULL SERIAL PRIMARY KEY,
	adressID INT NOT NULL FOREIGN KEY,
	vorname VARCHAR NOT NULL,
	nachname VARCHAR NOT NULL,
	gueltig_ab TIMESTAMP NOT NULL,
	gueltig_bis TIMESTAMP NOT NULL
);

CREATE TABLE Provisionsvertrag (
	pvertragID INT NOT NULL SERIAL PRIMARY KEY,
	kreditID INT NOT NULL FOREIGN KEY,
	hoehe FLOAT NOT NULL,
	gueltig_ab TIMESTAMP NOT NULL,
	gueltig_bis TIMESTAMP NOT NULL
);
