create database assignmentprj
go
use assignmentprj
go
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    UserName VARCHAR(255) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    FullName NVARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Role VARCHAR(50),
    Address NVARCHAR(255)
);
go
CREATE TABLE Households (
    HouseholdID INT IDENTITY(1,1) PRIMARY KEY,
    HeadID INT NOT NULL,
    Address VARCHAR(255),
    CreatedAt DATETIME default(getdate()),
    FOREIGN KEY (headID) REFERENCES Users(userID)
);
go
CREATE TABLE Registrations (
    RegisID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    RegisType VARCHAR(255),
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(50),
    ApprovedBy INT NOT NULL,
    Comment TEXT,
    FOREIGN KEY (userID) REFERENCES Users(userID),
    FOREIGN KEY (approvedBy) REFERENCES Users(userID)
);
go
CREATE TABLE Members (
    MemberID INT IDENTITY(1,1) PRIMARY KEY,
    HouseholdID INT NOT NULL,
    UserID INT NOT NULL,
    Relationship VARCHAR(255),
    FOREIGN KEY (householdID) REFERENCES Households(householdID),
    FOREIGN KEY (userID) REFERENCES Users(userID)
);
go
CREATE TABLE Notifications (
    NotiID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    Message VARCHAR(MAX),
    SentDate DATETIME,
    IsRead BIT DEFAULT 0,
    FOREIGN KEY (userID) REFERENCES Users(userID)
);
go
CREATE TABLE Logs (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    Action VARCHAR(MAX),
    Time DATETIME DEFAULT(GETDATE()),
    FOREIGN KEY (userID) REFERENCES Users(userID)
);
go
INSERT INTO Users (UserName, Password, FullName, Email, Role, Address) VALUES
('user1', 'hashed_password_1', N'Nguyễn Văn A', 'user1@example.com', 'user', N'Hà Nội'),
('user2', 'hashed_password_2', N'Trần Thị B', 'user2@example.com', 'admin', N'Hồ Chí Minh'),
('user3', 'hashed_password_3', N'Lê Văn C', 'user3@example.com', 'user', N'Đà Nẵng'),
('user4', 'hashed_password_4', N'Phạm Thị D', 'user4@example.com', 'user', N'Cần Thơ'),
('user5', 'hashed_password_5', N'Hoàng Văn E', 'user5@example.com', 'user', N'Hải Phòng'),
('user6', 'hashed_password_6', N'Đỗ Thị F', 'user6@example.com', 'admin', N'Huế'),
('user7', 'hashed_password_7', N'Vũ Văn G', 'user7@example.com', 'user', N'Nha Trang'),
('user8', 'hashed_password_8', N'Ngô Thị H', 'user8@example.com', 'user', N'Vũng Tàu'),
('user9', 'hashed_password_9', N'Phan Văn I', 'user9@example.com', 'user', N'Hà Giang'),
('user10', 'hashed_password_10', N'Tôn Thị K', 'user10@example.com', 'user', N'Cao Bằng');
go
INSERT INTO Households (HeadID, Address) VALUES
(1, '123 Main St, Hanoi'),
(2, '456 Oak Ave, HCMC'),
(3, '789 Pine Ln, Danang'),
(4, '101 Elm Rd, Cantho'),
(5, '112 Maple Dr, Haiphong'),
(6, '131 Willow Ct, Hue'),
(7, '141 Birch St, Nhatrang'),
(8, '151 Cedar Blvd, Vungtau'),
(9, '161 Spruce Pl, Hagiang'),
(10, '171 Aspen Way, Caobang');
go
INSERT INTO Registrations (UserID, RegisType, StartDate, EndDate, Status, ApprovedBy, Comment) VALUES
(1, 'Type A', '2023-01-01', '2023-01-31', 'Approved', 2, 'Approved by admin'),
(2, 'Type B', '2023-02-01', '2023-02-28', 'Pending', 6, 'Waiting for approval'),
(3, 'Type C', '2023-03-01', '2023-03-31', 'Rejected', 2, 'Rejected due to incomplete info'),
(4, 'Type A', '2023-04-01', '2023-04-30', 'Approved', 6, 'Automatic approval'),
(5, 'Type B', '2023-05-01', '2023-05-31', 'Approved', 2, 'Manual approval'),
(6, 'Type C', '2023-06-01', '2023-06-30', 'Pending', 6, 'New request'),
(7, 'Type A', '2023-07-01', '2023-07-31', 'Approved', 2, 'Verified'),
(8, 'Type B', '2023-08-01', '2023-08-31', 'Rejected', 6, 'Did not meet criteria'),
(9, 'Type C', '2023-09-01', '2023-09-30', 'Approved', 2, 'Followed up'),
(10, 'Type A', '2023-10-01', '2023-10-31', 'Pending', 6, 'Under review');
go
INSERT INTO Members (HouseholdID, UserID, Relationship) VALUES
(1, 1, 'Head'),
(1, 3, 'Child'),
(2, 2, 'Head'),
(2, 4, 'Spouse'),
(3, 3, 'Head'),
(3, 5, 'Child'),
(4, 4, 'Head'),
(4, 6, 'Parent'),
(5, 5, 'Head'),
(5, 7, 'Sibling');
go
INSERT INTO Notifications (UserID, Message, SentDate) VALUES
(1, 'Welcome to our platform!', '2023-11-15'),
(2, 'New registration request', '2023-11-16'),
(3, 'Your registration is approved', '2023-11-17'),
(4, 'Upcoming event reminder', '2023-11-18'),
(5, 'New message received', '2023-11-19'),
(6, 'System maintenance notice', '2023-11-20'),
(7, 'Password reset requested', '2023-11-21'),
(8, 'Account verification needed', '2023-11-22'),
(9, 'Security alert', '2023-11-23'),
(10, 'Feedback request', '2023-11-24');
go
INSERT INTO Logs (UserID, Action) VALUES
(1, 'Login'),
(2, 'Created Registration'),
(3, 'Updated Profile'),
(4, 'Viewed Dashboard'),
(5, 'Downloaded Report'),
(6, 'Approved Registration'),
(7, 'Uploaded Document'),
(8, 'Logged Out'),
(9, 'Searched for Records'),
(10, 'Requested Help');
go