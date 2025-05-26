-- Load all CSVs in database
DO $$
BEGIN
	PERFORM load_data();
END $$; 
