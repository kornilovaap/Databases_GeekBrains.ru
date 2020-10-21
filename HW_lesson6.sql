/*Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.*/
-- нашли всех друзей случайного пользователя id=1
	SELECT * FROM vk.friend_requests
	where status=1 and (from_user_id=1 or to_user_id=1);
-- находим всех, кто писал сообщения пользователю id=1 и смотрим количесвто этих сообщений
	SELECT from_user_id, count(*) FROM messages
	where to_user_id=1
	group by from_user_id;
-- находим среди всех сообщений сообщения от друзей
	НЕ ПОНИМАЮ, КАК ЭТО ДОДЕЛАТЬ


--Попробовала вот такой вариант, но...
SELECT f.status, m.from_user_id, m.to_user_id, m.text 
FROM friend_requests f inner join  messages m
on f.to_user_id=m.from_user_id -- ...не понимаю, что с чем тут связывать, но вывдит всё равно верно
where 
    (f.from_user_id=1  or f.to_user_id=1)
    and f.status=1 
    and (m.to_user_id=1 or m.from_user_id=1);





/*Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.*/
-- 10 самых молодых пользователей
	select user_id from profiles
	order by birthday desc
	limit 10;
-- сделали из запроса выше подзапрос
	select count(user_id) from likes 
	where user_id in (select * from (select user_id from profiles order by birthday desc limit 10));

					 
/*Определить кто больше поставил лайков (всего) - мужчины или женщины?*/
	select if(  
		(select count(user_id) from likes
		where user_id in (
			select user_id from profiles where gender='m'))
		>
		(select count(user_id) from likes
		where user_id in (
			select user_id from profiles where gender='f')),
		'больше мужчины','больше женщины');

	 
/*Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.*/
-- кто меньше всех писал
	select id, count(*) as count from messages
	group by from_user_id
	order by count
	limit 10;
-- кто меньше всех выкладывал медиа
	select user_id, count(*) as count from media
	group by user_id
	order by count
	limit 10;
