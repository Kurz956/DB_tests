--не менее 4 исполнителей,
--не менее 3 жанров,
--не менее 3 альбомов,
--не менее 6 треков,
--не менее 4 сборников.

insert into artist(nickname) 
values('Elvis'), ('Metallica'), ('Randy Travis'), ('50cent'), ('Ozzy Ozborne');

insert into genre(genre_name)
values('Rock-n-Roll'), ('Metall'), ('Country'), ('Rap');

insert into album(album_name, year, artist_id)
values('Metallica_album_1', 1980, (select artist_id from artist where nickname = 'Metallica')), 
('Metallica_album_2', 1984, (select artist_id from artist where nickname = 'Metallica')), 
('Randy_Travis_album_1', 2019, (select artist_id from artist where nickname = 'Randy Travis')), 
('50cent_album_1', 2020, (select artist_id from artist where nickname = '50cent')), 
('Ozzy_1', 2018, (select artist_id from artist where nickname = 'Ozzy Ozborne'));

insert into track(name, duration, album_id)
values('my Metall', 1, (select album_id from album where album_name = 'Metallica_album_1')), 
('myMetall_vol.2', 2, (select album_id from album where album_name = 'Metallica_album_1')),
('metallica_21', 5, (select album_id from album where album_name = 'Metallica_album_2')),
('metallica_22', 1, (select album_id from album where album_name = 'Metallica_album_2')),
('metallica_23', 25, (select album_id from album where album_name = 'Metallica_album_2')),
('metallica_24', 4, (select album_id from album where album_name = 'Metallica_album_2')),
('metallica_25', 2, (select album_id from album where album_name = 'Metallica_album_2')),
('Randy_5', 5, (select album_id from album where album_name = 'Randy_Travis_album_1')),
('Randy_2', 2, (select album_id from album where album_name = 'Randy_Travis_album_1')),
('Randy_3', 3, (select album_id from album where album_name = 'Randy_Travis_album_1')),
('50_1', 1, (select album_id from album where album_name = '50cent_album_1')),
('50_5', 5, (select album_id from album where album_name = '50cent_album_1')),
('50_8', 8, (select album_id from album where album_name = '50cent_album_1')),
('My Crazy Train', 5, (select album_id from album where album_name = 'Ozzy_1')),
('мой Crazy Train', 6, (select album_id from album where album_name = 'Ozzy_1')),
('Crazy', 3, (select album_id from album where album_name = 'Ozzy_1')),
('Elvis', 2, (select album_id from album where album_name = 'Elvis'));

insert into collection(name, year_of_release)
values('Metallica + Ozzy', 2020), ('50 + Randy', 2018), ('50 + Randy + Ozzy', 2005);

insert into albumartist 
values((select album_id from album where album_name = 'Metallica_album_1'), (select artist_id from artist where nickname = 'Metallica')),
((select album_id from album where album_name = 'Metallica_album_2'), (select artist_id from artist where nickname = 'Metallica')),
((select album_id from album where album_name = 'Randy_Travis_album_1'), (select artist_id from artist where nickname = 'Randy Travis')),
((select album_id from album where album_name = '50cent_album_1'), (select artist_id from artist where nickname = '50cent')),
((select album_id from album where album_name = 'Ozzy_1'), (select artist_id from artist where nickname = 'Ozzy Ozborne'));

insert into genreartist 
values((select genre_id from genre where genre_name = 'Rock-n-Roll'), (select artist_id from artist where nickname = 'Elvis')),
((select genre_id from genre where genre_name = 'Metall'), (select artist_id from artist where nickname = 'Metallica')),
((select genre_id from genre where genre_name = 'Metall'), (select artist_id from artist where nickname = 'Ozzy Ozborne')),
((select genre_id from genre where genre_name = 'Country'), (select artist_id from artist where nickname = 'Randy Travis')),
((select genre_id from genre where genre_name = 'Rap'), (select artist_id from artist where nickname = '50cent'));

insert into crosscollection 
values(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1),
(8, 2), (9, 2), (10, 2), (11, 2), (12, 2), (13, 2),
(8, 3), (9, 3), (10, 3), (11, 3), (12, 3), (13, 3), (14, 3), (15, 3), (16, 3);

