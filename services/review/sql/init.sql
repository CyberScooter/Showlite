CREATE DATABASE reviews;

\c reviews;

CREATE TABLE "review" (
  "id" SERIAL PRIMARY KEY,
  "user_id" int,
  "movie_id" int,
  "rating" int,
  "comment" text,
  "created_at" timestamp,
  "updated_at" timestamp
);