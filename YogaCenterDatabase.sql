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
Slot int,
Description Nvarchar(MAX),
Objective Nvarchar(MAX),
Summary Nvarchar(MAX),
ID_Level int FOREIGN KEY REFERENCES Level(Level_ID),
Status int CHECK(Status = 0 or Status = 1) --active:1,unactive:0
)

CREATE TABLE Class(
Class_ID int IDENTITY(1,1) PRIMARY KEY,
Class_Name varchar(10),
Status int CHECK(Status = 0 or Status = 1)
)

CREATE TABLE ClassStatus(
ClassDetail_ID int IDENTITY(1,1) PRIMARY KEY,
Class_ID int FOREIGN KEY REFERENCES Class(Class_ID),
Feedback nvarchar(max),
DateFeedback date,
Status int CHECK(Status = 0 or Status = 1) --0:good,1:not good
)

CREATE TABLE Time(
Time_ID int IDENTITY(1,1) PRIMARY KEY,
Time_Choose Nvarchar(50)
)


CREATE TABLE ClassDetail(
ClassDetail_ID int IDENTITY(1,1) PRIMARY KEY,
Class_ID int FOREIGN KEY REFERENCES Class(Class_ID),
IDtime int FOREIGN KEY REFERENCES Time(Time_ID),
DateStudy DATE,
IDAccount int FOREIGN KEY REFERENCES Account(ID_Account),
IDCourse int FOREIGN KEY REFERENCES Course(Course_ID),
Choice int CHECK(Choice = 1 OR Choice = 2 OR Choice = 3) --1:2,4,6 2:3,5,7 3:CN
)

CREATE TABLE BookingCourse(
OrderID int IDENTITY(1,1) PRIMARY KEY,
ID_Trainee int FOREIGN KEY REFERENCES Account(ID_Account),
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
ID_Trainee int FOREIGN KEY REFERENCES Account(ID_Account),
ID_Course int FOREIGN KEY REFERENCES Course(Course_ID),
AttendanceDate date,
Status int check(Status = 0 or Status = 1) --0:absent,1:present
)

CREATE TABLE Message(
ID_Message int IDENTITY(1,1) PRIMARY KEY,
ID_sendMessage int FOREIGN KEY REFERENCES Account(ID_Account),
Message nvarchar(max),
ID_recieveMessage int FOREIGN KEY REFERENCES Account(ID_Account),
Status int CHECK(Status = 0 or Status = 1 or Status = 2)--0:default, 1:not yet , 2: read
)

insert into Account(Account,Password,Role,Status) values ('admin','202CB962AC59075B964B07152D234B70',0,0)
insert into Account(Account,Password,Role,Status) values ('staff','202CB962AC59075B964B07152D234B70',1,0)
insert into Account(Account,Password,Role,Status) values ('trainer','202CB962AC59075B964B07152D234B70',2,0)
insert into Account(Account,Password,Role,Status) values ('trainee','202CB962AC59075B964B07152D234B70',3,0)

insert into Level(Level_Name) values (N'Cơ bản')

insert into Level(Level_Name) values (N'Trung bình')

insert into Level(Level_Name) values (N'Nâng cao')

insert into Level(Level_Name) values (N'Chuyên nghiệp')

insert into Time(Time_Choose) values (N'9h - 11h')

insert into Time(Time_Choose) values (N'13h - 15h')

insert into Time(Time_Choose) values (N'16h - 18h')

insert into Time(Time_Choose) values (N'19h - 21h')

insert into Class(Class_Name, Status) values (N'Room 1', 0)

insert into Class(Class_Name, Status) values (N'Room 2', 0)

insert into Class(Class_Name, Status) values (N'Room 3', 0)

insert into Class(Class_Name, Status) values (N'Room 4', 0)

