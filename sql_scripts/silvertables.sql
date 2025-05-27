DROP TABLE silver.edu_level;
CREATE TABLE silver.edu_level(
    EducationLevelID INT PRIMARY KEY,
    EducationLevel VARCHAR(100) NOT NULL,
	created_at timestamp
)
DROP TABLE silver.rating_level;
CREATE TABLE silver.rating_level (
    RatingID INT PRIMARY KEY,
    RatingLevel VARCHAR(100) NOT NULL,
	created_at timestamp
);
DROP TABLE silver.satisfied_level;
CREATE TABLE silver.satisfied_level (
    SatisfactionID INT PRIMARY KEY,
    SatisfactionLevel VARCHAR(100) NOT NULL,
	created_at timestamp
);
DROP TABLE silver.Employee;
CREATE TABLE silver.Employee (
    EmployeeID VARCHAR(20) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    BusinessTravel VARCHAR(50),
    Department VARCHAR(50),
    DistanceFromHome_KM INT,
    State VARCHAR(20),
    Ethnicity VARCHAR(50),
    Education INT,
    EducationField VARCHAR(50),
    JobRole VARCHAR(50),
    MaritalStatus VARCHAR(20),
    Salary INT,
    StockOptionLevel INT,
    OverTime VARCHAR(5),
    HireDate DATE,
    Attrition VARCHAR(5),
    YearsAtCompany INT,
    YearsInMostRecentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT,
	created_at timestamp,
    FOREIGN KEY (Education) REFERENCES silver.edu_level(EducationLevelID)
);
DROP TABLE silver.performance_rating;
CREATE TABLE silver.performance_rating (
    PerformanceID VARCHAR(10) PRIMARY KEY,
    EmployeeID VARCHAR(20),
    ReviewDate DATE,
    EnvironmentSatisfaction INT,
    JobSatisfaction INT,
    RelationshipSatisfaction INT,
    TrainingOpportunitiesWithinYear INT,
    TrainingOpportunitiesTaken INT,
    WorkLifeBalance INT,
    SelfRating INT,
    ManagerRating INT,
	created_at timestamp,
    
    FOREIGN KEY (EmployeeID) REFERENCES silver.Employee(EmployeeID),
    FOREIGN KEY (EnvironmentSatisfaction) REFERENCES silver.satisfied_level(SatisfactionID),
    FOREIGN KEY (JobSatisfaction) REFERENCES silver.satisfied_level(SatisfactionID),
    FOREIGN KEY (RelationshipSatisfaction) REFERENCES silver.satisfied_level(SatisfactionID),
    FOREIGN KEY (SelfRating) REFERENCES silver.rating_level(RatingID),
    FOREIGN KEY (ManagerRating) REFERENCES silver.rating_level(RatingID)
);
