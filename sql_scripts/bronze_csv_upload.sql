The script imports HR-related data into a PostgreSQL database under the bronze schema. It uses the COPY command to load data from five CSV files into corresponding tables:
bronze.edu_level: Data imported from EducationLevel.csv.
bronze.employee: Data imported from Employee.csv.
bronze.performance_rating: Data imported from PerformanceRating.csv.
bronze.rating_level: Data imported from RatingLevel.csv.
bronze.satisfied_level: Data imported from SatisfiedLevel.csv.
Each table is loaded with CSV data that includes headers and uses commas as delimiters. After each import, a SELECT * query is used to verify the inserted data.


DO $$
DECLARE 
	created_at time := clock_timestamp();
	cnt INT;
BEGIN

	TRUNCATE TABLE bronze.edu_level;
	
	COPY bronze.edu_level
	FROM 'D:/Anas Generations Work/SOFTEX/Hr/EducationalLevel/EducationLevel.csv'
	WITH (
	    FORMAT csv,
	    HEADER true,
	    DELIMITER ','
	);
	
	SELECT COUNT(*) INTO cnt FROM bronze.edu_level;
	RAISE NOTICE '========================================================================';
	RAISE NOTICE 'Loading';
	RAISE NOTICE 'Running Time %',created_at;
	RAISE NOTICE '==================== EducationLevel.csv Loaded =========================';

	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'File not found ';
END $$;


DO $$
DECLARE 
		created_at time = clock_timestamp();
		cnt INT;

BEGIN
	TRUNCATE TABLE bronze.employee;
	
	COPY bronze.employee
	FROM 'D:/Anas Generations Work/SOFTEX/Hr/Employee/Employee.csv'
	WITH (
	 FORMAT csv,
	 HEADER true,
	 DELIMITER ','
	);
	
	SELECT COUNT(*) INTO cnt FROM bronze.employee;
	RAISE NOTICE '========================================================================';
	RAISE NOTICE 'Loading';
	RAISE NOTICE 'Running Time %',created_at;
	RAISE NOTICE '========================= Employee.csv Loaded ==========================';

	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'File not found';

END $$;

DO $$
DECLARE 
	created_at time = clock_timestamp();
	cnt INT;

BEGIN

	TRUNCATE TABLE bronze.performance_rating;
	
	COPY bronze.performance_rating
	FROM 'D:/Anas Generations Work/SOFTEX/Hr/PerformanceRating/PerformanceRating.csv'
	WITH (
		FORMAT CSV,
		HEADER true,
		DELIMITER ','
	);
	
	SELECT COUNT(*) INTO cnt FROM bronze.performance_rating;
	RAISE NOTICE '========================================================================';
	RAISE NOTICE 'Loading';
	RAISE NOTICE 'Running Time %',created_at;
	RAISE NOTICE '===================== PerformanceRating.csv Loaded =====================';

	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'File not found';

END $$;

DO $$
DECLARE 
	created_at time = clock_timestamp();
	cnt INT;

BEGIN
	TRUNCATE TABLE bronze.rating_level;
	
	COPY bronze.rating_level
	FROM 'D:/Anas Generations Work/SOFTEX/Hr/RatingLevel/RatingLevel.csv'
	WITH (
		FORMAT CSV,
		HEADER true,
		DELIMITER ','
	);
	
	SELECT COUNT(*) INTO cnt FROM bronze.rating_level;
	RAISE NOTICE '========================================================================';
	RAISE NOTICE 'Loading';
	RAISE NOTICE 'Running Time %',created_at;
	RAISE NOTICE '======================== RatingLevel.csv Loaded ========================';

	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'File not found';

END $$;
	
DO $$
DECLARE 
	created_at time = clock_timestamp();
	cnt INT;

BEGIN
	TRUNCATE TABLE bronze.satisfied_level;
	COPY bronze.satisfied_level
	FROM 'D:/Anas Generations Work/SOFTEX/Hr/SatisfiedLevel/SatisfiedLevel.csv'
	WITH (
		FORMAT CSV,
		HEADER true,
		DELIMITER ','
	);
	
	SELECT COUNT(*) INTO cnt FROM bronze.satisfied_level;

RAISE NOTICE '========================================================================';
	RAISE NOTICE 'Loading';
	RAISE NOTICE 'Running Time %',created_at;
	RAISE NOTICE '==================== SatisfiedLevel.csv Loaded =====================';

	EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'File not found';

END $$;
