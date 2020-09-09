-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT  COUNT(profiles.user_id), profiles.gender FROM profiles 
    INNER JOIN likes ON profiles.user_id = likes.user_id 
        GROUP BY gender;

 SELECT 
      (SELECT gender FROM profiles WHERE user_id = likes.user_id) AS gender,
      count(*) AS total FROM likes 
      GROUP BY gender ORDER BY total DESC;

       
 -- 4. Подсчитать количество лайков которые получили 10 самых молодых пользователей. 
 
 SELECT 
      (SELECT COUNT(*) FROM likes WHERE target_id = profiles.user_id AND target_type_id = 2) AS 
      likes_total  
      FROM profiles 
      ORDER BY birthday DESC LIMIT 10;
     
     SELECT SUM(likes_total) FROM  
  (SELECT 
    (SELECT COUNT(*) FROM likes WHERE target_id = profiles.user_id AND target_type_id = 2) AS likes_total  
    FROM profiles 
    ORDER BY birthday 
    DESC LIMIT 10) AS user_likes;
  
