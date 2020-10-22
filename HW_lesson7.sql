/*Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.*/
  select u.id, u.name, o.created_at
  from users u
  inner join orders o
  on u.id=o.user_id


/*Выведите список товаров products и разделов catalogs, который соответствует товару.*/
  select p.name, p.price, p.catalog_id, c.name
  from products p
  inner join catalogs c 
  on p.catalog_id=c.id


/*Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское. 
Выведите список рейсов flights с русскими названиями городов*/
  select 
    `id` as `id_FLIGHT`,
      (select `name` from cities where label=flights.`from`) as `FROM`,
      (select `name` from cities where label=flights.`to`) as `TO`
  from 
    flights;

