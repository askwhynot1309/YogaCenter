CREATE DATABASE YogaCenter

CREATE TABLE Employee(
ID_Employee int IDENTITY(1,1) PRIMARY KEY,
Name Nvarchar(50),
Account varchar(50),
Password varchar(50),
Phone varchar(10),
Img varchar(max),
Address Nvarchar(100),
Role int check(Role = 0 or Role = 1 or Role = 2), --admin:0, staff:1, trainer:2
Status int check(Status = 0 or Status = 1) --active:0,unactive:1
)

CREATE TABLE Trainee(
ID_Trainee int IDENTITY(1,1) PRIMARY KEY,
Email varchar(50) UNIQUE,
Password varchar(50),
Name Nvarchar(50),
Phone varchar(10),
Img varchar(max),
Address Nvarchar(100),
Status int CHECK(Status = 0 or Status = 1) --active:0,unactive:1
)

CREATE TABLE Level(
Level_ID int IDENTITY(1,1) PRIMARY KEY,
Level_Name Nvarchar(50)
)

CREATE TABLE Course(
Course_ID int IDENTITY(1,1) PRIMARY KEY,
Course_Name Nvarchar(100) NOT NULL,
Course_Fee DECIMAL(18,2), 
Start_date date,
End_date date,
Description Nvarchar(MAX),
ID_Level int FOREIGN KEY REFERENCES Level(Level_ID),
ID_Trainer int FOREIGN KEY REFERENCES Employee(ID_Employee),
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


CREATE TABLE ClassDetail(
ClassDetail_ID int IDENTITY(1,1) PRIMARY KEY,
Class_ID int FOREIGN KEY REFERENCES Class(Class_ID),
IDtime int FOREIGN KEY REFERENCES Time(Time_ID),
DateStart DATE,
IDCourse int FOREIGN KEY REFERENCES Course(Course_ID),
)

CREATE TABLE BookingCourse(
OrderID int IDENTITY(1,1) PRIMARY KEY,
ID_Trainee int FOREIGN KEY REFERENCES Trainee(ID_Trainee),
DateOrder DATE,
Method int CHECK(Method = 0 or Method = 1) --0:cash,1:onlinebanking
)

CREATE TABLE StatusPayment(
ID_Payment int IDENTITY(1,1) PRIMARY KEY,
ID_Order int FOREIGN KEY REFERENCES BookingCourse(OrderID),
Status int check(Status = 1 or Status = 0 or Status = 2) --0:not yet,1:complete,2:cancel
)

CREATE TABLE BookingDetail(
BookingDetail_ID int IDENTITY(1,1) PRIMARY KEY,
Order_ID int FOREIGN KEY REFERENCES BookingCourse(OrderID),
ID_Course int FOREIGN KEY REFERENCES Course(Course_ID),
Quantity int NOT NULL
)

CREATE TABLE CheckAttendance(
Attendance_ID int IDENTITY(1,1) PRIMARY KEY,
ID_Trainee int FOREIGN KEY REFERENCES Trainee(ID_Trainee),
ID_Course int FOREIGN KEY REFERENCES Course(Course_ID),
AttendanceDate date,
Status int check(Status = 0 or Status = 1) --0:absent,1:present
)

insert into Employee(Account,Password,Role,Status) values ('admin','123',0,0)