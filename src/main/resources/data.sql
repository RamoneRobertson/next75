-- Configure enums
CREATE TYPE goal_type AS ENUM ('LOSS', 'GAIN', 'MAINTAIN');

-- Ensure the 'users' table exists
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY,
    name            VARCHAR(255)                              NOT NULL,
    email           VARCHAR(255)    UNIQUE                    NOT NULL,
    password        VARCHAR(255)                              NOT NULL,
    gender          VARCHAR(10)                               NOT NULL ,
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