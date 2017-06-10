DROP TABLE transactions;
DROP TABLE users;
DROP TABLE tags;
DROP TABLE merchant;

CREATE TABLE users(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
);

CREATE TABLE merchant(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL8 PRIMARY KEY,
  amount INT4,
  description VARCHAR(255),
  tag_id INT4 REFERENCES tags(id),
  merchant_id INT4 REFERENCES merchant(id),
  user_id INT4 REFERENCES users(id) ON DELETE CASCADE
);