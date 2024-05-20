-- Sonia Sheth and Dylan Toplas 

-- 4
SELECT photos.id, photos.image_url, COUNT(comments.id)
FROM photos
    Left JOIN comments
                    ON photos.id = comments.photo_id
      GROUP BY photos.id, photos.created_at
ORDER BY photos.created_at DESC;

select  photos.id, photos.image_url#, COUNT(comments.id)
FROM photos;

-- 5
SELECT DISTINCT username
FROM photos
        		 JOIN users
              		ON photos.user_id = users.id
        		 LEFT JOIN likes
                   		ON photos.id = likes.photo_id
         		JOIN comments
              		ON photos.id = comments.photo_id
WHERE likes.created_at IS NULL
ORDER BY username ASC;

-- 6
SELECT COUNT(*) as num_photos
FROM (SELECT photos.user_id
      FROM tags
               JOIN photo_tag
                    ON tags.id = photo_tag.tag_id
               JOIN photos
                    ON photo_tag.photo_id = photos.id
      WHERE tag_name = '#NEU'
      INTERSECT
      SELECT photos.user_id
      FROM tags
               JOIN photo_tag
                    ON tags.id = photo_tag.tag_id
               JOIN photos
                    ON photo_tag.photo_id = photos.id
      WHERE tag_name = '#BU' ) as tagged;

-- 7 
SELECT username, comment_text
FROM comments
         JOIN users
              ON comments.user_id = users.id
WHERE LOWER(comments.comment_text) LIKE '%college%'
ORDER BY comments.created_at ASC;

-- 8
SELECT DISTINCT username, users.created_at
FROM users
         LEFT JOIN photos
                   ON photos.user_id = users.id
WHERE photos.created_at is NULL
ORDER BY username ASC;