-- PROG 1870 Lab 5

USE Lab5;
GO

--1. Add the following 4 records to our hybrid table:
INSERT INTO JSON_PRODUCT 
	(prodType, prodName, prodInfo)
VALUES 
	('Blu-Ray + DVD', 'Star Wars: The Rise of Skywalker', '{"Actors":		["Carrie Fisher", "Mark Hamill"],
															"Director":		"J.J. Abrams",
															"Release Date": "March 31, 2020",
															"Format":		["NTSC", "Subtitled"]}'),

	('DVD', 'Spider-Man: Homecoming', '{"Actors":		["Tom Holland", "Marisa Tomei", "Robert Downey Jr"],
										"Director":		"John Watts",
										"Release Date": "October 17, 2017",
										"Format":		["DVD-Video", "Subtitled"]}'),

	('Book', 'Demon Slayer: Kimetsu no Yaiba, Vol. 1', '{"Cover":		"Paperback",
														 "Publisher":	"VIZ Media LLC",
														 "ISBN10":		"1974700526",
														 "ISBN13":		"978-1974700523",
														 "Genre":		["Manga", "Fantasy", "Comics"]}'),
  
	('Book', 'Slaughterhouse-Five', '{"Cover":		"Hardcover",
									  "Publisher":	"Dell",
									  "ISBN10":		"0440180295",
									  "ISBN13":		"978-0440180296",
									  "Genre":		["Literature", "War fiction"]}')

--a. For each movie, output its title and release year.
SELECT prodName AS [Movie], JSON_VALUE(prodInfo, '$."Release Date"') AS [Date] 
FROM JSON_PRODUCT
WHERE JSON_VALUE(prodInfo, '$."Release Date"') IS NOT NULL

--b. Show the name, genres, and publishers of books that have ISBN10 values ending with 95.
SELECT prodName AS [Book], JSON_QUERY(prodInfo, '$.Genre') AS [Genre], JSON_VALUE(prodInfo, '$.Publisher') AS [Publisher]
FROM JSON_PRODUCT
WHERE prodType = 'Book' AND JSON_VALUE(prodInfo, '$.ISBN10') LIKE '%95'

--3. Edit the book, Slaughterhouse-Five, so that is has this third genre in its list: Military Historical Fiction
UPDATE JSON_PRODUCT
SET prodInfo = JSON_MODIFY(prodInfo, 'append $.Genre', 'Military History Fiction')
WHERE JSON_VALUE(prodInfo, '$.Genre[0]') = 'Literature'