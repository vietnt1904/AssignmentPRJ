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
    Role VARCHAR(20) NOT NULL CONSTRAINT CK_Users_Role CHECK (Role IN ('Citizen', 'AreaLeader', 'Police')),
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
('citizen', '784989032', N'Nguyễn Văn A', 'user1@example.com', 'Citizen', N'Hà Nội'),
('arealeader', '1533589462', N'Trần Thị B', 'user2@example.com', 'Arealeader', N'Hồ Chí Minh'),
('police', '-982670050', N'Lê Văn C', 'user3@example.com', 'Police', N'Đà Nẵng');
-- User 1: Citizen
INSERT INTO Users (UserName, Password, FullName, Email, Role, Address)
VALUES ('citizen1', 'password123', N'Nguyễn Văn A', 'citizen1@example.com', 'Citizen', N'123 Đường ABC, Quận 1, TP.HCM');

-- User 2: AreaLeader
INSERT INTO Users (UserName, Password, FullName, Email, Role, Address)
VALUES ('arealeader1', 'securepass', N'Trần Thị B', 'arealeader1@example.com', 'AreaLeader', N'456 Đường XYZ, Quận 2, TP.HCM');

-- User 3: Police
INSERT INTO Users (UserName, Password, FullName, Email, Role, Address)
VALUES ('police1', 'policesecure', N'Lê Văn C', 'police1@example.com', 'Police', N'789 Đường MNO, Quận 3, TP.HCM');

-- User 4: Citizen
INSERT INTO Users (UserName, Password, FullName, Email, Role, Address)
VALUES ('citizen2', 'pass456', N'Phạm Thị D', 'citizen2@example.com', 'Citizen', N'101 Đường PQR, Quận 4, TP.HCM');

-- User 5: AreaLeader
INSERT INTO Users (UserName, Password, FullName, Email, Role, Address)
VALUES ('arealeader2', 'strongpass', N'Hoàng Văn E', 'arealeader2@example.com', 'AreaLeader', N'112 Đường STU, Quận 5, TP.HCM');

-- User 6: Police
INSERT INTO Users (UserName, Password, FullName, Email, Role, Address)
VALUES ('police2', 'supersecure', N'Vũ Thị F', 'police2@example.com', 'Police', N'123 Đường VWX, Quận 6, TP.HCM');

-- User 7: Citizen
INSERT INTO Users (UserName, Password, FullName, Email, Role, Address)
VALUES ('citizen3', 'password789', N'Đặng Văn G', 'citizen3@example.com', 'Citizen', N'134 Đường YZA, Quận 7, TP.HCM');

-- User 8: AreaLeader
INSERT INTO Users (UserName, Password, FullName, Email, Role, Address)
VALUES ('arealeader3', 'verysecure', N'Mai Thị H', 'arealeader3@example.com', 'AreaLeader', N'145 Đường BCD, Quận 8, TP.HCM');

-- User 9: Police
INSERT INTO Users (UserName, Password, FullName, Email, Role, Address)
VALUES ('police3', 'ultrasecure', N'Cao Văn I', 'police3@example.com', 'Police', N'156 Đường EFG, Quận 9, TP.HCM');

-- User 10: Citizen
INSERT INTO Users (UserName, Password, FullName, Email, Role, Address)
VALUES ('citizen4', 'pass1011', N'Trịnh Thị K', 'citizen4@example.com', 'Citizen', N'167 Đường HIJ, Quận 10, TP.HCM');
go
INSERT INTO Households (HeadID, Address) VALUES
(1, '123 Main St, Hanoi');
go
INSERT INTO Registrations (UserID, RegisType, StartDate, EndDate, Status, ApprovedBy, Comment) VALUES
(1, 'Type A', '2023-01-01', '2023-01-31', 'Approved', 1, 'Approved by admin');
go
INSERT INTO Members (HouseholdID, UserID, Relationship) VALUES
(1, 1, 'Head'),
(1, 3, 'Child'),
(1, 4, 'Spouse'),
(1, 6, 'Parent'),
(1, 7, 'Sibling');
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