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
)

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
)


);