insert into Course(Course_Name, Course_Fee, ID_Level, Img, Slot, Start_date, Description, Summary, Objective, Status)
values ('Yoga and Posture Correction for Back Health',200.000,1,'',30,'2023-06-22', '<ul>
	<li>Thời lượng: 10&nbsp;tuần (3&nbsp;buổi mỗi tuần)</li>
	<li>Định dạng: Kh&oacute;a học trực tuyến</li>
	<li>Giảng vi&ecirc;n: Một huấn luyện vi&ecirc;n Yoga chuy&ecirc;n nghiệp v&agrave; một chuy&ecirc;n gia về chăm s&oacute;c lưng</li>
	<li>Ng&ocirc;n ngữ: Kho&aacute; học được giảng dạy bằng tiếng Anh (hoặc ng&ocirc;n ngữ địa phương t&ugrave;y thuộc v&agrave;o địa điểm tổ chức)</li>
	<li>Độ tuổi: Mở cho tất cả c&aacute;c độ tuổi v&agrave; tr&igrave;nh độ</li>
</ul>
','<p>Kho&aacute; học &quot;Yoga v&agrave; Điều chỉnh Tư thế cho Sức khỏe lưng&quot; k&eacute;o d&agrave;i 4 tuần v&agrave; mở cho mọi đối tượng. Với sự hướng dẫn của một giảng vi&ecirc;n Yoga chuy&ecirc;n nghiệp v&agrave; một chuy&ecirc;n gia về chăm s&oacute;c lưng, bạn sẽ hiểu v&agrave; chăm s&oacute;c lưng một c&aacute;ch ch&iacute;nh x&aacute;c, tập trung v&agrave;o c&aacute;c tư thế v&agrave; cải thiện sức khỏe lưng tổng thể.</p>
','<ol>
	<li>
	<p>Hiểu v&agrave; chăm s&oacute;c lưng: Kho&aacute; học tập trung v&agrave;o lưng v&agrave; gi&uacute;p bạn hiểu r&otilde; hơn về cấu tr&uacute;c lưng, c&aacute;c vấn đề thường gặp v&agrave; c&aacute;ch chăm s&oacute;c lưng một c&aacute;ch ch&iacute;nh x&aacute;c. Bạn sẽ học c&aacute;ch điều chỉnh tư thế Yoga sao cho ph&ugrave; hợp với lưng, tạo ra sự c&acirc;n bằng v&agrave; sự uốn cong tự nhi&ecirc;n, từ đ&oacute; giảm thiểu c&aacute;c vấn đề lưng v&agrave; tăng cường sức khỏe lưng.</p>
	</li>
	<li>
	<p>Tập trung v&agrave;o tư thế lưng: Kho&aacute; học sẽ gi&uacute;p bạn nắm vững c&aacute;c tư thế Yoga chuy&ecirc;n biệt cho sự mở rộng v&agrave; điều chỉnh lưng. Bạn sẽ học c&aacute;ch thực hiện c&aacute;c tư thế như tư thế con m&egrave;o, tư thế n&acirc;ng ngực v&agrave; tư thế chữ A ngược, từ đ&oacute; tạo ra sự gi&atilde;n nở v&agrave; tăng cường sự linh hoạt của lưng.</p>
	</li>
	<li>
	<p>Cải thiện sức khỏe lưng: Kho&aacute; học sẽ tập trung v&agrave;o cải thiện sức khỏe lưng tổng thể. Bạn sẽ học c&aacute;ch tăng cường cơ bắp lưng, cải thiện sự linh hoạt v&agrave; độ mạnh của lưng. Đồng thời, bạn sẽ được hướng dẫn về c&aacute;c kỹ thuật thở v&agrave; kỹ thuật tập trung t&acirc;m tr&iacute; để giảm căng thẳng v&agrave; thư gi&atilde;n trong v&ugrave;ng lưng.</p>
	</li>
</ol>
',0)

insert into Course(Course_Name, Course_Fee, ID_Level, Img, Slot, Start_date, Description, Summary, Objective, Status)
values ('Yoga and Meditation Practices for Balance and Harmony',200.000,1,'',30,'2023-06-22', '<ul>
	<li>Thời lượng: 10&nbsp;tuần (3&nbsp;buổi mỗi tuần)</li>
	<li>Định dạng: Kh&oacute;a học trực tuyến</li>
	<li>Giảng vi&ecirc;n: Một huấn luyện vi&ecirc;n Yoga chuy&ecirc;n nghiệp v&agrave; một chuy&ecirc;n gia về chăm s&oacute;c lưng</li>
	<li>Ng&ocirc;n ngữ: Kho&aacute; học được giảng dạy bằng tiếng Anh (hoặc ng&ocirc;n ngữ địa phương t&ugrave;y thuộc v&agrave;o địa điểm tổ chức)</li>
	<li>Độ tuổi: Mở cho tất cả c&aacute;c độ tuổi v&agrave; tr&igrave;nh độ</li>
</ul>
','<p>Kho&aacute; học &quot;Yoga v&agrave; Điều chỉnh Tư thế cho Sức khỏe lưng&quot; k&eacute;o d&agrave;i 4 tuần v&agrave; mở cho mọi đối tượng. Với sự hướng dẫn của một giảng vi&ecirc;n Yoga chuy&ecirc;n nghiệp v&agrave; một chuy&ecirc;n gia về chăm s&oacute;c lưng, bạn sẽ hiểu v&agrave; chăm s&oacute;c lưng một c&aacute;ch ch&iacute;nh x&aacute;c, tập trung v&agrave;o c&aacute;c tư thế v&agrave; cải thiện sức khỏe lưng tổng thể.</p>
','<ol>
	<li>
	<p>Hiểu v&agrave; chăm s&oacute;c lưng: Kho&aacute; học tập trung v&agrave;o lưng v&agrave; gi&uacute;p bạn hiểu r&otilde; hơn về cấu tr&uacute;c lưng, c&aacute;c vấn đề thường gặp v&agrave; c&aacute;ch chăm s&oacute;c lưng một c&aacute;ch ch&iacute;nh x&aacute;c. Bạn sẽ học c&aacute;ch điều chỉnh tư thế Yoga sao cho ph&ugrave; hợp với lưng, tạo ra sự c&acirc;n bằng v&agrave; sự uốn cong tự nhi&ecirc;n, từ đ&oacute; giảm thiểu c&aacute;c vấn đề lưng v&agrave; tăng cường sức khỏe lưng.</p>
	</li>
	<li>
	<p>Tập trung v&agrave;o tư thế lưng: Kho&aacute; học sẽ gi&uacute;p bạn nắm vững c&aacute;c tư thế Yoga chuy&ecirc;n biệt cho sự mở rộng v&agrave; điều chỉnh lưng. Bạn sẽ học c&aacute;ch thực hiện c&aacute;c tư thế như tư thế con m&egrave;o, tư thế n&acirc;ng ngực v&agrave; tư thế chữ A ngược, từ đ&oacute; tạo ra sự gi&atilde;n nở v&agrave; tăng cường sự linh hoạt của lưng.</p>
	</li>
	<li>
	<p>Cải thiện sức khỏe lưng: Kho&aacute; học sẽ tập trung v&agrave;o cải thiện sức khỏe lưng tổng thể. Bạn sẽ học c&aacute;ch tăng cường cơ bắp lưng, cải thiện sự linh hoạt v&agrave; độ mạnh của lưng. Đồng thời, bạn sẽ được hướng dẫn về c&aacute;c kỹ thuật thở v&agrave; kỹ thuật tập trung t&acirc;m tr&iacute; để giảm căng thẳng v&agrave; thư gi&atilde;n trong v&ugrave;ng lưng.</p>
	</li>
</ol>
',0)

insert into Course(Course_Name, Course_Fee, ID_Level, Img, Slot, Start_date, Description, Summary, Objective, Status)
values ('Yoga and Mindfulness for Relaxation and Balance',200.000,2,'',30,'2023-06-22', '<ul>
	<li>Thời lượng: 10&nbsp;tuần (3&nbsp;buổi mỗi tuần)</li>
	<li>Định dạng: Kh&oacute;a học trực tuyến</li>
	<li>Giảng vi&ecirc;n: Một huấn luyện vi&ecirc;n Yoga chuy&ecirc;n nghiệp v&agrave; một chuy&ecirc;n gia về chăm s&oacute;c lưng</li>
	<li>Ng&ocirc;n ngữ: Kho&aacute; học được giảng dạy bằng tiếng Anh (hoặc ng&ocirc;n ngữ địa phương t&ugrave;y thuộc v&agrave;o địa điểm tổ chức)</li>
	<li>Độ tuổi: Mở cho tất cả c&aacute;c độ tuổi v&agrave; tr&igrave;nh độ</li>
</ul>
','<p>Kho&aacute; học &quot;Yoga v&agrave; Điều chỉnh Tư thế cho Sức khỏe lưng&quot; k&eacute;o d&agrave;i 4 tuần v&agrave; mở cho mọi đối tượng. Với sự hướng dẫn của một giảng vi&ecirc;n Yoga chuy&ecirc;n nghiệp v&agrave; một chuy&ecirc;n gia về chăm s&oacute;c lưng, bạn sẽ hiểu v&agrave; chăm s&oacute;c lưng một c&aacute;ch ch&iacute;nh x&aacute;c, tập trung v&agrave;o c&aacute;c tư thế v&agrave; cải thiện sức khỏe lưng tổng thể.</p>
','<ol>
	<li>
	<p>Hiểu v&agrave; chăm s&oacute;c lưng: Kho&aacute; học tập trung v&agrave;o lưng v&agrave; gi&uacute;p bạn hiểu r&otilde; hơn về cấu tr&uacute;c lưng, c&aacute;c vấn đề thường gặp v&agrave; c&aacute;ch chăm s&oacute;c lưng một c&aacute;ch ch&iacute;nh x&aacute;c. Bạn sẽ học c&aacute;ch điều chỉnh tư thế Yoga sao cho ph&ugrave; hợp với lưng, tạo ra sự c&acirc;n bằng v&agrave; sự uốn cong tự nhi&ecirc;n, từ đ&oacute; giảm thiểu c&aacute;c vấn đề lưng v&agrave; tăng cường sức khỏe lưng.</p>
	</li>
	<li>
	<p>Tập trung v&agrave;o tư thế lưng: Kho&aacute; học sẽ gi&uacute;p bạn nắm vững c&aacute;c tư thế Yoga chuy&ecirc;n biệt cho sự mở rộng v&agrave; điều chỉnh lưng. Bạn sẽ học c&aacute;ch thực hiện c&aacute;c tư thế như tư thế con m&egrave;o, tư thế n&acirc;ng ngực v&agrave; tư thế chữ A ngược, từ đ&oacute; tạo ra sự gi&atilde;n nở v&agrave; tăng cường sự linh hoạt của lưng.</p>
	</li>
	<li>
	<p>Cải thiện sức khỏe lưng: Kho&aacute; học sẽ tập trung v&agrave;o cải thiện sức khỏe lưng tổng thể. Bạn sẽ học c&aacute;ch tăng cường cơ bắp lưng, cải thiện sự linh hoạt v&agrave; độ mạnh của lưng. Đồng thời, bạn sẽ được hướng dẫn về c&aacute;c kỹ thuật thở v&agrave; kỹ thuật tập trung t&acirc;m tr&iacute; để giảm căng thẳng v&agrave; thư gi&atilde;n trong v&ugrave;ng lưng.</p>
	</li>
</ol>
',0)

insert into Course(Course_Name, Course_Fee, ID_Level, Img, Slot, Start_date, Description, Summary, Objective, Status)
values ('Yoga Vinyasa Flow and Strengthening',200.000,2,'',30,'2023-06-22', '<ul>
	<li>Thời lượng: 10&nbsp;tuần (3&nbsp;buổi mỗi tuần)</li>
	<li>Định dạng: Kh&oacute;a học trực tuyến</li>
	<li>Giảng vi&ecirc;n: Một huấn luyện vi&ecirc;n Yoga chuy&ecirc;n nghiệp v&agrave; một chuy&ecirc;n gia về chăm s&oacute;c lưng</li>
	<li>Ng&ocirc;n ngữ: Kho&aacute; học được giảng dạy bằng tiếng Anh (hoặc ng&ocirc;n ngữ địa phương t&ugrave;y thuộc v&agrave;o địa điểm tổ chức)</li>
	<li>Độ tuổi: Mở cho tất cả c&aacute;c độ tuổi v&agrave; tr&igrave;nh độ</li>
</ul>
','<p>Kho&aacute; học &quot;Yoga v&agrave; Điều chỉnh Tư thế cho Sức khỏe lưng&quot; k&eacute;o d&agrave;i 4 tuần v&agrave; mở cho mọi đối tượng. Với sự hướng dẫn của một giảng vi&ecirc;n Yoga chuy&ecirc;n nghiệp v&agrave; một chuy&ecirc;n gia về chăm s&oacute;c lưng, bạn sẽ hiểu v&agrave; chăm s&oacute;c lưng một c&aacute;ch ch&iacute;nh x&aacute;c, tập trung v&agrave;o c&aacute;c tư thế v&agrave; cải thiện sức khỏe lưng tổng thể.</p>
','<ol>
	<li>
	<p>Hiểu v&agrave; chăm s&oacute;c lưng: Kho&aacute; học tập trung v&agrave;o lưng v&agrave; gi&uacute;p bạn hiểu r&otilde; hơn về cấu tr&uacute;c lưng, c&aacute;c vấn đề thường gặp v&agrave; c&aacute;ch chăm s&oacute;c lưng một c&aacute;ch ch&iacute;nh x&aacute;c. Bạn sẽ học c&aacute;ch điều chỉnh tư thế Yoga sao cho ph&ugrave; hợp với lưng, tạo ra sự c&acirc;n bằng v&agrave; sự uốn cong tự nhi&ecirc;n, từ đ&oacute; giảm thiểu c&aacute;c vấn đề lưng v&agrave; tăng cường sức khỏe lưng.</p>
	</li>
	<li>
	<p>Tập trung v&agrave;o tư thế lưng: Kho&aacute; học sẽ gi&uacute;p bạn nắm vững c&aacute;c tư thế Yoga chuy&ecirc;n biệt cho sự mở rộng v&agrave; điều chỉnh lưng. Bạn sẽ học c&aacute;ch thực hiện c&aacute;c tư thế như tư thế con m&egrave;o, tư thế n&acirc;ng ngực v&agrave; tư thế chữ A ngược, từ đ&oacute; tạo ra sự gi&atilde;n nở v&agrave; tăng cường sự linh hoạt của lưng.</p>
	</li>
	<li>
	<p>Cải thiện sức khỏe lưng: Kho&aacute; học sẽ tập trung v&agrave;o cải thiện sức khỏe lưng tổng thể. Bạn sẽ học c&aacute;ch tăng cường cơ bắp lưng, cải thiện sự linh hoạt v&agrave; độ mạnh của lưng. Đồng thời, bạn sẽ được hướng dẫn về c&aacute;c kỹ thuật thở v&agrave; kỹ thuật tập trung t&acirc;m tr&iacute; để giảm căng thẳng v&agrave; thư gi&atilde;n trong v&ugrave;ng lưng.</p>
	</li>
</ol>
',0)

insert into Course(Course_Name, Course_Fee, ID_Level, Img, Slot, Start_date, Description, Summary, Objective, Status)
values ('Yoga and Mindfulness for Mindfulness and Tranquility',200.000,3,'',30,'2023-06-22', '<ul>
	<li>Thời lượng: 10&nbsp;tuần (3&nbsp;buổi mỗi tuần)</li>
	<li>Định dạng: Kh&oacute;a học trực tuyến</li>
	<li>Giảng vi&ecirc;n: Một huấn luyện vi&ecirc;n Yoga chuy&ecirc;n nghiệp v&agrave; một chuy&ecirc;n gia về chăm s&oacute;c lưng</li>
	<li>Ng&ocirc;n ngữ: Kho&aacute; học được giảng dạy bằng tiếng Anh (hoặc ng&ocirc;n ngữ địa phương t&ugrave;y thuộc v&agrave;o địa điểm tổ chức)</li>
	<li>Độ tuổi: Mở cho tất cả c&aacute;c độ tuổi v&agrave; tr&igrave;nh độ</li>
</ul>
','<p>Kho&aacute; học &quot;Yoga v&agrave; Điều chỉnh Tư thế cho Sức khỏe lưng&quot; k&eacute;o d&agrave;i 4 tuần v&agrave; mở cho mọi đối tượng. Với sự hướng dẫn của một giảng vi&ecirc;n Yoga chuy&ecirc;n nghiệp v&agrave; một chuy&ecirc;n gia về chăm s&oacute;c lưng, bạn sẽ hiểu v&agrave; chăm s&oacute;c lưng một c&aacute;ch ch&iacute;nh x&aacute;c, tập trung v&agrave;o c&aacute;c tư thế v&agrave; cải thiện sức khỏe lưng tổng thể.</p>
','<ol>
	<li>
	<p>Hiểu v&agrave; chăm s&oacute;c lưng: Kho&aacute; học tập trung v&agrave;o lưng v&agrave; gi&uacute;p bạn hiểu r&otilde; hơn về cấu tr&uacute;c lưng, c&aacute;c vấn đề thường gặp v&agrave; c&aacute;ch chăm s&oacute;c lưng một c&aacute;ch ch&iacute;nh x&aacute;c. Bạn sẽ học c&aacute;ch điều chỉnh tư thế Yoga sao cho ph&ugrave; hợp với lưng, tạo ra sự c&acirc;n bằng v&agrave; sự uốn cong tự nhi&ecirc;n, từ đ&oacute; giảm thiểu c&aacute;c vấn đề lưng v&agrave; tăng cường sức khỏe lưng.</p>
	</li>
	<li>
	<p>Tập trung v&agrave;o tư thế lưng: Kho&aacute; học sẽ gi&uacute;p bạn nắm vững c&aacute;c tư thế Yoga chuy&ecirc;n biệt cho sự mở rộng v&agrave; điều chỉnh lưng. Bạn sẽ học c&aacute;ch thực hiện c&aacute;c tư thế như tư thế con m&egrave;o, tư thế n&acirc;ng ngực v&agrave; tư thế chữ A ngược, từ đ&oacute; tạo ra sự gi&atilde;n nở v&agrave; tăng cường sự linh hoạt của lưng.</p>
	</li>
	<li>
	<p>Cải thiện sức khỏe lưng: Kho&aacute; học sẽ tập trung v&agrave;o cải thiện sức khỏe lưng tổng thể. Bạn sẽ học c&aacute;ch tăng cường cơ bắp lưng, cải thiện sự linh hoạt v&agrave; độ mạnh của lưng. Đồng thời, bạn sẽ được hướng dẫn về c&aacute;c kỹ thuật thở v&agrave; kỹ thuật tập trung t&acirc;m tr&iacute; để giảm căng thẳng v&agrave; thư gi&atilde;n trong v&ugrave;ng lưng.</p>
	</li>
</ol>
',0)

insert into Course(Course_Name, Course_Fee, ID_Level, Img, Slot, Start_date, Description, Summary, Objective, Status)
values ('Yoga Vinyasa for Strength and Flexibility',200.000,3,'',30,'2023-06-22', '<ul>
	<li>Thời lượng: 10&nbsp;tuần (3&nbsp;buổi mỗi tuần)</li>
	<li>Định dạng: Kh&oacute;a học trực tuyến</li>
	<li>Giảng vi&ecirc;n: Một huấn luyện vi&ecirc;n Yoga chuy&ecirc;n nghiệp v&agrave; một chuy&ecirc;n gia về chăm s&oacute;c lưng</li>
	<li>Ng&ocirc;n ngữ: Kho&aacute; học được giảng dạy bằng tiếng Anh (hoặc ng&ocirc;n ngữ địa phương t&ugrave;y thuộc v&agrave;o địa điểm tổ chức)</li>
	<li>Độ tuổi: Mở cho tất cả c&aacute;c độ tuổi v&agrave; tr&igrave;nh độ</li>
</ul>
','<p>Kho&aacute; học &quot;Yoga v&agrave; Điều chỉnh Tư thế cho Sức khỏe lưng&quot; k&eacute;o d&agrave;i 4 tuần v&agrave; mở cho mọi đối tượng. Với sự hướng dẫn của một giảng vi&ecirc;n Yoga chuy&ecirc;n nghiệp v&agrave; một chuy&ecirc;n gia về chăm s&oacute;c lưng, bạn sẽ hiểu v&agrave; chăm s&oacute;c lưng một c&aacute;ch ch&iacute;nh x&aacute;c, tập trung v&agrave;o c&aacute;c tư thế v&agrave; cải thiện sức khỏe lưng tổng thể.</p>
','<ol>
	<li>
	<p>Hiểu v&agrave; chăm s&oacute;c lưng: Kho&aacute; học tập trung v&agrave;o lưng v&agrave; gi&uacute;p bạn hiểu r&otilde; hơn về cấu tr&uacute;c lưng, c&aacute;c vấn đề thường gặp v&agrave; c&aacute;ch chăm s&oacute;c lưng một c&aacute;ch ch&iacute;nh x&aacute;c. Bạn sẽ học c&aacute;ch điều chỉnh tư thế Yoga sao cho ph&ugrave; hợp với lưng, tạo ra sự c&acirc;n bằng v&agrave; sự uốn cong tự nhi&ecirc;n, từ đ&oacute; giảm thiểu c&aacute;c vấn đề lưng v&agrave; tăng cường sức khỏe lưng.</p>
	</li>
	<li>
	<p>Tập trung v&agrave;o tư thế lưng: Kho&aacute; học sẽ gi&uacute;p bạn nắm vững c&aacute;c tư thế Yoga chuy&ecirc;n biệt cho sự mở rộng v&agrave; điều chỉnh lưng. Bạn sẽ học c&aacute;ch thực hiện c&aacute;c tư thế như tư thế con m&egrave;o, tư thế n&acirc;ng ngực v&agrave; tư thế chữ A ngược, từ đ&oacute; tạo ra sự gi&atilde;n nở v&agrave; tăng cường sự linh hoạt của lưng.</p>
	</li>
	<li>
	<p>Cải thiện sức khỏe lưng: Kho&aacute; học sẽ tập trung v&agrave;o cải thiện sức khỏe lưng tổng thể. Bạn sẽ học c&aacute;ch tăng cường cơ bắp lưng, cải thiện sự linh hoạt v&agrave; độ mạnh của lưng. Đồng thời, bạn sẽ được hướng dẫn về c&aacute;c kỹ thuật thở v&agrave; kỹ thuật tập trung t&acirc;m tr&iacute; để giảm căng thẳng v&agrave; thư gi&atilde;n trong v&ugrave;ng lưng.</p>
	</li>
</ol>
',0)