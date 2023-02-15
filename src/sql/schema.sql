CREATE TABLE item (
  id SERIAL PRIMARY KEY,
  genre VARCHAR(255),
  author VARCHAR(255),
  source VARCHAR(255),
  label VARCHAR(255),
  publish_date DATE,
  archived BOOLEAN
)

CREATE TABLE genre(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE music_album (
  id SERIAL PRIMARY KEY,
  on_spotify BOOLEAN,
  publish_date DATE,
  genre_id INT REFERENCES genre(id),
)

-- Create Games Table
CREATE TABLE games (
  id INT,
  multiplayer BOOLEAN,
  last_played_at DATE,
  FOREIGN KEY(id) REFERENCES item(id)
);

-- Create Authors Table
CREATE TABLE authors (
  id  INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  PRIMARY KEY(id)
);
