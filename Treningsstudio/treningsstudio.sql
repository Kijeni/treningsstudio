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

CREATE TABLE kunde(
  kundeid serial primary key,
  fornavn text not null,
  etternavn text not null,
  adresse text,
  epost text,
  tlf text not null,
  fdato date,
  kjonn text check (
    kjonn = 'm'
    or kjonn = 'f'
  ),
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



