INSERT INTO review (id, user_id, store_id, content, star, created_at)
VALUES ({review_id}, {user_id}, {store_id}, '{content}', {star}, NOW());