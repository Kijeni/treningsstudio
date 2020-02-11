-- drop table bok,laaner,forfatter,eksemplar,utlaan cascade;

create role trening password '123';
alter role trening with login;
create database trening owner trening;
-- enter the new db
\c trening;


DROP TABLE IF EXISTS ptime cascade;
DROP TABLE IF EXISTS gtime cascade;
DROP TABLE IF EXISTS bestilling cascade;
DROP TABLE IF EXISTS kunde cascade;
DROP TABLE IF EXISTS ptrener cascade;
DROP TABLE IF EXISTS users cascade;
DROP TABLE IF EXISTS kundetime cascade;




create table users (
    userid SERIAL PRIMARY KEY,
    username text unique not null,
    role text default 'user',
    password text not null
); 

CREATE TABLE ptime (
  ptimeid serial primary key,
  tittel text not null,
  dato date,
  klokkeslett time
);

CREATE TABLE gtime (
    gtimeid serial primary key,
    tittel text not null,
    dato date,
    klokkeslett time
);

CREATE TABLE bestilling (
  bestillingid serial primary key,
  dato date,
  klokkeslett time,
  navn text,
  gtimeid int references gtime (gtimeid)
);

CREATE TABLE kunde (
  kundeid serial primary key,
  userid int,
  fornavn text not null,
  etternavn text not null,
  adresse text,
  epost text,
  tlf text not null,
  fdato date,
  kjonn text check (
    kjonn = 'm'
    or kjonn = 'f'),
  tilgang text not null
);


CREATE TABLE ptrener (
  ptrenerid serial primary key,
  fornavn text not null,
  etternavn text not null,
  fdato date,
  kjonn text check (
    kjonn = 'm'
    or kjonn = 'f'
  )
);

CREATE TABLE kundetime (
  kundetimeid serial primary key,
  kundeid int references kunde (kundeid),
  ptimeid int references ptime (ptimeid),
  ptrenerid int references ptrener (ptrenerid),
  bestillingid int references bestilling (bestillingid)
);

alter table ptime owner to trening;
alter table gtime owner to trening;
alter table bestilling owner to trening;
alter table kunde owner to trening;
alter table ptrener owner to trening;
alter table users owner to trening;
alter table kundetime owner to trening;
