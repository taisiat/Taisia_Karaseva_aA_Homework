CREATE TABLE houses (
  id INTEGER PRIMARY KEY,
  address TEXT NOT NULL
);

CREATE TABLE people (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  house_id INTEGER NOT NULL,

  FOREIGN KEY (house_id) REFERENCES houses(id)
);