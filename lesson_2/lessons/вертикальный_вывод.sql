/*используем вертикальный режим вывода \G 
Это команда клиента mysql, а не часть sql-запроса*/

mysql> select * from mysql.user limit 1\G
*************************** 1. row ***************************
                    Host: localhost
                    User: mysql.infoschema
             Select_priv: Y
             Insert_priv: N
             Update_priv: N
             Delete_priv: N
             Create_priv: N
             ...
                  
