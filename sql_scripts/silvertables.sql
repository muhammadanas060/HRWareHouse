CREATE TABLE silver.edu_level (
	EducationLevelID INT,
	EducationLevel VARCHAR(1000),
    created_at timestamp
)  

CREATE TABLE silver.employee(
	EmployeeID VARCHAR(1000),
	FirstName VARCHAR(30),
	LastName VARCHAR(30),
	Gender VARCHAR(100),
	Age INT,
	BusinessTravel VARCHAR(70),
	Department VARCHAR(70),
	"DistanceFromHome (KM)" INT,
	State VARCHAR(5),
	Ethnicity VARCHAR(1000),
	Education INT,
	EducationField VARCHAR(50),
	JobRole VARCHAR(1000),
	MaritalStatus VARCHAR(50),
	Salary INT,
	StockOptionLevel INT,
	OverTime VARCHAR(10),
	HireDate DATE,
	Attrition VARCHAR(10),
	YearsAtCompany INT,
	YearsInMostRecentRole INT,
	YearsSinceLastPromotion INT,
	YearsWithCurrManager INT,
    created_at timestamp
) 

CREATE TABLE IF NOT EXISTS silver.Performance_Rating(
	PerformanceID VARCHAR(1000),
	EmployeeID VARCHAR(1000),
	ReviewDate DATE,
	EnvironmentSatisfaction INT,
	JobSatisfaction INT,
	RelationshipSatisfaction INT,
	TrainingOpportunitiesWithinYear INT,
	TrainingOpportunitiesTaken INT,
	WorkLifeBalance INT,
	SelfRating INT,
	ManagerRating INT,
    created_at timestamp
)

CREATE TABLE IF NOT EXISTS silver.rating_level(
	RatingID INT,
	RatingLevel VARCHAR(1000),
    created_at timestamp

)

CREATE TABLE IF NOT EXISTS silver.satisfied_level(
	SatisfactionID INT,
	SatisfactionLevel VARCHAR(1000),
    created_at timestamp

)

# --------------------------------- Log Table
CREATE TABLE silver.load_logs (
    table_name TEXT,
    rows_loaded INT,
    load_time TIMESTAMP,
    status TEXT,
    duration INTERVAL
);
