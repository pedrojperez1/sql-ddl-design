DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db

CREATE TABLE "users" (
    "id" serial   NOT NULL,
    "username" varchar   NOT NULL,
    "pref_region_id" int   NOT NULL,
    CONSTRAINT "pk_users" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "posts" (
    "id" serial   NOT NULL,
    "title" text   NOT NULL,
    "text" text   NOT NULL,
    "user_id" int   NOT NULL,
    "location_id" int   NOT NULL,
    "category_id" int   NOT NULL,
    CONSTRAINT "pk_posts" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "categories" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_categories" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "region" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_region" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "users" ADD CONSTRAINT "fk_users_pref_region_id" FOREIGN KEY("pref_region_id")
REFERENCES "region" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_user_id" FOREIGN KEY("user_id")
REFERENCES "users" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_location_id" FOREIGN KEY("location_id")
REFERENCES "region" ("id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_category_id" FOREIGN KEY("category_id")
REFERENCES "categories" ("id");

INSERT INTO region (name)
VALUES 
    ('San Francisco'), 
    ('Philadelphia'), 
    ('Boston'), 
    ('Chicago'), 
    ('New York'), 
    ('Austin')
;

INSERT INTO users (username, pref_region_id)
VALUES
    ('purpleiscool', 2),
    ('cheeseisdelicious444', 3),
    ('fireworksaredangerous', 1),
    ('grossthatsmells', 3),
    ('itsnotthatbad123', 5)
;

INSERT INTO categories (name)
VALUES
    ('housing'),
    ('free'),
    ('appliances'),
    ('electronics'),
    ('sporting goods')
;

INSERT INTO posts (title, text, user_id, location_id, category_id)
VALUES
    ('Free cookies', 'Come get free cookies!', 2, 3, 2),
    ('Selling tv', 'Samsung 55 inch tv for sale', 4, 4, 4)
;