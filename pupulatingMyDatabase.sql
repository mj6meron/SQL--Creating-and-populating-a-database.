USE nba;

INSERT INTO arenas VALUES('Barclays Center', 'Brooklyn, New York', 19000);
INSERT INTO arenas VALUES('Toyota Center', 'Houston, Texas', 18000);
INSERT INTO arenas VALUES('Scotiabank Arena', 'Toronto, Ontario', 19800);
INSERT INTO arenas VALUES('STAPLES Center', 'Los Angeles, California', 20000);
INSERT INTO arenas VALUES('Chase Center', 'San Francisco, California', 18064);
INSERT INTO arenas VALUES('United Center', 'Chicago, Illinois', 23500);


INSERT INTO teams VALUES('Los Angeles Lakers',	'Pacific',	17,	'Gold',	'STAPLES Center');
INSERT INTO teams VALUES('Toronto Raptors',	'Atlantic',	1,	'Red',	'Scotiabank Arena');
INSERT INTO teams VALUES('Houston Rockets',	'South West',	2,	'Red',	'Toyota Center');
INSERT INTO teams VALUES('Golden State Warriors',	'Pacific',	6,	'Royal Blue',	'Chase Center');
INSERT INTO teams VALUES('Brooklyn Nets',	'Atlantic',	0,	'Black',	'Barclays Center');
INSERT INTO teams VALUES('Chicago Bulls',	'Central',	6,	'Red',	'United Center');

INSERT INTO coaches VALUES(101,	'Nick Nurse',	1967,	1989,	'Toronto Raptors');
INSERT INTO coaches VALUES(102,	'Frank Vogel',	1973,	2001,	'Los Angeles Lakers');
INSERT INTO coaches VALUES(103,	'Billy Donovan',	1965,	1989,	'Chicago Bulls');
INSERT INTO coaches VALUES(104,	'Steve Kerr',	1965,	2014,	'Golden State Warriors');
INSERT INTO coaches VALUES(105,	'Stephen Silas',	1973,	2000,	'Houston Rockets');
INSERT INTO coaches VALUES(106,	'Steve Nash',	1974,	2020,	'Brooklyn Nets');

INSERT INTO players VALUES(43,	'Pascal Siakam',	6.9,	1994,	29000000,	'Toronto Raptors');
INSERT INTO players VALUES(30,	'Stephen Curry',	6.3,	1988,	43006362,	'Golden State Warriors');
INSERT INTO players VALUES(23,	'LeBron James', 	6.9,	1984,	39219565,	'Los Angeles Lakers');
INSERT INTO players VALUES(23,	'Fred VanVleet',	6.1,	1994,	21000000,	'Toronto Raptors');
INSERT INTO players VALUES(7,	'Kyle Lowry',   	6.0,	1986,	30000000,	'Toronto Raptors');
INSERT INTO players VALUES(10,	'Eric Gordon',      6.3,	1988,	16869276,	'Houston Rockets');
INSERT INTO players VALUES(11,	'Klay Thompson',    6.6,	1990,	35361360,	'Golden State Warriors');
INSERT INTO players VALUES(23,	'Anthony Davis',    6.10,	1993,	32742000,	'Los Angeles Lakers');
INSERT INTO players VALUES(17,	'Dennis Schröder',  6.3,	1993,	15500000,	'Los Angeles Lakers');
INSERT INTO players VALUES(22,	'Andrew Wiggins',   6.7,	1995,	29542010,	'Golden State Warriors');
INSERT INTO players VALUES(11,	'Kyrie Irving',    6.10,	1992,	33329100,	'Brooklyn Nets');
INSERT INTO players VALUES(5,	'Victor Oladipo',	6.4,	1992,	21000000,	'Houston Rockets');
INSERT INTO players VALUES(8,	'Zach LaVine',	    6.5,	1995,	19500000,	'Chicago Bulls');
INSERT INTO players VALUES(22,	'Otto Porter',	    6.8,	1993,	28489239,	'Chicago Bulls');
INSERT INTO players VALUES(35,	'Kevin Durant',	   6.10,	1988,	39058950,	'Brooklyn Nets');
INSERT INTO players VALUES(13,	'James Harden', 	6-5,	1989,	40824000,	'Brooklyn Nets');
INSERT INTO players VALUES(1,	'John Wall',	    6.3,	1990,	41254920,	'Houston Rockets');
INSERT INTO players VALUES(21,	'Thaddeus Young',	6.8,	1988,	13545000,	'Chicago Bulls');

SELECT * FROM players;
SELECT * FROM arenas;
SELECT * FROM coaches;
SELECT * FROM teams;

SELECT COUNT(*) FROM teams;

