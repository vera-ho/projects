DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    user_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
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
    ('Madeleine', 'Pla'),
    ('Vera', 'Ho'),
    ('Ayce', 'Lacap'),
    ('Victor', 'He');

INSERT INTO 
    questions(title, body, user_id)
VALUES
    ('What is SQL?', 'I forgot how to use google. Pls help!',
    (SELECT id FROM users WHERE fname = 'Madeleine' AND lname =  'Pla')),
    ('What''s for lunch?', 'I''m hungry. Should I get pizza?' ,
    (SELECT id FROM users WHERE fname = 'Vera' AND lname = 'Ho')),
    ('Question', 'Can I ask a second question?',
    (SELECT id FROM users WHERE fname = 'Madeleine' AND lname =  'Pla'));

INSERT INTO
    question_follows(question_id, user_id)
VALUES
    ((SELECT id FROM questions WHERE title LIKE '%SQL%'),
    (SELECT id FROM users WHERE fname = 'Ayce' AND lname = 'Lacap'));

INSERT INTO
    replies(question_id, parent_reply_id, user_id, body)
VALUES
    ((SELECT id FROM questions WHERE title LIKE '%lunch%'),
        NULL, 
        (SELECT id FROM users WHERE fname = 'Victor' AND lname = 'He'), 
        'Pizza sucks. Get halal instead.'),
    ((SELECT id FROM questions WHERE title LIKE '%lunch%'),
        1, 
        (SELECT id FROM users WHERE fname = 'Ayce' AND lname = 'Lacap'), 
        'SF has the best pizza :)');

INSERT INTO
    question_likes(user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'Madeleine' AND lname =  'Pla'),
    (SELECT id FROM questions WHERE title LIKE '%lunch%'));