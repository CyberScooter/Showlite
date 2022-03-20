CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "username" varchar UNIQUE,
  "email" varchar,
  "hash" varchar,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "movies" (
  "id" SERIAL PRIMARY KEY,
  "rating" float,
  "name" varchar,
  "description" varchar,
  "year" int,
  "cover_url" varchar,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "reviews" (
  "id" SERIAL PRIMARY KEY,
  "user_id" int,
  "movie_id" int,
  "rating" int,
  "comment" text,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "watchlist" (
  "id" SERIAL PRIMARY KEY,
  "user_id" int,
  "movie_id" int,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "genre" (
  "id" SERIAL PRIMARY KEY,
  "type" varchar UNIQUE,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "movie_genre" (
  "id" SERIAL PRIMARY KEY,
  "movie_id" int,
  "genre_id" int,
  "created_at" timestamp,
  "updated_at" timestamp
);

ALTER TABLE "watchlist" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE;

ALTER TABLE "reviews" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE;

ALTER TABLE "watchlist" ADD FOREIGN KEY ("movie_id") REFERENCES "movies" ("id") ON DELETE CASCADE;

ALTER TABLE "reviews" ADD FOREIGN KEY ("movie_id") REFERENCES "movies" ("id") ON DELETE CASCADE;

ALTER TABLE "movie_genre" ADD FOREIGN KEY ("movie_id") REFERENCES "movies" ("id") ON DELETE CASCADE;

ALTER TABLE "movie_genre" ADD FOREIGN KEY ("genre_id") REFERENCES "genre" ("id") ON DELETE CASCADE;