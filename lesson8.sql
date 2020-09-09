-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT  COUNT(profiles.user_id), profiles.gender FROM profiles 
    INNER JOIN likes ON profiles.user_id = likes.user_id 
        GROUP BY gender;
        
       
        -- 4. Подсчитать количество лайков которые получили 10 самых молодых пользователей. 

 SELECT likes.target_id ,likes.target_type_id ,profiles.birthday 
 FROM profiles 
         INNER JOIN likes ON target_id = profiles.user_id AND target_type_id = 2  ORDER BY birthday LIMIT 10;