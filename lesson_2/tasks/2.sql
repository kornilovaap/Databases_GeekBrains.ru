/*Спроектируйте базу данных, которая позволяла бы организовать хранение медиа-файлов, загружаемых пользователем (фото, аудио, видео). 
Сами файлы будут храниться в файловой системе, а база данных будет хранить только пути к файлам, названия, описания, ключевых слов и принадлежности пользователю*/
drop database if exists file_storage;
CREATE database files;
use files;

drop table if exists medias;
create table medias (
	id serial primary key,
    `path` varchar(256) not null,
    file_type varchar(128) not null,
    title varchar(128) not null,
    author varchar(128) not null,
    `description` text,
    style varchar(128),
    owner_user_id int 
);

describe medias;
+---------------+-----------------+------+-----+---------+----------------+
| Field         | Type            | Null | Key | Default | Extra          |
+---------------+-----------------+------+-----+---------+----------------+
| id            | bigint unsigned | NO   | PRI | NULL    | auto_increment |
| path          | varchar(256)    | NO   |     | NULL    |                |
| file_type     | varchar(128)    | NO   |     | NULL    |                |
| title         | varchar(128)    | NO   |     | NULL    |                |
| author        | varchar(128)    | NO   |     | NULL    |                |
| description   | text            | YES  |     | NULL    |                |
| style         | varchar(128)    | YES  |     | NULL    |                |
| owner_user_id | int             | YES  |     | NULL    |                |
+---------------+-----------------+------+-----+---------+----------------+

insert into medias values
	(null, 
    'Библиотеки\\Музыка\\music.mp3',
    'audio',
    'Yellow sun',
    'KatyKate',
    'La-la-la',
    'pop',
    1),
    (null, 
    'Библиотеки\\Видео\\video.mp4',
    'video',
    'Run run run',
    'Roma',
    'You can do it',
    'video',
    1),
    (null, 
    'Библиотеки\\Изображения\\picture.jpeg',
    'picture',
    'Sea',
    'Iam',
    'blue',
    'color',
    1);
    
select * from medias;
+----+-------------------------------------+-----------+-------------+----------+---------------+-------+---------------+
| id | path                                | file_type | title       | author   | description   | style | owner_user_id |
+----+-------------------------------------+-----------+-------------+----------+---------------+-------+---------------+
|  1 | Библиотеки\Музыка\music.mp3         | audio     | Yellow sun  | KatyKate | La-la-la      | pop   |             1 |
|  2 | Библиотеки\Видео\video.mp4          | video     | Run run run | Roma     | You can do it | video |             1 |
|  3 | Библиотеки\Изображения\picture.jpeg | picture   | Sea         | Iam      | blue          | color |             1 |
+----+-------------------------------------+-----------+-------------+----------+---------------+-------+---------------+
      
