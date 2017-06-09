DROP TABLE transactions;
DROP TABLE users;

CREATE TABLE users(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL8 PRIMARY KEY,
  amount INT4,
  tag VARCHAR(255),
  description VARCHAR(255),
  merchant VARCHAR(255),
  user_id INT4 REFERENCES users(id) ON DELETE CASCADE
);