CREATE DATABASE YogaCenter

CREATE TABLE Account(
ID_Account int IDENTITY(1,1) PRIMARY KEY,
Email varchar(50),
Name Nvarchar(50),
CCCD varchar(20),
Account varchar(50),
Password varchar(50),
Phone varchar(10),
Img varchar(max),
Money Decimal(10,3),
CV varchar(max),
Address Nvarchar(100),
Role int check(Role = 0 or Role = 1 or Role = 2 or Role = 3 or Role = 4), --admin:0, staff:1, trainer:2, trainee:3, guest:4
Status int check(Status = 0 or Status = 1) --active:0,unactive:1
)

CREATE TABLE Level(
Level_ID int IDENTITY(1,1) PRIMARY KEY,
Level_Name Nvarchar(50)
)

CREATE TABLE Course(
Course_ID int IDENTITY(1,1) PRIMARY KEY,
Course_Name Nvarchar(100) NOT NULL,
Img varchar(500),
Course_Fee DECIMAL(10,3), 
Start_date date,
Close_date date,
Slot int,
Description Nvarchar(MAX),
Objective Nvarchar(MAX),
Summary Nvarchar(MAX),
ID_Level int FOREIGN KEY REFERENCES Level(Level_ID),
Status int CHECK(Status = 0 or Status = 1) --active:1,unactive:0
)

CREATE TABLE Room(
Room_ID int IDENTITY(1,1) PRIMARY KEY,
Room_Name varchar(10),
Status int CHECK(Status = 0 or Status = 1)
)

CREATE TABLE RoomStatus(
ClassDetail_ID int IDENTITY(1,1) PRIMARY KEY,
Room_ID int FOREIGN KEY REFERENCES Room(Room_ID),
Feedback nvarchar(max),
DateFeedback date,
Status int CHECK(Status = 0 or Status = 1) --0:good,1:not good
)

CREATE TABLE Time(
Time_ID int IDENTITY(1,1) PRIMARY KEY,
Time_Choose Nvarchar(50)
)

CREATE TABLE Class(
Class_ID int IDENTITY(1,1) PRIMARY KEY,
Room_ID int FOREIGN KEY REFERENCES Room(Room_ID),
IDtime int FOREIGN KEY REFERENCES Time(Time_ID),
IDCourse int FOREIGN KEY REFERENCES Course(Course_ID),
Choice int CHECK(Choice = 1 OR Choice = 2 OR Choice = 3) --1:2,4,6 2:3,5,7 3:CN
)

CREATE TABLE ClassDate(
ClassDate_ID int IDENTITY(1,1) PRIMARY KEY,
Class_ID int FOREIGN KEY REFERENCES Class(Class_ID),
DateStudy DATE
)

CREATE TABLE ClassDetail(
ID_ClassDetail int IDENTITY(1,1) PRIMARY KEY,
Class_ID int FOREIGN KEY REFERENCES Class(Class_ID),
ID_Account int FOREIGN KEY REFERENCES Account(ID_Account)
)

CREATE TABLE BookingCourse(
OrderID int IDENTITY(1,1) PRIMARY KEY,
ID_Trainee int FOREIGN KEY REFERENCES Account(ID_Account),
DateOrder DATE,
Method int CHECK(Method = 0 or Method = 1) --0:cash,1:onlinebanking
Total DECIMAL(10,3)
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
Status_Account int CHECK(Status_Account = 0 OR Status_Account = 1 OR Status_Account = 2 OR Status_Account = 3 OR Status_Account = 4), --0:cancel, 1:active, 2: refund, 3: pending, 4: finish
Quantity int NOT NULL
)

CREATE TABLE CheckAttendance(
Attendance_ID int IDENTITY(1,1) PRIMARY KEY,
ID_Trainee int FOREIGN KEY REFERENCES Account(ID_Account),
ID_Class int FOREIGN KEY REFERENCES Class(Class_ID),
AttendanceDate date,
Status int check(Status = 0 or Status = 1 or Status = 2) --0:not yet,1:present, 2: absent
)

CREATE TABLE Message(
ID_Message int IDENTITY(1,1) PRIMARY KEY,
ID_sendMessage int FOREIGN KEY REFERENCES Account(ID_Account),
Message nvarchar(max),
Title nvarchar(max),
ID_recieveMessage int FOREIGN KEY REFERENCES Account(ID_Account),
DateCreate DATE,
Status int CHECK(Status = 0 or Status = 1 or Status = 2)--0:default, 1:not yet , 2: read
)

insert into Account(Account,Password,Role,Status) values ('admin','202CB962AC59075B964B07152D234B70',0,0)

insert into Level(Level_Name) values (N'Basic')

insert into Level(Level_Name) values (N'Medium')

insert into Level(Level_Name) values (N'Advance')


insert into Time(Time_Choose) values (N'9h - 11h')

insert into Time(Time_Choose) values (N'13h - 15h')

insert into Time(Time_Choose) values (N'16h - 18h')

insert into Time(Time_Choose) values (N'19h - 21h')

insert into Room(Room_Name, Status) values (N'Room 1', 0)

insert into Room(Room_Name, Status) values (N'Room 2', 0)

insert into Room(Room_Name, Status) values (N'Room 3', 0)

insert into Room(Room_Name, Status) values (N'Room 4', 0)



