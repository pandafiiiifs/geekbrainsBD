-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');

DROP TABLE IF EXISTS rubrics;
CREATE TABLE rubrics (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела'
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO rubrics VALUES
  (NULL, 'Видеокарты'),
  (NULL, 'Память');

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  desription TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)
) COMMENT = 'Товарные позиции';

INSERT INTO products
  (name, desription, price, catalog_id)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1),
  ('AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  user_id int unsigned DEFAULT NULL,
  catalog_id int(10) unsigned DEFAULT NULL,
  created_at datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY id (id),
  KEY index_of_user_id (user_id)
) COMMENT = 'Заказы';

 RENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Состав заказа';

DROP TABLE IF EXISTS orders_products;



CREATE TABLE orders_products (
  order_id bigint(20) unsigned NOT NULL,
  product_id bigint(20) unsigned NOT NULL,
  total int(10) unsigned DEFAULT '1' COMMENT 'Количество заказов',
  created_at datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (order_id,product_id),
  KEY fk_order_product_id (product_id),
  CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT fk_order_product_id FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE RESTRICT ON UPDATE RESTRICT
) COMMENT = 'Состав заказа';


DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
  id SERIAL PRIMARY KEY,
  user_id INT UNSIGNED,
  product_id INT UNSIGNED,
  discount FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0 до 1.0',
  started_at DATETIME,
  finished_at DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id),
  KEY index_of_product_id(product_id)
) COMMENT = 'Скидки';

DROP TABLE IF EXISTS storehouses;
CREATE TABLE storehouses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Склады';

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';



ALTER TABLE	orders 
 CHANGE COLUMN user_id user_id BIGINT(20) UNSIGNED NOT NULL;


ALTER TABLE orders
 ADD CONSTRAINT fk_user_id
	FOREIGN KEY (user_id)
	REFERENCES users(id)
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;

ALTER TABLE
	orders 
CHANGE COLUMN
catalog_id catalog_id BIGINT(20) UNSIGNED NOT NULL;

ALTER TABLE orders
 ADD CONSTRAINT fk_catalog_id
 	FOREIGN KEY (catalog_id)
 	REFERENCES catalogs(id)
 	ON DELETE RESTRICT
 	ON UPDATE RESTRICT;
 
 
 UPDATE orders
SET created_at = NOW() 	WHERE created_at is NULL;
UPDATE orders
	SET updated_at = NOW() 	WHERE created_at is NULL;
 ALTER TABLE
 	orders_products 
 CHANGE COLUMN 	order_id order_id BIGINT(20) UNSIGNED NOT NULL;
ALTER TABLE
 	orders_products  CHANGE COLUMN	product_id product_id BIGINT(20) UNSIGNED NOT NULL;
 ALTER TABLE
	orders_products
ADD CONSTRAINT fk_order_id
	FOREIGN KEY(order_id) 	REFERENCES orders(id) ON DELETE RESTRICT  	ON UPDATE RESTRICT;
ALTER TABLE
 	orders_products
 ADD CONSTRAINT fk_order_product_id
	FOREIGN KEY(product_id)
	REFERENCES products(id)
	ON DELETE RESTRICT 
	ON UPDATE RESTRICT;


 ALTER TABLE orders_products DROP id;
ALTER TABLE orders_products 
DROP PRIMARY KEY, ADD PRIMARY KEY(order_id, product_id);

INSERT INTO orders(catalog_id)
VALUES (156);
 SELECT * FROM orders;
 INSERT INTO
	orders(user_id)
 VALUES
 	(1),
 	(2),
 	(3),
	(6), 
	(9);
INSERT INTO
 	orders_products(order_id, product_id)
 VALUES
	(1, 1),
 	(1, 2);
 INSERT INTO
	orders_products(order_id, product_id)
 VALUES
	(2, 1),
 	(2, 2);
 
 INSERT INTO
 	orders_products(order_id, product_id, total)
VALUES
 	(4, 1, 1),
	(4, 4, 3),
	(4, 5, 2);
 

-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
SELECT * FROM catalogs;
SELECT id, name FROM users;
SELECT u.id AS user_id, u.name, o.id AS order_id FROM users AS u RIGHT JOIN orders AS o ON u.id = o.user_id;

-- Выведите список товаров products и разделов catalogs, который соответствует товару.
SELECT 
	p.id, p.name, p.price,
	c.id AS cat_id,
	c.name AS catalog
FROM
	products AS p
JOIN
	catalogs AS c
ON 
	p.catalog_id = c.id;



-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское.
-- Выведите список рейсов flights с русскими названиями городов.



CREATE TABLE IF NOT EXISTS flights(
id SERIAL PRIMARY KEY,
 	otkuda VARCHAR(50) NOT NULL, 
	kuda VARCHAR(50) NOT NULL 
);

 CREATE TABLE  IF NOT EXISTS cities(
	label VARCHAR(50) PRIMARY KEY , 
 	name VARCHAR(50)
 );

 ALTER TABLE flights
 ADD CONSTRAINT fk_otkuda_label
 FOREIGN KEY(otkuda)
 REFERENCES cities(label);

 ALTER TABLE flights
 ADD CONSTRAINT fk_kuda_label
 FOREIGN KEY(kuda)
 REFERENCES cities(label);

 INSERT INTO cities VALUES
 	('Moscow', 'Москва'),
 	('Saint Petersburg', 'Санкт-Петербург'),
	('Omsk', 'Омск'),
 	('Tomsk', 'Томск'),
 	('Ufa', 'Уфа');

 INSERT INTO flights VALUES
 	(NULL, 'Moscow', 'Saint Petersburg'),
 	(NULL, 'Saint Petersburg', 'Omsk'),
 	(NULL, 'Omsk', 'Tomsk'),
 	(NULL, 'Tomsk', 'Ufa'),
 	(NULL, 'Ufa', 'Moscow');

-- *****  Решение ex 03  ***** --
SELECT
	id AS flight_id,
	(SELECT name FROM cities WHERE label = otkuda) AS otkuda,
	(SELECT name FROM cities WHERE label = kuda) AS kuda
FROM
	flights
ORDER BY
	flight_id;

