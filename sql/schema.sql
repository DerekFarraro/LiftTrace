-- ==========================================================
-- LiftTrace - Relational Database Schema Definition
-- Target Engine: MySQL 8.x
-- ==========================================================

-- 1. Users & Authentication
CREATE TABLE users
(
    id              BIGINT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    email           VARCHAR(255) UNIQUE,
    phone_number    VARCHAR(20) UNIQUE,
    password_hash   VARCHAR(255) NOT NULL,
    role            VARCHAR(20)  NOT NULL DEFAULT 'ROLE_USER',
    unit_preference VARCHAR(10)  NOT NULL DEFAULT 'LBS',
    created_at      TIMESTAMP             DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT chk_user_contact CHECK (email IS NOT NULL OR phone_number IS NOT NULL)
);

-- 2. Exercise Catalog (Movement Library)
CREATE TABLE exercise_catalog
(
    id                BIGINT AUTO_INCREMENT PRIMARY KEY,
    name              VARCHAR(100) NOT NULL UNIQUE,
    primary_muscle    VARCHAR(50)  NOT NULL,
    secondary_muscles VARCHAR(150),
    equipment         VARCHAR(50)  NOT NULL,
    video_url         VARCHAR(500),
    created_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX             idx_primary_muscle (primary_muscle)
);

-- 3. Workouts (Training Sessions)
CREATE TABLE workouts
(
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id      BIGINT NOT NULL,
    workout_date DATE   NOT NULL,
    start_time   TIMESTAMP NULL,
    end_time     TIMESTAMP NULL,
    notes        VARCHAR(500),
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_workouts_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    INDEX        idx_user_workout_date (user_id, workout_date DESC)
);
-- 4. Workout Exercises (Bridging Table: Session <-> Movement)
CREATE TABLE workout_exercises
(
    id               BIGINT AUTO_INCREMENT PRIMARY KEY,
    workout_id       BIGINT NOT NULL,
    exercise_id      BIGINT NOT NULL,
    order_in_workout INT    NOT NULL,
    notes            VARCHAR(255),
    CONSTRAINT fk_we_workout FOREIGN KEY (workout_id) REFERENCES workouts (id) ON DELETE CASCADE,
    CONSTRAINT fk_we_exercise FOREIGN KEY (exercise_id) REFERENCES exercise_catalog (id) ON DELETE RESTRICT,
    INDEX            idx_workout_order (workout_id, order_in_workout ASC)
);

-- 5. Workout Sets (Atomic Performance Records)
CREATE TABLE workout_sets
(
    id                  BIGINT AUTO_INCREMENT PRIMARY KEY,
    workout_exercise_id BIGINT        NOT NULL,
    set_number          INT           NOT NULL,
    weight              DECIMAL(5, 2) NOT NULL,
    reps                INT           NOT NULL,
    rpe                 DECIMAL(3, 1) NULL,
    is_warmup           BOOLEAN       NOT NULL DEFAULT FALSE,
    created_at          TIMESTAMP              DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_sets_workout_exercise FOREIGN KEY (workout_exercise_id) REFERENCES workout_exercises (id) ON DELETE CASCADE,
    CONSTRAINT chk_set_weight CHECK (weight >= 0.0),
    CONSTRAINT chk_set_reps CHECK (reps > 0),
    INDEX               idx_exercise_sets (workout_exercise_id, set_number ASC)
);