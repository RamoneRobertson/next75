-- Configure enums
-- CREATE TYPE goal_type AS ENUM ('LOSS', 'GAIN', 'MAINTAIN');
-- CREATE TYPE gender_type AS ENUM('MALE', 'FEMALE', 'NONE');

-- Ensure the 'users' table exists
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY,
    name            VARCHAR(255)                              NOT NULL,
    email           VARCHAR(255)    UNIQUE                    NOT NULL,
    password        VARCHAR(255)                              NOT NULL,
    gender          gender_type                               NOT NULL,
    birthdate       DATE                                      NOT NULL,
    calorie_limit   BIGINT                                    NULL,
    streak          BIGINT                                    NULL ,
    current_weight  DECIMAL(5, 2)                             NOT NULL ,
    target_weight   DECIMAL(5, 2)                             NOT NULL,
    height          DECIMAL(5, 2)                             NOT NULL,
    goal            goal_type                                 NOT NULL,
    created_at TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL ,
    updated_at  TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Create Lists table
CREATE TABLE IF NOT EXISTS  lists (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    title VARCHAR(255) DEFAULT('75 Hard') NOT NULL,
    start_date DATE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_at      TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL ,
    updated_at      TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT lists_users_id_fk
        FOREIGN KEY (user_id) REFERENCES  users (id)
);

-- Create Tasks table
CREATE TABLE IF NOT EXISTS tasks(
    id BIGINT PRIMARY KEY,
    list_id UUID NOT NULL ,
    title VARCHAR(255) NOT NULL,
    description TEXT NULL,
    is_completed BOOLEAN DEFAULT false,
    completed_at TIMESTAMP NULL,
    created_at      TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at      TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT  tasks_lists_id_fk
        FOREIGN KEY (list_id) REFERENCES lists (id)
);

-- Create Meals Table
CREATE TABLE IF NOT EXISTS meals(
    id BIGINT PRIMARY KEY,
    user_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    calories DECIMAL(5, 2),
    created_at TIMESTAMP DEFAULT  CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT  CURRENT_TIMESTAMP NOT NULL

);

-- Insert User Records

-- USER 1
INSERT INTO users (id, name, email, password, gender, birthdate, calorie_limit, streak, current_weight, target_weight, height, goal)
SELECT '123e4567-e89b-12d3-a456-426614174001',
       'John Doe',
       'john.doe@example.com',
       'password',
       'MALE',
       '1985-06-15',
       '4000',
       12,
       93,
       84,
       183,
       'LOSS'

WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = '123e4567-e89b-12d3-a456-426614174001');

-- USER 2
INSERT INTO users (id, name, email, password, gender, birthdate, calorie_limit, streak, current_weight, target_weight, height, goal)
SELECT '223e4567-e89b-12d3-a456-426614174002',
       'Jane Smith',
       'jane.smith@example.com',
       'password',
       'FEMALE',
       '1990-02-20',
       '2000',
       5,
       65,
       60,
       170,
       'LOSS'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = '223e4567-e89b-12d3-a456-426614174002');

-- User 3
INSERT INTO users (id, name, email, password, gender, birthdate, calorie_limit, streak, current_weight, target_weight, height, goal)
SELECT '323e4567-e89b-12d3-a456-426614174003',
       'Michael Johnson',
       'michael.johnson@example.com',
       'password',
       'MALE',
       '1995-08-10',
       '3500',
       20,
       82,
       85,
       178,
       'GAIN'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = '323e4567-e89b-12d3-a456-426614174003');

-- User 4
INSERT INTO users (id, name, email, password, gender, birthdate, calorie_limit, streak, current_weight, target_weight, height, goal)
SELECT '423e4567-e89b-12d3-a456-426614174004',
       'Emily Davis',
       'emily.davis@example.com',
       'password',
       'FEMALE',
       '1988-11-03',
       '2300',
       8,
       70,
       68,
       165,
       'MAINTAIN'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = '423e4567-e89b-12d3-a456-426614174004');

-- User 5
INSERT INTO users (id, name, email, password, gender, birthdate, calorie_limit, streak, current_weight, target_weight, height, goal)
SELECT '523e4567-e89b-12d3-a456-426614174005',
       'Chris Lee',
       'chris.lee@example.com',
       'password',
       'MALE',
       '1992-04-12',
       '2800',
       15,
       75,
       70,
       172,
       'LOSS'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = '523e4567-e89b-12d3-a456-426614174005');

-- Creating Lists for users

-- LIST 1
INSERT INTO lists (id, user_id, start_date)
SELECT '123e4567-e89b-12d3-a456-426614174101',
       '123e4567-e89b-12d3-a456-426614174001',
       current_date

WHERE NOT EXISTS(SELECT 1 FROM lists WHERE id = '123e4567-e89b-12d3-a456-426614174101');


-- LIST 2
INSERT INTO lists (id, user_id, start_date )
SELECT '123e4567-e89b-12d3-a456-426614174102',
       '223e4567-e89b-12d3-a456-426614174002',
       current_date

WHERE NOT EXISTS(SELECT 1 FROM lists WHERE id = '123e4567-e89b-12d3-a456-426614174102');

-- LIST 3
INSERT INTO lists (id, user_id, start_date )
SELECT '123e4567-e89b-12d3-a456-426614174103',
       '323e4567-e89b-12d3-a456-426614174003',
       current_date

WHERE NOT EXISTS(SELECT 1 FROM lists WHERE id = '123e4567-e89b-12d3-a456-426614174103');

-- LIST 4
INSERT INTO lists (id, user_id, start_date )
SELECT '123e4567-e89b-12d3-a456-426614174104',
       '423e4567-e89b-12d3-a456-426614174004',
       current_date

