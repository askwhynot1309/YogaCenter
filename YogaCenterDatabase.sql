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
Method int CHECK(Method = 0 or Method = 1 or Method = 2), --0:cash,1:onlinebanking,2:account money
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
Status_Account int CHECK(Status_Account = 0 OR Status_Account = 1 OR Status_Account = 2 OR Status_Account = 3 OR Status_Account = 4), --0:cancel, 1:active, 2: refund, 3: pending, 4:finish
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
Title nvarchar(max),
Message nvarchar(max),
ID_recieveMessage int FOREIGN KEY REFERENCES Account(ID_Account),
DateCreate DATE,
Status int CHECK(Status = 0 or Status = 1 or Status = 2)--0:default, 1:not yet , 2: read
)

insert into Account(Account, Email, Password, Role, Status) values ('admin','admin@gmail.com','202CB962AC59075B964B07152D234B70',0,0)

insert into Account Values 
('nguyencanqn123@gmail.com', N'Minh Nguyên', '111111111111', 'trainer1', '202CB962AC59075B964B07152D234B70', '0775030435', 'images.jpg', 200, '<p>Good trainer</p>
', 'Go Vap District', 2, 0),

('nguyencanqn123@gmail.com', N'Minh Nguyên', '111111111111', 'staff1', '202CB962AC59075B964B07152D234B70', '0775030435', 'images.jpg', 200, '<p>Good trainer</p>
', 'Go Vap District', 1, 0),

('nguyencanqn123@gmail.com', N'Minh Nguyên', '111111111111', 'minhnguyen', '202CB962AC59075B964B07152D234B70', '0775030435', 'images.jpg', 200, '', 'Go Vap District', 3, 0),

('trungco45841@gmail.com', N'Minh Cơ', '222222222222', 'minhco', '202CB962AC59075B964B07152D234B70', '0991547852', 'images.jpg', 200, '', 'Go Vap District', 3, 0),

('cotmatwork@gmail.com', N'Đức Quyền', '333333333333', 'ducquyen', '202CB962AC59075B964B07152D234B70', '0991547852', 'images.jpg', 200, '', 'Go Vap District', 3, 0)

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

insert into Course(Course_Name, Course_Fee, Img, Slot, ID_Level, Start_date, Close_date, Description, Summary, Objective, Status)
Values
('Essential Training Course of the Bowspring Method', 200, 'yoga5.png', 30, 1, '2023-07-30', '2023-07-23', '<p>- The Yoga and Mindfulness for Relaxation and Balance course is designed to provide participants with practical tools and techniques to cultivate relaxation, inner balance, and mindfulness through the integration of yoga and mindfulness practices.&nbsp;<br />
- This course combines gentle yoga postures, breathwork, guided meditations, and mindfulness exercises to help individuals reduce stress, find inner calm, and enhance overall well-being.<br />
- By the end of this course, participants will have a deep understanding of the practices and principles of yoga and mindfulness for relaxation and balance.&nbsp;<br />
- They will have gained practical skills to manage stress, find inner calm, and promote overall well-being in their daily lives.&nbsp;<br />
- Through the integration of yoga and mindfulness practices, participants will be equipped to cultivate relaxation and balance on an ongoing basis, leading to a more peaceful and harmonious existence.</p>
', '<p>The Yoga and Mindfulness for Relaxation and Balance course offers participants a comprehensive exploration of yoga and mindfulness practices specifically aimed at promoting relaxation and balance in everyday life. Through a combination of gentle yoga sequences, deep breathing exercises, guided meditations, and mindfulness techniques, participants will learn to quiet the mind, release tension from the body, and develop a greater sense of inner peace and balance.</p>
','<p>1. Understand the foundations of yoga philosophy and mindfulness and their role in relaxation and balance.<br />
2. Learn and practice gentle yoga postures that promote relaxation, flexibility, and body awareness.<br />
3. Explore various breathing techniques (pranayama) to calm the nervous system and enhance relaxation.<br />
4. Cultivate mindfulness through guided meditations, body scans, and present-moment awareness exercises.<br />
5. Develop techniques to manage stress and anxiety through the integration of yoga and mindfulness practices.<br />
6. Discover strategies for incorporating mindfulness into daily activities for greater balance and presence.<br />
7. Explore the benefits of relaxation and its impact on physical, mental, and emotional well-being.<br />
8. Understand the role of self-care and compassion in nurturing relaxation and balance.<br />
9. Learn techniques for promoting better sleep and rejuvenation through yoga and mindfulness practices.<br />
10. Develop a personalized self-care routine that integrates yoga and mindfulness practices for sustained relaxation and balance.</p>
',1 ),
('The Art of Teaching', 200, 'yoga4.png', 30, 2, '2023-08-10', '2023-08-03', '<p>- The Yoga and Mindfulness for Relaxation and Balance course is designed to provide participants with practical tools and techniques to cultivate relaxation, inner balance, and mindfulness through the integration of yoga and mindfulness practices.&nbsp;<br />
- This course combines gentle yoga postures, breathwork, guided meditations, and mindfulness exercises to help individuals reduce stress, find inner calm, and enhance overall well-being.<br />
- By the end of this course, participants will have a deep understanding of the practices and principles of yoga and mindfulness for relaxation and balance.&nbsp;<br />
- They will have gained practical skills to manage stress, find inner calm, and promote overall well-being in their daily lives.&nbsp;<br />
- Through the integration of yoga and mindfulness practices, participants will be equipped to cultivate relaxation and balance on an ongoing basis, leading to a more peaceful and harmonious existence.</p>
', '<p>The Yoga and Mindfulness for Relaxation and Balance course offers participants a comprehensive exploration of yoga and mindfulness practices specifically aimed at promoting relaxation and balance in everyday life. Through a combination of gentle yoga sequences, deep breathing exercises, guided meditations, and mindfulness techniques, participants will learn to quiet the mind, release tension from the body, and develop a greater sense of inner peace and balance.</p>
', '<p>1. Understand the foundations of yoga philosophy and mindfulness and their role in relaxation and balance.<br />
2. Learn and practice gentle yoga postures that promote relaxation, flexibility, and body awareness.<br />
3. Explore various breathing techniques (pranayama) to calm the nervous system and enhance relaxation.<br />
4. Cultivate mindfulness through guided meditations, body scans, and present-moment awareness exercises.<br />
5. Develop techniques to manage stress and anxiety through the integration of yoga and mindfulness practices.<br />
6. Discover strategies for incorporating mindfulness into daily activities for greater balance and presence.<br />
7. Explore the benefits of relaxation and its impact on physical, mental, and emotional well-being.<br />
8. Understand the role of self-care and compassion in nurturing relaxation and balance.<br />
9. Learn techniques for promoting better sleep and rejuvenation through yoga and mindfulness practices.<br />
10. Develop a personalized self-care routine that integrates yoga and mindfulness practices for sustained relaxation and balance.</p>
', 1),
('Inside Flow Grundausbildung (Deutsch)', 200, 'yoga3.png', 30, 3, '2023-07-30', '2023-07-23', '<p>- The Yoga and Mindfulness for Relaxation and Balance course is designed to provide participants with practical tools and techniques to cultivate relaxation, inner balance, and mindfulness through the integration of yoga and mindfulness practices.&nbsp;<br/>', '<p>The Yoga and Mindfulness for Relaxation and Balance course offers participants a comprehensive exploration of yoga and mindfulness practices specifically aimed at promoting relaxation and balance in everyday life. Through a combination of gentle yoga sequences, deep breathing exercises, guided meditations, and mindfulness techniques, participants will learn to quiet the mind, release tension from the body, and develop a greater sense of inner peace and balance.</p>
', '<p>1. Understand the foundations of yoga philosophy and mindfulness and their role in relaxation and balance.<br />
2. Learn and practice gentle yoga postures that promote relaxation, flexibility, and body awareness.<br />
3. Explore various breathing techniques (pranayama) to calm the nervous system and enhance relaxation.<br />
4. Cultivate mindfulness through guided meditations, body scans, and present-moment awareness exercises.<br />
5. Develop techniques to manage stress and anxiety through the integration of yoga and mindfulness practices.<br />
6. Discover strategies for incorporating mindfulness into daily activities for greater balance and presence.<br />
7. Explore the benefits of relaxation and its impact on physical, mental, and emotional well-being.<br />
8. Understand the role of self-care and compassion in nurturing relaxation and balance.<br />
9. Learn techniques for promoting better sleep and rejuvenation through yoga and mindfulness practices.<br />
10. Develop a personalized self-care routine that integrates yoga and mindfulness practices for sustained relaxation and balance.</p>
',1),
('Inside Flow Fundamentals Teacher Training', 200, 'yoga2.png', 30, 1, '2023-07-30', '2023-07-23', '<p>- The Yoga and Posture Correction for Back Health course is designed to provide participants with a comprehensive understanding of The principles and practices of Yoga and Posture Correction specifically aimed at improving Back health.<br/>', '<p>The Yoga and Posture Correction for Back Health course is a practical and informative program that focuses on addressing common issues related to back pain and poor posture. Participants will learn a variety of yoga poses, stretches, and exercises specifically tailored to strengthen the back muscles, improve spinal alignment, and promote overall spinal health. The course will also cover the importance of proper posture and provide guidance on how to maintain correct alignment throughout daily activities.</p>
', '<p>1. Understand the anatomy of the spine and common causes of back pain.<br />
2. Learn and practice a wide range of yoga poses and exercises that target the back muscles and promote spinal flexibility.<br />
3. Develop an awareness of proper posture and learn techniques to improve and maintain correct alignment.<br />
4. Gain knowledge of common postural deviations and how to correct them through yoga and targeted exercises.<br />
5. Explore breathing techniques that can alleviate back pain and promote relaxation.<br />
6. Understand the principles of body mechanics and ergonomics to prevent back injuries during daily activities.<br />
7. Learn modifications and adaptations for individuals with specific back conditions or limitations.<br />
8. Develop a personalized home practice for ongoing back health maintenance.<br />
9. Enhance overall body awareness and mindfulness through the practice of yoga.<br />
10. Foster a sense of self-care and well-being by incorporating yoga and posture correction into daily routines.</p>
', 1),
('120-Hour Inside Yoga Online Teacher Training (On-Demand & Live)', 200, 'yoga1.png', 30, 2, '2023-07-30', '2023-07-23', '<p>- The Yoga and Posture Correction for Back Health course is designed to provide participants with a comprehensive understanding of The principles and practices of Yoga and Posture Correction specifically aimed at improving Back health.<br />', '<p>The Yoga and Posture Correction for Back Health course is a practical and informative program that focuses on addressing common issues related to back pain and poor posture. Participants will learn a variety of yoga poses, stretches, and exercises specifically tailored to strengthen the back muscles, improve spinal alignment, and promote overall spinal health. The course will also cover the importance of proper posture and provide guidance on how to maintain correct alignment throughout daily activities.</p>
', '<p>1. Understand the anatomy of the spine and common causes of back pain.<br />
2. Learn and practice a wide range of yoga poses and exercises that target the back muscles and promote spinal flexibility.<br />
3. Develop an awareness of proper posture and learn techniques to improve and maintain correct alignment.<br />
4. Gain knowledge of common postural deviations and how to correct them through yoga and targeted exercises.<br />
5. Explore breathing techniques that can alleviate back pain and promote relaxation.<br />
6. Understand the principles of body mechanics and ergonomics to prevent back injuries during daily activities.<br />
7. Learn modifications and adaptations for individuals with specific back conditions or limitations.<br />
8. Develop a personalized home practice for ongoing back health maintenance.<br />
9. Enhance overall body awareness and mindfulness through the practice of yoga.<br />
10. Foster a sense of self-care and well-being by incorporating yoga and posture correction into daily routines.</p>
', 1),
('120-Hour Self-Paced Online Restorative Yoga Teacher Training', 200, 'yoga6.png', 30, 3, '2023-07-30', '2023-07-23', '<p>- The Yoga and Posture Correction for Back Health course is designed to provide participants with a comprehensive understanding of The principles and practices of Yoga and Posture Correction specifically aimed at improving Back health.<br />', '<p>The Yoga and Posture Correction for Back Health course is a practical and informative program that focuses on addressing common issues related to back pain and poor posture. Participants will learn a variety of yoga poses, stretches, and exercises specifically tailored to strengthen the back muscles, improve spinal alignment, and promote overall spinal health. The course will also cover the importance of proper posture and provide guidance on how to maintain correct alignment throughout daily activities.</p>
', '<p>1. Understand the anatomy of the spine and common causes of back pain.<br />
2. Learn and practice a wide range of yoga poses and exercises that target the back muscles and promote spinal flexibility.<br />
3. Develop an awareness of proper posture and learn techniques to improve and maintain correct alignment.<br />
4. Gain knowledge of common postural deviations and how to correct them through yoga and targeted exercises.<br />
5. Explore breathing techniques that can alleviate back pain and promote relaxation.<br />
6. Understand the principles of body mechanics and ergonomics to prevent back injuries during daily activities.<br />
7. Learn modifications and adaptations for individuals with specific back conditions or limitations.<br />
8. Develop a personalized home practice for ongoing back health maintenance.<br />
9. Enhance overall body awareness and mindfulness through the practice of yoga.<br />
10. Foster a sense of self-care and well-being by incorporating yoga and posture correction into daily routines.</p>
', 1),
('120-Hour Self-Paced Restorative Yoga Teacher Training', 200, 'yoga6.png', 30, 1 ,'2023-07-30', '2023-07-23', '<p>- The Yoga Vinyasa for Strength and Flexibility course is designed to help participants build strength, increase flexibility, and enhance overall physical fitness through the practice of Vinyasa yoga.&nbsp;<br />
- This course focuses on dynamic and flowing sequences of yoga poses, synchronized with breath, to develop a balanced combination of strength, flexibility, and mindfulness.<br />
- By the end of this course, participants will have a comprehensive understanding of Vinyasa yoga as a means to build strength, increase flexibility, and improve overall physical fitness.&nbsp;<br />
- They will have the knowledge and skills to incorporate Vinyasa yoga into their regular exercise routine, allowing them to experience the transformative benefits of this dynamic practice.&nbsp;<br />
- Whether a beginner or experienced yogi, participants will leave this course with a stronger and more flexible body, along with a deeper connection to their breath and mindfulness.</p>
', '<p>The Yoga Vinyasa for Strength and Flexibility course offers participants a comprehensive exploration of Vinyasa yoga, a dynamic style of yoga that emphasizes fluid movement and breath coordination. Through a series of carefully crafted Vinyasa sequences, participants will develop strength in their muscles, improve flexibility, and cultivate body awareness. The course also incorporates elements of mindfulness, encouraging participants to stay present and focused during their practice.</p>
', '<p>1. Understand the foundations and principles of Vinyasa yoga and its benefits for strength and flexibility.<br />
2. Learn and practice a variety of Vinyasa sequences that target different muscle groups and promote strength development.<br />
3. Explore creative transitions and variations within Vinyasa sequences to challenge and expand flexibility.<br />
4. Develop an understanding of proper alignment and modifications for different body types and abilities.<br />
5. Cultivate breath awareness and learn to synchronize breath with movement during Vinyasa practice.<br />
6. Increase body awareness and mindfulness through the dynamic and flowing nature of Vinyasa yoga.<br />
7. Understand the importance of a balanced approach to strength and flexibility training.<br />
8. Explore techniques to prevent injury and promote safe and effective Vinyasa practice.<br />
9. Learn strategies for incorporating Vinyasa yoga into a regular fitness routine.<br />
10. Develop a personalized Vinyasa practice that supports ongoing strength and flexibility goals.</p>
',1),
('120-Hour Yin Yoga Teacher Training', 200, 'yoga7.png', 30, 2, '2023-07-30', '2023-07-23', '<p>- The Yoga Vinyasa for Strength and Flexibility course is designed to help participants build strength, increase flexibility, and enhance overall physical fitness through the practice of Vinyasa yoga.&nbsp;<br />
- This course focuses on dynamic and flowing sequences of yoga poses, synchronized with breath, to develop a balanced combination of strength, flexibility, and mindfulness.<br />
- By the end of this course, participants will have a comprehensive understanding of Vinyasa yoga as a means to build strength, increase flexibility, and improve overall physical fitness.&nbsp;<br />
- They will have the knowledge and skills to incorporate Vinyasa yoga into their regular exercise routine, allowing them to experience the transformative benefits of this dynamic practice.&nbsp;<br />
- Whether a beginner or experienced yogi, participants will leave this course with a stronger and more flexible body, along with a deeper connection to their breath and mindfulness.</p>
', '<p>The Yoga Vinyasa for Strength and Flexibility course offers participants a comprehensive exploration of Vinyasa yoga, a dynamic style of yoga that emphasizes fluid movement and breath coordination. Through a series of carefully crafted Vinyasa sequences, participants will develop strength in their muscles, improve flexibility, and cultivate body awareness. The course also incorporates elements of mindfulness, encouraging participants to stay present and focused during their practice.</p>
', '<p>1. Understand the foundations and principles of Vinyasa yoga and its benefits for strength and flexibility.<br />
2. Learn and practice a variety of Vinyasa sequences that target different muscle groups and promote strength development.<br />
3. Explore creative transitions and variations within Vinyasa sequences to challenge and expand flexibility.<br />
4. Develop an understanding of proper alignment and modifications for different body types and abilities.<br />
5. Cultivate breath awareness and learn to synchronize breath with movement during Vinyasa practice.<br />
6. Increase body awareness and mindfulness through the dynamic and flowing nature of Vinyasa yoga.<br />
7. Understand the importance of a balanced approach to strength and flexibility training.<br />
8. Explore techniques to prevent injury and promote safe and effective Vinyasa practice.<br />
9. Learn strategies for incorporating Vinyasa yoga into a regular fitness routine.<br />
10. Develop a personalized Vinyasa practice that supports ongoing strength and flexibility goals.</p>
', 1),
('Self-Paced 100-Hour Yoga Teacher Training', 200, 'yoga9.png', 30, 2, '2023-07-30', '2023-07-23', '<p>- The Yoga and Posture Correction for Back Health course is designed to provide participants with a comprehensive understanding of The principles and practices of Yoga and Posture Correction specifically aimed at improving Back health.<br />', '<p>The Yoga and Posture Correction for Back Health course is a practical and informative program that focuses on addressing common issues related to back pain and poor posture. Participants will learn a variety of yoga poses, stretches, and exercises specifically tailored to strengthen the back muscles, improve spinal alignment, and promote overall spinal health. The course will also cover the importance of proper posture and provide guidance on how to maintain correct alignment throughout daily activities.</p>
', '<p>1. Understand the anatomy of the spine and common causes of back pain.<br />
2. Learn and practice a wide range of yoga poses and exercises that target the back muscles and promote spinal flexibility.<br />
3. Develop an awareness of proper posture and learn techniques to improve and maintain correct alignment.<br />
4. Gain knowledge of common postural deviations and how to correct them through yoga and targeted exercises.<br />
5. Explore breathing techniques that can alleviate back pain and promote relaxation.<br />
6. Understand the principles of body mechanics and ergonomics to prevent back injuries during daily activities.<br />
7. Learn modifications and adaptations for individuals with specific back conditions or limitations.<br />
8. Develop a personalized home practice for ongoing back health maintenance.<br />
9. Enhance overall body awareness and mindfulness through the practice of yoga.<br />
10. Foster a sense of self-care and well-being by incorporating yoga and posture correction into daily routines.</p>
', 1)