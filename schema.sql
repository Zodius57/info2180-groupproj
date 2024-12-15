-- Make Database 
DROP DATABASE IF EXISTS dolphin_crm;
CREATE DATABASE dolphin_crm;
USE dolphin_crm;

-- Create Users Table
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    role VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create Contacts Table
DROP TABLE IF EXISTS contacts;
CREATE TABLE contacts (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    telephone VARCHAR(20),
    company VARCHAR(255),
    type VARCHAR(100), -- Sales Lead or Support
    assigned_to INTEGER, -- User ID
    created_by INTEGER, -- User ID
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (assigned_to) REFERENCES Users(id),
    FOREIGN KEY (created_by) REFERENCES Users(id)
);

-- Create Notes Table
DROP TABLE IF EXISTS notes;
CREATE TABLE notes (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    contact_id INTEGER NOT NULL,
    comment TEXT NOT NULL,
    created_by INTEGER, -- User ID
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (contact_id) REFERENCES Contacts(id),
    FOREIGN KEY (created_by) REFERENCES Users(id)
);

-- Insert Admin User
INSERT INTO users (firstname, lastname, password, email, role, created_at)
VALUES (
    'Admin', 
    'User', 
    SHA2('password123', 256), -- Ensure password hashing is used
    'admin@project2.com',
    'Admin',
    NOW()
);
