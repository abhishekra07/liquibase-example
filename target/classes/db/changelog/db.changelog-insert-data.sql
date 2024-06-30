--liquibase formatted sql
--changeset abhishek:2

-- Inserting data into the `users` table
INSERT INTO users (username, email, password) VALUES
('alice', 'alice@example.com', 'password123'),
('bob', 'bob@example.com', 'password456'),
('charlie', 'charlie@example.com', 'password789');

-- Inserting data into the `posts` table
INSERT INTO posts (user_id, content) VALUES
(1, 'First post by Alice'),
(2, 'Hello from Bob'),
(1, 'Another post by Alice');

-- Inserting data into the `comments` table
INSERT INTO comments (post_id, user_id, content) VALUES
(1, 2, 'Great post, Alice!'),
(1, 3, 'Interesting thoughts!'),
(3, 1, 'Nice one, Alice! Keep it up.');

--rollback

-- Remove the data inserted into `comments`
DELETE FROM comments WHERE post_id IN (1, 3);

-- Remove the data inserted into `posts`
DELETE FROM posts WHERE user_id IN (1, 2);

-- Remove the data inserted into `users`
DELETE FROM users WHERE username IN ('alice', 'bob', 'charlie');