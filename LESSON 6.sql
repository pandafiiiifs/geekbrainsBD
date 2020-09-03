-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT  COUNT(profiles.user_id), profiles.gender FROM profiles 
    INNER JOIN likes ON profiles.user_id = target_id 
        GROUP BY gender;


       
 -- 4. Подсчитать количество лайков которые получили 10 самых молодых пользователей. 
       