The script imports HR-related data into a PostgreSQL database under the bronze schema. It uses the COPY command to load data from five CSV files into corresponding tables:
bronze.edu_level: Data imported from EducationLevel.csv.
bronze.employee: Data imported from Employee.csv.
bronze.performance_rating: Data imported from PerformanceRating.csv.
bronze.rating_level: Data imported from RatingLevel.csv.
bronze.satisfied_level: Data imported from SatisfiedLevel.csv.
Each table is loaded with CSV data that includes headers and uses commas as delimiters. After each import, a SELECT * query is used to verify the inserted data.


COPY bronze.edu_level
FROM 'D:/Anas Generations Work/SOFTEX/Hr/EducationalLevel/EducationLevel.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

SELECT * FROM bronze.edu_level;

COPY bronze.employee
FROM 'D:/Anas Generations Work/SOFTEX/Hr/Employee/Employee.csv'
WITH (
 FORMAT csv,
 HEADER true,
 DELIMITER ','
);

SELECT * FROM bronze.employee;

COPY bronze.performance_rating
FROM 'D:/Anas Generations Work/SOFTEX/Hr/PerformanceRating/PerformanceRating.csv'
WITH (
	FORMAT CSV,
	HEADER true,
	DELIMITER ','
);

SELECT * FROM bronze.performance_rating;

COPY bronze.rating_level
FROM 'D:/Anas Generations Work/SOFTEX/Hr/RatingLevel/RatingLevel.csv'
WITH (
	FORMAT CSV,
	HEADER true,
	DELIMITER ','
);

SELECT * FROM bronze.rating_level;

COPY bronze.satisfied_level
FROM 'D:/Anas Generations Work/SOFTEX/Hr/SatisfiedLevel/SatisfiedLevel.csv'
WITH (
	FORMAT CSV,
	HEADER true,
	DELIMITER ','
);

SELECT * FROM bronze.satisfied_level;
