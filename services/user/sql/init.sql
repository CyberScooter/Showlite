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