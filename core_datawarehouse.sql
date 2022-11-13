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
