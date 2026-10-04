CREATE TABLE IF NOT EXISTS player_candies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    candy_count INT DEFAULT 0,
    FOREIGN KEY (player_id) REFERENCES users(id)
);

INSERT INTO player_candies (player_id, candy_count) SELECT id, 0 FROM users WHERE id NOT IN (SELECT player_id FROM player_candies);