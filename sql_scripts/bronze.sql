Short Summary of Table Structures in the bronze Schema:
bronze.edu_level
Stores education level information.
Fields: EducationLevelID, EducationLevel.
bronze.employee
Contains detailed employee information including demographics, job details, and employment history.
Key fields: EmployeeID, FirstName, LastName, Gender, Age, Department, Salary, HireDate, Attrition.
bronze.Performance_Rating
Records employee performance review data.
Key fields: PerformanceID, EmployeeID, ReviewDate, various satisfaction and rating scores.
bronze.rating_level
Defines levels for performance ratings.
Fields: RatingID, RatingLevel.
bronze.satisfied_level
Defines levels for satisfaction scores.
Fields: SatisfactionID, SatisfactionLevel.
These tables collectively support HR analytics by capturing employee data, education background, performance evaluations, and associated rating levels.



CREATE TABLE bronze.edu_level (
	EducationLevelID INT,
	EducationLevel VARCHAR(100)

)  

CREATE TABLE IF NOT EXISTS bronze.employee(
	EmployeeID VARCHAR(100),
	FirstName VARCHAR(30),
	LastName VARCHAR(30),
	Gender VARCHAR(12),
	Age INT,
	BusinessTravel VARCHAR(70),
	Department VARCHAR(70),
	"DistanceFromHome (KM)" INT,
	State VARCHAR(5),
	Ethnicity VARCHAR(100),
	Education INT,
	EducationField VARCHAR(50),
	JobRole VARCHAR(100),
	MaritalStatus VARCHAR(50),
	Salary INT,
	StockOptionLevel INT,
	OverTime VARCHAR(10),
	HireDate DATE,
	Attrition VARCHAR(10),
	YearsAtCompany INT,
	YearsInMostRecentRole INT,
	YearsSinceLastPromotion INT,
	YearsWithCurrManager INT
) 

CREATE TABLE IF NOT EXISTS bronze.Performance_Rating(
	PerformanceID VARCHAR(100),
	EmployeeID VARCHAR(100),
	ReviewDate DATE,
	EnvironmentSatisfaction INT,
	JobSatisfaction INT,
	RelationshipSatisfaction INT,
	TrainingOpportunitiesWithinYear INT,
	TrainingOpportunitiesTaken INT,
	WorkLifeBalance INT,
	SelfRating INT,
	ManagerRating INT
)

CREATE TABLE IF NOT EXISTS bronze.rating_level(
	RatingID INT,
	RatingLevel VARCHAR(100)

)

CREATE TABLE IF NOT EXISTS bronze.satisfied_level(
	SatisfactionID INT,
	SatisfactionLevel VARCHAR(100)

)

# --------------------------------- Log Table
CREATE TABLE bronze.load_logs (
    table_name TEXT,
    rows_loaded INT,
    load_time TIMESTAMP,
    status TEXT,
    duration INTERVAL
);