WHERE NOT EXISTS(SELECT 1 FROM lists WHERE id = '123e4567-e89b-12d3-a456-426614174104');


-- LIST 5
INSERT INTO lists (id, user_id, start_date )
SELECT '123e4567-e89b-12d3-a456-426614174105',
       '523e4567-e89b-12d3-a456-426614174005',
       current_date

WHERE NOT EXISTS(SELECT 1 FROM lists WHERE id = '123e4567-e89b-12d3-a456-426614174105');

-- Creating tasks for lists

-- LIST 1 Tasks
INSERT INTO tasks(id, list_id, title)
SELECT 1,
       '123e4567-e89b-12d3-a456-426614174101',
       'Outside Workout'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 1);

INSERT INTO tasks(id, list_id, title)
SELECT 2,
       '123e4567-e89b-12d3-a456-426614174101',
       'Inside Workout'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 2);

INSERT INTO tasks(id, list_id, title)
SELECT 3,
       '123e4567-e89b-12d3-a456-426614174101',
       'Drink a gallon of water'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 3);

INSERT INTO tasks(id, list_id, title)
SELECT 4,
       '123e4567-e89b-12d3-a456-426614174101',
       'Read 10 pages of a non-fiction book'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 4);

INSERT INTO tasks(id, list_id, title)
SELECT 5,
       '123e4567-e89b-12d3-a456-426614174101',
       'Take progress photo'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 5);

-- LIST 2 Tasks
INSERT INTO tasks(id, list_id, title)
SELECT 6,
       '123e4567-e89b-12d3-a456-426614174102',
       'Outside Workout'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 6);

INSERT INTO tasks(id, list_id, title)
SELECT 7,
       '123e4567-e89b-12d3-a456-426614174102',
       'Inside Workout'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 7);

INSERT INTO tasks(id, list_id, title)
SELECT 8,
       '123e4567-e89b-12d3-a456-426614174102',
       'Drink a gallon of water'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 8);

INSERT INTO tasks(id, list_id, title)
SELECT 9,
       '123e4567-e89b-12d3-a456-426614174102',
       'Read 10 pages of a non-fiction book'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 9);

INSERT INTO tasks(id, list_id, title)
SELECT 10,
       '123e4567-e89b-12d3-a456-426614174102',
       'Take progress photo'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 10);

-- LIST 3 Tasks
INSERT INTO tasks(id, list_id, title)
SELECT 11,
       '123e4567-e89b-12d3-a456-426614174103',
       'Outside Workout'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 11);

INSERT INTO tasks(id, list_id, title)
SELECT 12,
       '123e4567-e89b-12d3-a456-426614174103',
       'Inside Workout'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 12);

INSERT INTO tasks(id, list_id, title)
SELECT 13,
       '123e4567-e89b-12d3-a456-426614174103',
       'Drink a gallon of water'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 13);

INSERT INTO tasks(id, list_id, title)
SELECT 14,
       '123e4567-e89b-12d3-a456-426614174103',
       'Read 10 pages of a non-fiction book'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 14);

INSERT INTO tasks(id, list_id, title)
SELECT 15,
       '123e4567-e89b-12d3-a456-426614174103',
       'Take progress photo'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 15);

-- LIST 4 Tasks
INSERT INTO tasks(id, list_id, title)
SELECT 16,
       '123e4567-e89b-12d3-a456-426614174104',
       'Outside Workout'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 16);

INSERT INTO tasks(id, list_id, title)
SELECT 17,
       '123e4567-e89b-12d3-a456-426614174104',
       'Inside Workout'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 17);

INSERT INTO tasks(id, list_id, title)
SELECT 18,
       '123e4567-e89b-12d3-a456-426614174104',
       'Drink a gallon of water'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 18);

INSERT INTO tasks(id, list_id, title)
SELECT 19,
       '123e4567-e89b-12d3-a456-426614174104',
       'Read 10 pages of a non-fiction book'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 19);

INSERT INTO tasks(id, list_id, title)
SELECT 20,
       '123e4567-e89b-12d3-a456-426614174104',
       'Take progress photo'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 20);

-- LIST 5 Tasks
INSERT INTO tasks(id, list_id, title)
SELECT 21,
       '123e4567-e89b-12d3-a456-426614174105',
       'Outside Workout'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 21);

INSERT INTO tasks(id, list_id, title)
SELECT 22,
       '123e4567-e89b-12d3-a456-426614174105',
       'Inside Workout'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 22);

INSERT INTO tasks(id, list_id, title)
SELECT 23,
       '123e4567-e89b-12d3-a456-426614174105',
       'Drink a gallon of water'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 23);

INSERT INTO tasks(id, list_id, title)
SELECT 24,
       '123e4567-e89b-12d3-a456-426614174105',
       'Read 10 pages of a non-fiction book'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 24);

INSERT INTO tasks(id, list_id, title)
SELECT 25,
       '123e4567-e89b-12d3-a456-426614174105',
       'Take progress photo'
WHERE NOT EXISTS(SELECT 1 FROM tasks WHERE id = 25);

-- CREATE TABLE IF NOT EXISTS tasks(
--                                     id BIGINT PRIMARY KEY,
--                                     list_id UUID NOT NULL ,
--                                     title VARCHAR(255) NOT NULL,
--                                     description TEXT NULL,
--                                     is_completed BOOLEAN DEFAULT false,
--                                     completed_at TIMESTAMP NULL,
--                                           TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL,
--                                           TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL,
--                                     CONSTRAINT  tasks_lists_id_fk
--                                         FOREIGN KEY (list_id) REFERENCES lists (id)
-- );
