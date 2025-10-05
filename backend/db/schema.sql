CREATE TABLE users (
                       user_id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(50) UNIQUE NOT NULL,
                       email VARCHAR(100) UNIQUE NOT NULL,
                       password VARCHAR(255) NOT NULL,  -- hashed
                       created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE favorites_pokemon (
                                   fav_id INT AUTO_INCREMENT PRIMARY KEY,
                                   user_id INT NOT NULL,
                                   pokemon_name VARCHAR(50) NOT NULL,
                                   pokemon_id INT NOT NULL,
                                   date_saved DATETIME DEFAULT CURRENT_TIMESTAMP,
                                   FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
CREATE TABLE favorites_cards (
                                 fav_card_id INT AUTO_INCREMENT PRIMARY KEY,
                                 user_id INT NOT NULL,
                                 card_id VARCHAR(50) NOT NULL,      -- TCG API card ID
                                 card_name VARCHAR(100) NOT NULL,
                                 image_url TEXT,
                                 date_saved DATETIME DEFAULT CURRENT_TIMESTAMP,
                                 FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
CREATE TABLE search_history (
                                history_id INT AUTO_INCREMENT PRIMARY KEY,
                                user_id INT NOT NULL,
                                search_term VARCHAR(100) NOT NULL,
                                search_type ENUM('pokemon', 'card') DEFAULT 'pokemon',
                                searched_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                                FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
