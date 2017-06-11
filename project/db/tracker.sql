DROP TABLE transactions;
-- DROP TABLE merchants;
DROP TABLE users;
-- DROP TABLE tags;


CREATE TABLE users(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

-- CREATE TABLE merchants(
--   id SERIAL8 PRIMARY KEY,
--   name VARCHAR(255)
-- );

-- CREATE TABLE tags(
--   id SERIAL8 PRIMARY KEY,
--   name VARCHAR(255)
-- );

CREATE TABLE transactions(
  id SERIAL8 PRIMARY KEY,
  amount INT4,
  description VARCHAR(255),
  tag_id VARCHAR(255), --INT4 REFERENCES tags(id) ON DELETE CASCADE,
  merchant_id VARCHAR(255),--INT4 REFERENCES merchants(id) ON DELETE CASCADE,
  user_id VARCHAR(255)--INT4 REFERENCES users(id) ON DELETE CASCADE
);