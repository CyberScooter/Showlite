CREATE DATABASE watchlists;

\c watchlists;

CREATE TABLE "watchlist" (
  "id" SERIAL PRIMARY KEY,
  "user_id" int,
  "movie_id" int,
  "created_at" timestamp,
  "updated_at" timestamp
);