-- drop table bok,laaner,forfatter,eksemplar,utlaan cascade;


-- enter the new db
\c trening;


DROP TABLE IF EXISTS ptime cascade;
DROP TABLE IF EXISTS gtime cascade;
DROP TABLE IF EXISTS bestilling cascade;
DROP TABLE IF EXISTS kunde cascade;
DROP TABLE IF EXISTS ptrener cascade;
DROP TABLE IF EXISTS users cascade;

CREATE TABLE ptime (
  ptimeid serial primary key,
  tittel text not null,
  dato date,
  klokkeslett time
);

CREATE TABLE bestilling (
  bestillingid serial primary key
);

CREATE TABLE gtime (
    gtimeid serial primary key,
    tittel text not null,
    dato date,
    klokkeslett time,
    bestillingid int references bestilling (bestillingid)
);

CREATE TABLE kunde (
  kundeid serial primary key,
  fornavn text not null,
  etternavn text not null,
  adresse text,
  epost text,
  tlf text not null,
  fdato date,
  kjonn text check (
    kjonn = 'm'
    or kjonn = 'f'),
  tilgang text not null,
  ptimeid int references ptime (ptimeid),
  gtimeid int references gtime (gtimeid)
);

CREATE TABLE ptrener (
  ptrenerid serial primary key,
  fornavn text not null,
  etternavn text not null,
  fdato date,
  kjonn text check (
    kjonn = 'm'
    or kjonn = 'f'
  ),
  kundeid int references kunde (kundeid)
);

create table users (
    userid SERIAL PRIMARY KEY,
    username text unique not null,
    role text default 'user',
    password text not null
); 

alter table ptime owner to trening;
alter table gtime owner to trening;
alter table bestilling owner to trening;
alter table kunde owner to trening;
alter table ptrener owner to trening;
alter table users owner to trening;