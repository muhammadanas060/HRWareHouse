ChatGPT said:
📄 Summary of load_data() PostgreSQL Function
This function load_data() is written in PL/pgSQL and is used to truncate and load data into five tables from local CSV files located in D:/Anas Generations Work/SOFTEX/Hr/.

🔁 Function Logic:
It loads data from CSV files into 5 bronze schema tables:

bronze.edu_level

bronze.employee

bronze.performance_rating

bronze.rating_level

bronze.satisfied_level

⚙️ What It Does for Each Table:
For each table, it:

Sets created_at timestamp (for tracking execution time).

Truncates the target table to clear old data.

Uses the COPY command to load data from a corresponding .csv file.

Counts rows inserted (cnt) for validation.

Displays notices in the logs for visibility.

Catches exceptions (like file-not-found) and prints a message if any file is missing.

📁 File-to-Table Mapping:
Table Name	CSV File Path
bronze.edu_level	EducationLevel/EducationLevel.csv
bronze.employee	Employee/Employee.csv
bronze.performance_rating	PerformanceRating/PerformanceRating.csv
bronze.rating_level	RatingLevel/RatingLevel.csv
bronze.satisfied_level	SatisfiedLevel/SatisfiedLevel.csv

🧠 Notes for Future Reference:
All operations are wrapped in BEGIN ... EXCEPTION blocks to handle errors gracefully per file.

RAISE NOTICE is used for logging progress and debugging.

This is ideal for batch loading reference data into a staging (bronze) area of a data warehouse or ETL pipeline.

-------------xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx------------

CREATE OR REPLACE FUNCTION load_data()
RETURNS VOID AS $$ 

DECLARE 
	created_at time;
	cnt INT;

BEGIN
	BEGIN
		created_at := clock_timestamp();
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
	END;
	
	
	
	BEGIN
		created_at := clock_timestamp();
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
	
	END;
	
		
	BEGIN
		created_at := clock_timestamp();
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
	
	END;
	
		
	BEGIN
		created_at := clock_timestamp();
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
	
	END;
		
	
	BEGIN
		created_at := clock_timestamp();
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
	END;
END;
$$ LANGUAGE plpgsql;
