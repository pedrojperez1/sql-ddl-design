DROP DATABASE IF EXISTS soccer_league_db;

CREATE DATABASE soccer_league_db;

\c soccer_league_db

CREATE TABLE "teams" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "league_id" int   NOT NULL,
    CONSTRAINT "pk_teams" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "goals" (
    "id" serial   NOT NULL,
    "match_id" int   NOT NULL,
    "player_id" int   NOT NULL,
    "team_id" int   NOT NULL,
    CONSTRAINT "pk_goals" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "players" (
    "id" serial   NOT NULL,
    "fname" text   NOT NULL,
    "lname" text   NOT NULL,
    "team_id" int   NOT NULL,
    CONSTRAINT "pk_players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "referees" (
    "id" serial   NOT NULL,
    "fname" text   NOT NULL,
    "lname" text   NOT NULL,
    CONSTRAINT "pk_referees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "matches" (
    "id" serial   NOT NULL,
    "team1_id" int   NOT NULL,
    "team2_id" int   NOT NULL,
    CONSTRAINT "pk_matches" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "matches_referees" (
    "id" serial   NOT NULL,
    "match_id" int   NOT NULL,
    "referee_id" int   NOT NULL,
    CONSTRAINT "pk_matches_referees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "leagues" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "start_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    CONSTRAINT "pk_leagues" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "teams" ADD CONSTRAINT "fk_teams_league_id" FOREIGN KEY("league_id")
REFERENCES "leagues" ("id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_match_id" FOREIGN KEY("match_id")
REFERENCES "matches" ("id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_player_id" FOREIGN KEY("player_id")
REFERENCES "players" ("id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_team_id" FOREIGN KEY("team_id")
REFERENCES "teams" ("id");

ALTER TABLE "players" ADD CONSTRAINT "fk_players_team_id" FOREIGN KEY("team_id")
REFERENCES "teams" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_team1_id" FOREIGN KEY("team1_id")
REFERENCES "teams" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_team2_id" FOREIGN KEY("team2_id")
REFERENCES "teams" ("id");

ALTER TABLE "matches_referees" ADD CONSTRAINT "fk_matches_referees_match_id" FOREIGN KEY("match_id")
REFERENCES "matches" ("id");

ALTER TABLE "matches_referees" ADD CONSTRAINT "fk_matches_referees_referee_id" FOREIGN KEY("referee_id")
REFERENCES "referees" ("id");

INSERT INTO referees (fname, lname)
VALUES
    ('Joe', 'Grady'),
    ('Pierluigi', 'Colina')
;

INSERT INTO leagues (name, start_date, end_date)
VALUES
    ('EPL', '2019-09-01', '2020-05-01'),
    ('La Liga', '2019-09-01', '2020-06-01')
;

INSERT INTO teams (name, league_id)
VALUES
    ('Fulham', 1),
    ('Man U', 1),
    ('Real Madrid', 2),
    ('Levante', 2)
;

INSERT INTO matches (team1_id, team2_id)
VALUES
    (1, 2),
    (1, 2),
    (3, 4)
;

INSERT INTO matches_referees(match_id, referee_id)
VALUES
    (1, 2),
    (3, 1)
;
INSERT INTO players (fname, lname, team_id)
VALUES
    ('Tom', 'Brady', 1),
    ('John', 'Brady', 1),
    ('Liz', 'Brady', 1),
    ('Anne', 'Brady', 1),
    ('Sue', 'Brady', 1),
    ('Matt', 'Brady', 1),
    ('John', 'Travolta', 2),
    ('Dwayne', 'Johnson', 3)
;

INSERT INTO goals (match_id, player_id, team_id)
VALUES
    (1, 1, 1),
    (1, 2, 1),
    (1, 7, 2)
;