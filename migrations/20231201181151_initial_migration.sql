-- Create the 'daily_digests' table
CREATE TABLE daily_digests (
    id BIGINT AUTO_INCREMENT PRIMARY KEY, -- Changed to BIGINT to match i64 in Rust
    text TEXT NOT NULL,
    timestamp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Create the 'summaries' table with a foreign key reference to 'daily_digests'
CREATE TABLE summaries (
    id BIGINT AUTO_INCREMENT PRIMARY KEY, -- Changed to BIGINT to match i64 in Rust
    daily_digest_id BIGINT,               -- Changed to BIGINT to match i64 in Rust and match the foreign key
    text TEXT NOT NULL,
    timestamp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (daily_digest_id) REFERENCES daily_digests(id) ON DELETE SET NULL -- Added ON DELETE SET NULL to handle cases when the referenced digest is deleted
);
