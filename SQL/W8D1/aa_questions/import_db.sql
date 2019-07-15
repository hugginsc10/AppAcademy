PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname VARCHAR(255) NOT NULL,
    lname VARCHAR(255) NOT NULL
);


CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    
    FOREIGN KEY (author_id) REFERENCES users (id)
);


CREATE TABLE questions_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_reply INTEGER,
    author_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply) REFERENCES replies(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);


CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)    
);

INSERT INTO 
    users (fname, lname)
VALUES
    ('Chas', 'Huggins'), ('Ivo', 'Pavlov'), ('Andy', 'Wynkoop'), ('Trevor', 'Uptain');


INSERT INTO
    questions (title, body, author_id)
VALUES
    ('Chas Huggins Question', 'What is 1 + 1?', 
                                            (SELECT
                                                id
                                            FROM
                                                users
                                            WHERE
                                                fname = 'Chas'
                                                AND
                                                lname = 'Huggins'
                                            )),
    ('Ivo Pavlov Question', 'What is 1 + 2?', (
                                            SELECT
                                                id
                                            FROM
                                                users
                                            WHERE
                                                fname = 'Ivo'
                                                AND
                                                lname = 'Pavlov'
                                            )),
      ('Andy Wynkoop Question', 'Did you do the hw?', (
                                            SELECT
                                                id
                                            FROM
                                                users
                                            WHERE
                                                fname = 'Andy'
                                                AND
                                                lname = 'Wynkoop'
                                            ));

INSERT INTO
    questions_follows (user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'Chas' AND lname = 'Huggins'),
    (SELECT id FROM questions WHERE title = 'Andy Wynkoop Question')),
    ((SELECT id FROM users WHERE fname = 'Ivo' AND lname = 'Pavlov'),
    (SELECT id FROM questions WHERE title = 'Chas Huggins Question')),
    ((SELECT id FROM users WHERE fname = 'Andy' AND lname = 'Wynkoop'),
    (SELECT id FROM questions WHERE title = 'Ivo Pavlov Question'));

INSERT INTO
    replies (question_id, parent_reply, author_id, body)
VALUES (
    (SELECT id FROM questions WHERE title = 'Chas Huggins Question'), NULL,
    (SELECT id FROM users WHERE fname = 'Ivo' AND lname = 'Pavlov'), '2'),
    ((SELECT id FROM questions WHERE title = 'Ivo Pavlov Question'), NULL,
    (SELECT id FROM users WHERE fname = 'Chas' AND lname = 'Huggins'), 'Three'),    
    ((SELECT id FROM questions WHERE title = 'Andy Wynkoop Question'), NULL,
    (SELECT id FROM users WHERE fname = 'Ivo' AND lname = 'Pavlov'), 'No'),
    ((SELECT id FROM questions WHERE title = 'Andy Wynkoop Question'), NULL,
    (SELECT id FROM users WHERE fname = 'Chas' AND lname = 'Huggins'), 'Yes');

-- THIS MAKES A CHILD REPLY
INSERT INTO
    replies (question_id, parent_reply, author_id, body)
VALUES
    ((SELECT id FROM questions WHERE title = 'Andy Wynkoop Question'), 3,
    (SELECT id FROM users WHERE fname = 'Andy' AND lname = 'Wynkoop'), 'That''s not good!');

-- ADDS SECOND FOLLOW TO CHAS' QUESTION
INSERT INTO
    questions_follows (user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'Chas' AND lname = 'Huggins'),
    (SELECT id FROM questions WHERE title = 'Chas Huggins Question'));

INSERT INTO 
    question_likes (user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'Ivo' AND lname = 'Pavlov'),
    (SELECT id FROM questions WHERE title = 'Ivo Pavlov Question')),
    ((SELECT id FROM users WHERE fname = 'Chas' AND lname = 'Huggins'),
    (SELECT id FROM questions WHERE title = 'Andy Wynkoop Question'));

