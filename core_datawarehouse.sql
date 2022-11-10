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
