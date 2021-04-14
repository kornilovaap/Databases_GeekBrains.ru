В папкe [lessons](https://github.com/kornilovaap/Databases_GeekBrains.ru/tree/master/lesson_2/lessons) немного про типы данных в скуле.
    
Папка [shop](https://github.com/kornilovaap/Databases_GeekBrains.ru/tree/master/lesson_2/shop) - создание БД магазина, основная работа будет ТУТ.

Папка [tasks](https://github.com/kornilovaap/Databases_GeekBrains.ru/tree/master/lesson_2/tasks) - немного запросов по таблица shop.
___________________________
### Домашнее задание     
    
#### [1](https://github.com/kornilovaap/Databases_GeekBrains.ru/blob/master/lesson_2/tasks/1.sql)    
Пусть в таблице catalogs базы данных shop в строке name могут находиться пустые строки и поля принимающие значение NULL.       
Напишите запрос, который заменяет все такие поля на строку ‘empty’.        
Помните, что на уроке мы установили уникальность на поле name.      
Возможно ли оставить это условие? Почему?     
     
#### [2](https://github.com/kornilovaap/Databases_GeekBrains.ru/blob/master/lesson_2/tasks/2.sql)            
Спроектируйте базу данных, которая позволяла бы организовать хранение медиа-файлов, загружаемых пользователем (фото, аудио, видео).       
Сами файлы будут храниться в файловой системе, а база данных будет хранить только     
пути к файлам, названия, описания, ключевых слов и принадлежности пользователю!     
        
#### [3](https://github.com/kornilovaap/Databases_GeekBrains.ru/blob/master/lesson_2/tasks/3.sql)        
В учебной базе данных shop присутствует таблица catalogs. 
Пусть в базе данных sample имеется таблица cat, в которой могут присутствовать строки с такими же первичными ключами. 
Напишите запрос, который копирует данные из таблицы catalogs в таблицу cat, 
при этом для записей с конфликтующими первичными ключами в таблице cat должна производиться замена значениями из таблицы catalogs.   
:fire: on duplicate key update      
           
