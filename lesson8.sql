-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT  COUNT(profiles.user_id), profiles.gender FROM profiles 
    INNER JOIN likes ON profiles.user_id = likes.user_id 
        GROUP BY gender;
        
       
        -- 4. Подсчитать количество лайков которые получили 10 самых молодых пользователей. 

 SELECT likes.target_id ,likes.target_type_id ,profiles.birthday 
 FROM profiles 
         INNER JOIN likes ON target_id = profiles.user_id AND target_type_id = 2  ORDER BY birthday LIMIT 10;
         
         
           -- 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной 
-- сети.     

	 
	SELECT 
      CONCAT (users.first_name , ' ' , users.last_name) as user,likes.user_id FROM users 
       left join likes on likes.user_id = users.id  
       left join media on media.user_id = users.id
      left join messages on messages.from_user_id = users.id 
	  LIMIT 10;
