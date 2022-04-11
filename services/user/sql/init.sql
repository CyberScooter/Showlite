CREATE DATABASE usersdb;

\c usersdb;

CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "username" varchar UNIQUE,
  "email" varchar,
  "hash" varchar,
  "created_at" timestamp,
  "updated_at" timestamp
);

-- Password: test12345
insert into users(username, email, hash, created_at, updated_at) values ('TestAccount1', 'test1@example.com', '$2b$10$8mSZ7e4zHDwa.2tD98YlC.o.h6fV9HALm/8GIGiK.4R5Hb8l3gVuO', now(), now());

-- Password: test12345
insert into users(username, email, hash, created_at, updated_at) values ('TestAccount2', 'test2@example.com', '$2b$10$8mSZ7e4zHDwa.2tD98YlC.o.h6fV9HALm/8GIGiK.4R5Hb8l3gVuO', now(), now());

-- Password: test12345
insert into users(username, email, hash, created_at, updated_at) values ('TestAccount3', 'test3@example.com', '$2b$10$8mSZ7e4zHDwa.2tD98YlC.o.h6fV9HALm/8GIGiK.4R5Hb8l3gVuO', now(), now());
