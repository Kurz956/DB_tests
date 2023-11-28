-------------- Music
create table if not exists Genre (
	genre_id SERIAL primary key,
	genre_name VARCHAR(30) unique not null
);

create table if not exists Artist (
	artist_id SERIAL primary key,
	nickname VARCHAR(30) not null,
	genre_id INTEGER
);

create table if not exists GenreArtist (
	genre_id INTEGER not null references Genre(genre_id),
	artist_id INTEGER not null references Artist(artist_id),
	CONSTRAINT pk primary key(genre_id, artist_id)
	
);

create table if not exists Album (
	album_id SERIAL primary key,
	album_name VARCHAR(60) not null,
	artist_id INTEGER not null references Artist(artist_id),
	year DECIMAL(4,0) not null
);

create table if not exists AlbumArtist (
	album_artist_id SERIAL primary key,
	album_id INTEGER not null references Album(album_id),
	artist_id INTEGER not null references Artist(artist_id)
);

create table if not exists Track (
	track_id SERIAL primary key,
	album_id INTEGER not null references Album(album_id),
	duration INTEGER not null
);

alter table Track add column name VARCHAR(60) not null;

create table if not exists Collection (
	id SERIAL primary key,
	name VARCHAR(60) not null,
	year_of_release DECIMAL(4,0) not null
);

drop table if exists CrossCollection;

create table if not exists CrossCollection (
	track_id INTEGER not null references Track(track_id), 
	album_id INTEGER not null references Collection(id),
	constraint pkey primary key(track_id, album_id)
);
alter table crosscollection rename album_id to collection_id;

-----------
insert into Genre(genre_name)
values('Rock-n-Roll');

insert into genre(genre_name)
values('Heavy_Metall');

insert into genre(genre_name)
values('Rap');

insert into genre(genre_name)
values('Country');
------------
insert into artist
values(1, 'Elvis P.', 1);
insert into artist
values(2, 'Ozzy Ozborne', 2);
insert into artist
values(3, 'Metallica', 2);
insert into artist
values(4, 'Eminem', 3)
------------

insert into album 
values(1, 'Blizzard of Ozz', 2, 1980);
insert into album 
values(2, 'Ride the Lightning', 3, 1984);
insert into album 
values(3, 'Master of Puppets', 3, 1986);
------------
insert into track
values(1, 1, 5, 'I Dont Know');
insert into track
values(2, 1, 4, 'Crazy Train');
insert into track
values(3, 1, 6, 'Goodbye to Romance');
insert into track
values(4, 1, 1, 'Dee');

insert into track
values(5, 2, 4, 'Fight Fire with Fire');
insert into track
values(6, 2, 6, 'Ride the Lightning');
insert into track
values(7, 2, 5, 'For Whom the Bell Tolls');

insert into track
values(8, 3, 5, 'Battery');
insert into track
values(9, 3, 8, 'Master of Puppets');
insert into track
values(10, 3, 8, 'Orion');
------------
insert into Collection
values(1, 'Metallica Collection', 2020);
insert into Collection
values(2, 'Metallica 1 + Ozzy *', 2020);
insert into Collection
values(3, 'Metallica * + Ozzy 1', 2020);
------------

insert into crosscollection 
values(5, 1);
insert into crosscollection 
values(6, 1);
insert into crosscollection 
values(7, 1);
insert into crosscollection 
values(8, 1);
insert into crosscollection 
values(9, 1);
insert into crosscollection 
values(10, 1);

insert into crosscollection 
values(5, 2);
insert into crosscollection 
values(1, 2);
insert into crosscollection 
values(2, 2);
insert into crosscollection 
values(3, 2);
insert into crosscollection 
values(4, 2);

insert into crosscollection 
values(5, 3);
insert into crosscollection 
values(6, 3);
insert into crosscollection 
values(7, 3);
insert into crosscollection 
values(8, 3);
insert into crosscollection 
values(9, 3);
insert into crosscollection 
values(10, 3);
insert into crosscollection 
values(1, 3);

------------- самые длинные треки
select name, duration from track
order by duration desc
limit 1;

select max(duration), name from track t 
group by name, duration 
order by duration desc
limit 1;
------------- треки продолжительностью больше 3.5
select name from track
where duration > 3.5;
------------- Названия сборников, вышедших в период с 2018 по 2020 год включительно
update collection 
set year_of_release = 2018
where id = 1;

update collection 
set year_of_release = 2000
where id = 3;

select name from collection c 
where year_of_release between 2018 and 2020;
------------- Исполнители, чьё имя состоит из одного слова
select nickname from artist a 
where nickname not like '% %';
------------- Название треков, которые содержат слово «мой» или «my»
update track 
set name = 'my Butterfly'
where track_id = 8;

update track 
set name = 'мой Crazy Train'
where track_id = 2;

select name from track t 
where name similar to '(%my%|%мой%)';
------------- Количество исполнителей в каждом жанре.
insert into artist
values(5, 'Randy Travis', 4);


insert into genreartist 
values(1, 1);
insert into genreartist 
values(2, 2);
insert into genreartist 
values(2, 3);
insert into genreartist 
values(3, 4);
insert into genreartist 
values(4, 5);

select g.genre_name, count(artist_id) from artist a
join genre g  on g.genre_id  = a.genre_id  
group by g.genre_name 
------------- Количество треков, вошедших в альбомы 2019–2020 годов.
insert into album  
values(4, 'R.Travis', 5, 2019);
insert into album 
values(5, 'Music to Be', 4, 2020);
insert into track 
values(11, 5, 2, 'Premonition');
insert into track 
values(12, 5, 3, 'Unaccommodating');
insert into track 
values(13, 5, 4, 'Leaving Heaven');
insert into track 
values(14, 4, 1, 'One');
insert into track 
values(15, 4, 2, 'Two');
insert into track 
values(16, 4, 3, 'my Three');

select count(track_id) from track t3
join album a on a.album_id = t3.album_id 
where a.year between 2019 and 2020;
------------- Средняя продолжительность треков по каждому альбому.
select a.album_name, avg(duration) from track t 
join album a on a.album_id = t.album_id
group by a.album_name;
------------- Все исполнители, которые не выпустили альбомы в 2020 году.
insert into album  
values(6, 'R.Travis future', 5, 2023);
insert into track 
values(17, 6, 0.5, 'Fast forward');
insert into track 
values(18, 6, 5, 'Never come back');
insert into track 
values(19, 6, 12, 'Only through');

insert into album  
values(7, 'R.Travis 2020', 5, 2020);
insert into track 
values(20, 6, 2020, '2020');

update track 
set album_id = 7
where track_id = 20;

select distinct nickname from artist a ----------- дописать? спросить? узнать? тк Рэнди Трэвис выпустил 2020
full outer join album a2 on a2.artist_id = a.artist_id
where "year" != 2020
group by a.nickname;
-------------Названия сборников, в которых присутствует конкретный исполнитель Ozzy
select distinct c.name from collection c
join crosscollection c2 on c.id = c2.collection_id 
join track t on c2.track_id = t.track_id 
join album a on t.album_id = a.album_id 
join artist a2 on a.artist_id = a2.artist_id 
where a2.nickname like '%Ozzy%'








