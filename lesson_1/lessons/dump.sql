/*Создаём дамп БД в файл*/
C:\Users\Im>mysqldump mysql > mysql.sql

/*Проверяем, что файл с дампом создался*/
C:\Users\Im>dir
 Том в устройстве C имеет метку Windows
 Серийный номер тома: 

 Содержимое папки C:\Users\Im

13.04.2021  13:25                15 hello.sql
13.04.2021  13:32         1 165 072 mysql.sql

/*Выполняем дамп, направляем содржимое фал в бд*/
C:\Users\Im>mysql mysql < hello.sql
hello
hello
    
