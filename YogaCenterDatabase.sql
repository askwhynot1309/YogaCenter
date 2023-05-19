CREATE DATABASE YogaCenter

CREATE TABLE Accounts(
IDaccount int IDENTITY(1,1) PRIMARY KEY,
Email varchar(50) UNIQUE,
Name Nvarchar(50) NOT NULL,
Phone varchar(10) NOT NULL,
Address Nvarchar(100),
Account varchar(50),
Password varchar(50),
Role int check(Role = 0 or Role = 1 or Role = 2 or Role = 3 or Role = 4), --admin:0, staff:1, trainer:2, trainee:3, contactguest:4
Status int CHECK(Status = 0 or Status = 1) --active:0,unactive:1
)

CREATE TABLE Course(
Course_ID int IDENTITY(1,1) PRIMARY KEY,
Course_Name Nvarchar(100) NOT NULL,
Course_Fee DECIMAL(18,2), 
Start_date date,
Description Nvarchar(MAX),
Status int CHECK(Status = 0 or Status = 1) --active:1,unactive:0
)

CREATE TABLE Class(
Class_ID int IDENTITY(1,1) PRIMARY KEY,
Class_Name varchar(10),
Status int CHECK(Status = 0 or Status = 1)
)

CREATE TABLE Time(
Time_ID int IDENTITY(1,1) PRIMARY KEY,
Time_Choose Nvarchar(50)
)

CREATE TABLE Level(
Level_ID int IDENTITY(1,1) PRIMARY KEY,
Level_Name Nvarchar(50)
)

CREATE TABLE Date(
Date_ID int IDENTITY(1,1) PRIMARY KEY,
Date_Name Nvarchar(50)
)

CREATE TABLE ClassDetail(
ClassDetail_ID int IDENTITY(1,1) PRIMARY KEY,
Class_ID int FOREIGN KEY REFERENCES Class(Class_ID),
IDtime int FOREIGN KEY REFERENCES Time(Time_ID),
IDLevel int FOREIGN KEY REFERENCES Level(Level_ID),
IDDate int FOREIGN KEY REFERENCES Date(Date_ID),
IDCourse int FOREIGN KEY REFERENCES Course(Course_ID),
ID_Trainer int FOREIGN KEY REFERENCES Accounts(IDaccount)
)

CREATE TABLE GroupTrainee(
Group_ID int IDENTITY(1,1) PRIMARY KEY,
ID_ClassDetail int FOREIGN KEY REFERENCES ClassDetail(ClassDetail_ID),
ID_Trainee int FOREIGN KEY REFERENCES Accounts(IDaccount)
)

CREATE TABLE BookingCourse(
OrderID int IDENTITY(1,1) PRIMARY KEY,
ID_Trainee int FOREIGN KEY REFERENCES Accounts(IDaccount),
DateOrder DATE,
Status int CHECK(Status = 0 or Status = 1) --0:cash,1:onlinebanking
)

CREATE TABLE BookingDetail(
BookingDetail_ID int IDENTITY(1,1) PRIMARY KEY,
Order_ID int FOREIGN KEY REFERENCES BookingCourse(OrderID),
ID_Course int FOREIGN KEY REFERENCES Course(Course_ID),
Quantity int NOT NULL
)


