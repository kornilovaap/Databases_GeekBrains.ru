DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  desription TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  -- KEY index_of_catalog_id (catalog_id)
) COMMENT = 'Товарные позиции';
CREATE INDEX index_of_catalog_id ON products (catalog_id); -- Создать индекс в уже существующей таблице 

describe products;
+------------+-----------------+------+-----+-------------------+-----------------------------------------------+
| Field      | Type            | Null | Key | Default           | Extra                                         |
+------------+-----------------+------+-----+-------------------+-----------------------------------------------+
| id         | bigint unsigned | NO   | PRI | NULL              | auto_increment                                |
| name       | varchar(255)    | YES  |     | NULL              |                                               |
| desription | text            | YES  |     | NULL              |                                               |
| price      | decimal(11,2)   | YES  |     | NULL              |                                               |
| catalog_id | int unsigned    | YES  | MUL | NULL              |                                               |
| created_at | datetime        | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updated_at | datetime        | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+------------+-----------------+------+-----+-------------------+-----------------------------------------------+
    
DROP INDEX index_of_catalog_id ON products;
   
