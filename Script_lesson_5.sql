---Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.


CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

SELECT * FROM users;
UPDATE users SET created_at = NOW();
UPDATE users SET updated_at = NOW();


#Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них 
#долгое время помещались значения в формате 20.10.2017 8:10. 
#Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.

CREATE TABLE users_3 (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(255),
  updated_at VARCHAR(255)
) COMMENT = 'Покупатели';

SELECT * FROM users_3;

ALTER TABLE users_3 ADD created_at_dt DATETIME;
ALTER TABLE users_3 ADD updated_at_dt DATETIME;
UPDATE users_3
SET created_at_dt = STR_TO_DATE(created_at, '%d.%m.%Y %h:%i'),
    updated_at_dt = STR_TO_DATE(updated_at, '%d.%m.%Y %h:%i');
ALTER TABLE users_3 
    DROP created_at,
    RENAME COLUMN created_at_dt TO created_at;
   ALTER TABLE users_3
   DROP updated_at,
   RENAME COLUMN updated_at_dt TO updated_at;
  
 DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';


SELECT * FROM storehouses_products
  ORDER BY CASE WHEN value = 0 THEN 2147483647 ELSE value END;

  
  


#Практическое задание теме «Агрегация данных»
#Подсчитайте средний возраст пользователей в таблице users.
#Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.
SELECT * FROM users;
SELECT ROUND(AVG((TO_DAYS(NOW()) - TO_DAYS(birthday_at)) / 365.25), 0) AS AVG_age FROM users;
SELECT DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10))) AS week_day_of_birthday_in_this_year,
COUNT(DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10))))AS amount_of_birthday 
FROM users GROUP BY  week_day_of_birthday_in_this_year;







