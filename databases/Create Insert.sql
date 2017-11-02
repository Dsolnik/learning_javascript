USE sakila;

CREATE TABLE ActorSample(
	actor_id smallint(5) unsigned NOT NULL AUTO_INCREMENT,
    first_name varchar(45) NOT NULL,
    last_name varchar(45) NULL,
    last_update timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP 
		ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY(actor_id)
);

INSERT INTO sakila.ActorSample(first_name,last_name,last_update)
VALUES ('Pinal','Dave','2013-04-15');

SELECT * 
FROM ActorSample;

INSERT INTO sakila.ActorSample
VALUES (DEFAULT, 'Nupur', 'Dave', '2013-04-16');

SELECT * 
FROM ActorSample;

INSERT INTO sakila.ActorSample(first_name, last_name)
VALUES ('Pinal','Dave');

SELECT * 
FROM ActorSample;

INSERT INTO sakila.ActorSample(first_name)
VALUES('PINAL');

SELECT * 
FROM ActorSample;

INSERT INTO sakila.ActorSample(last_name)
VALUES('PINAL');

INSERT INTO sakila.ActorSample (first_name, last_name, last_update)
VALUES ('Pinal', NULL, DEFAULT);

SELECT *
FROM ActorSample;

INSERT INTO sakila.ActorSample (first_name, last_name, last_update)
VALUES 	('a','b',DEFAULT),
		('c','d',DEFAULT),
		('e','f',DEFAULT);
        
SELECT *
FROM ActorSample;

INSERT INTO sakila.ActorSample(first_name, last_name, last_update)
SELECT first_name, last_name, last_update
FROM actor
WHERE first_name = 'Nick';

SELECT *
FROM ActorSample;

DROP TABLE ActorSample;