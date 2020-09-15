-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT  COUNT(profiles.user_id), profiles.gender FROM profiles 
    INNER JOIN likes ON profiles.user_id = likes.user_id 
        GROUP BY gender;
        
       
        -- 4. Подсчитать количество лайков которые получили 10 самых молодых пользователей. 

SELECT SUM(got_likes) AS total_likes_for_youngest
  FROM (   
    SELECT COUNT(DISTINCT likes.id) AS got_likes 
      FROM profiles
        LEFT JOIN likes
          ON likes.target_id = profiles.user_id
            AND target_type_id = 2
      GROUP BY profiles.user_id
      ORDER BY profiles.birthday DESC
      LIMIT 10
) AS youngest;   
         
         
           -- 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной 
-- сети.     

	 
	SELECT users.id,
  COUNT(DISTINCT messages.id) + 
  COUNT(DISTINCT likes.id) + 
  COUNT(DISTINCT media.id) AS activity 
  FROM users
    LEFT JOIN messages 
      ON users.id = messages.from_user_id
    LEFT JOIN likes
      ON users.id = likes.user_id
    LEFT JOIN media
      ON users.id = media.user_id
  GROUP BY users.id
  ORDER BY activity
  LIMIT 10;
