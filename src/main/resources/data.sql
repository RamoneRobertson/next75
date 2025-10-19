-- Configure enums
CREATE TYPE goal_type AS ENUM ('LOSS', 'GAIN', 'MAINTAIN');
CREATE TYPE gender_type AS ENUM('MALE', 'FEMALE', 'NONE');

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
    created_at      TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL ,
    updated_at      TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL
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


-- Insert User Records

-- USER 1
INSERT INTO users (id, name, email, password, gender, birthdate, calorie_limit, streak, current_weight, target_weight, height, goal, created_at, updated_at)
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
       'LOSS',
       '2025-10-19',
       '2025-10-19'

WHERE NOT EXISTS (SELECT 1
                  FROM users
                  WHERE id = '123e4567-e89b-12d3-a456-426614174001');


-- USER 2
INSERT INTO users (id, name, email, password, gender, birthdate, calorie_limit, streak, current_weight, target_weight, height, goal, created_at, updated_at)
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
       'LOSS',
       '2025-10-19',
       '2025-10-19'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = '223e4567-e89b-12d3-a456-426614174002');


-- User 3
INSERT INTO users (id, name, email, password, gender, birthdate, calorie_limit, streak, current_weight, target_weight, height, goal, created_at, updated_at)
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
       'GAIN',
       '2025-10-19',
       '2025-10-19'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = '323e4567-e89b-12d3-a456-426614174003');


-- User 4
INSERT INTO users (id, name, email, password, gender, birthdate, calorie_limit, streak, current_weight, target_weight, height, goal, created_at, updated_at)
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
       'MAINTAIN',
       '2025-10-19',
       '2025-10-19'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = '423e4567-e89b-12d3-a456-426614174004');


-- User 5
INSERT INTO users (id, name, email, password, gender, birthdate, calorie_limit, streak, current_weight, target_weight, height, goal, created_at, updated_at)
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
       'LOSS',
       '2025-10-19',
       '2025-10-19'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = '523e4567-e89b-12d3-a456-426614174005');


