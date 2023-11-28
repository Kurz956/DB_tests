--Название и продолжительность самого длительного трека.
--Название треков, продолжительность которых не менее 3,5 минут.
--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
--Исполнители, чьё имя состоит из одного слова.
--Название треков, которые содержат слово «мой» или «my».
select name, duration  from track 
where duration = (select max(duration) from track);

select name from track 
where duration > 3.5;

select name from collection 
where year_of_release between 2018 and 2020;

select nickname from artist 
where nickname not like '% %';

select name from track
where string_to_array(name, ' ') && ARRAY['my', 'мой'];

--Количество исполнителей в каждом жанре.
--Количество треков, вошедших в альбомы 2019–2020 годов.
--Средняя продолжительность треков по каждому альбому.
--Все исполнители, которые не выпустили альбомы в 2020 году.
--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).

select g2.genre_name, count(a.nickname) from artist a
join genreartist g on a.artist_id = g.artist_id 
join genre g2 on g.genre_id = g2.genre_id 
group by g2.genre_name

select count(track_id) from track t 
join album a on t.album_id = a.album_id 
where a."year" between 2019 and 2020;

select album_name, avg(t.duration) from album a 
join track t on t.album_id = a.album_id 
group by a.album_name;

select distinct c.name from collection c 
join crosscollection c2 on c.id = c2.collection_id 
join track t on c2.track_id = t.track_id 
join album a on t.album_id = a.album_id 
join artist a2 on a.artist_id = a2.artist_id 
where a2.nickname like '%Ozzy%';