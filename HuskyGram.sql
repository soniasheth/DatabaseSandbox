DROP DATABASE IF EXISTS HuskyGram;
CREATE DATABASE IF NOT EXISTS HuskyGram;

USE HuskyGram;

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at DATETIME,
    id INT,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS follows;
CREATE TABLE IF NOT EXISTS follows
(
    created_at  DATETIME,
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users (id),
    FOREIGN KEY (followee_id) REFERENCES users(id),
    PRIMARY KEY (followee_id, follower_id)
);

DROP TABLE IF EXISTS photos;
CREATE TABLE IF NOT EXISTS photos (
    id INT,
    image_url VARCHAR(255) NOT NULL,
    created_at DATETIME,
    user_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS tags;
CREATE TABLE IF NOT EXISTS tags (
    tag_name VARCHAR(255) UNIQUE,
    created_at DATETIME,
    id INT,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS photo_tag;
CREATE TABLE IF NOT EXISTS photo_tag (
    photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY (photo_id, tag_id),
    FOREIGN KEY (photo_id) REFERENCES photos(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

DROP TABLE IF EXISTS likes;
CREATE TABLE IF NOT EXISTS likes (
    created_at DATETIME,
    user_id int UNIQUE NOT NULL,
    photo_id int UNIQUE NOT NULL,
    PRIMARY KEY (user_id, photo_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id)
);

DROP TABLE IF EXISTS comments;
CREATE TABLE IF NOT EXISTS comments (
    comment_text VARCHAR(255),
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at DATETIME NOT NULL,
    id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id)
);

INSERT INTO users (id, username, created_at) VALUES (1, 'Sonia', NOW());
INSERT INTO users (id, username, created_at) VALUES (2, 'Maggie', NOW());
INSERT INTO users (id, username, created_at) VALUES (3, 'Carson', NOW());
INSERT INTO users (id, username, created_at) VALUES (4, 'Dylan', NOW());

INSERT INTO photos (image_url, user_id, created_at, id) VALUES ('.jpeg', 1, NOW(), 20);
INSERT INTO photos (image_url, user_id, created_at, id) VALUES ('.jpeg', 2, NOW(), 21);
INSERT INTO photos (image_url, user_id, created_at, id) VALUES ('.jpeg', 3, NOW(), 22);
INSERT INTO photos (image_url, user_id, created_at, id) VALUES ('.jpeg', 3, NOW(), 23);

INSERT INTO tags (tag_name, created_at, id) VALUES ('#NEU', NOW(), 10);
INSERT INTO tags (tag_name, created_at, id) VALUES ('#BU', NOW(), 11);

INSERT INTO photo_tag (photo_id, tag_id) VALUES (20, 10);
INSERT INTO photo_tag (photo_id, tag_id) VALUES (20, 11);
INSERT INTO photo_tag (photo_id, tag_id) VALUES (21, 11);
INSERT INTO photo_tag (photo_id, tag_id) VALUES (21, 10);

# INSERT INTO likes (created_at, user_id, photo_id) VALUES (NOW(), 1, 20);
INSERT INTO likes (created_at, user_id, photo_id) VALUES (NOW(), 2, 21);

INSERT INTO comments (comment_text, user_id, photo_id, created_at, id) VALUES ('im in college', 1, 20, NOW(), 30);
INSERT INTO comments (comment_text, user_id, photo_id, created_at, id) VALUES ('hi', 1, 21, NOW(), 29);
INSERT INTO comments (comment_text, user_id, photo_id, created_at, id) VALUES ('hi', 2, 21, NOW(), 31);
INSERT INTO comments (comment_text, user_id, photo_id, created_at, id) VALUES ('im in college', 2, 22, NOW(), 32);
INSERT INTO comments (comment_text, user_id, photo_id, created_at, id) VALUES ('hi', 2, 22, NOW(), 33);



















