-- =============================================
-- RaceDay Database
-- Section C: SQL Database Script
-- =============================================

USE RaceDay;
GO

-- =============================================
-- 1. USERS TABLE
-- =============================================

CREATE TABLE USERS
(
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Role VARCHAR(20) NOT NULL,
    DateRegistered DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT CK_USERS_Role
        CHECK (Role IN ('Organiser', 'Participant'))
);
GO


-- =============================================
-- 2. ORGANISERS TABLE
-- =============================================

CREATE TABLE ORGANISERS
(
    OrganiserID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    OrganisationName VARCHAR(100) NOT NULL,
    ContactPhone VARCHAR(20) NOT NULL,
    ContactEmail VARCHAR(100) NOT NULL,

    CONSTRAINT FK_ORGANISERS_USERS
        FOREIGN KEY (UserID)
        REFERENCES USERS(UserID),

    CONSTRAINT UQ_ORGANISERS_UserID
        UNIQUE (UserID)
);
GO


-- =============================================
-- 3. PARTICIPANTS TABLE
-- =============================================

CREATE TABLE PARTICIPANTS
(
    ParticipantID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(20) NOT NULL,
    EmergencyContact VARCHAR(100) NOT NULL,
    MedicalConditions VARCHAR(255),

    CONSTRAINT FK_PARTICIPANTS_USERS
        FOREIGN KEY (UserID)
        REFERENCES USERS(UserID),

    CONSTRAINT UQ_PARTICIPANTS_UserID
        UNIQUE (UserID)
);
GO


-- =============================================
-- 4. EVENTS TABLE
-- =============================================

CREATE TABLE EVENTS
(
    EventID INT IDENTITY(1,1) PRIMARY KEY,
    OrganiserID INT NOT NULL,
    EventName VARCHAR(100) NOT NULL,
    EventDescription VARCHAR(500),
    EventDate DATE NOT NULL,
    RegistrationDeadline DATE NOT NULL,
    Location VARCHAR(150) NOT NULL,
    Status VARCHAR(30) NOT NULL,
    MaxParticipants INT NOT NULL,

    CONSTRAINT FK_EVENTS_ORGANISERS
        FOREIGN KEY (OrganiserID)
        REFERENCES ORGANISERS(OrganiserID),

    CONSTRAINT CK_EVENTS_MaxParticipants
        CHECK (MaxParticipants > 0)
);
GO


-- =============================================
-- 5. CATEGORIES TABLE
-- =============================================

CREATE TABLE CATEGORIES
(
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    EventID INT NOT NULL,
    CategoryName VARCHAR(100) NOT NULL,
    Distance DECIMAL(6,2) NOT NULL,
    EntryFee DECIMAL(10,2) NOT NULL,
    AgeGroup VARCHAR(50) NOT NULL,
    GenderRestriction VARCHAR(20),

    CONSTRAINT FK_CATEGORIES_EVENTS
        FOREIGN KEY (EventID)
        REFERENCES EVENTS(EventID),

    CONSTRAINT CK_CATEGORIES_Distance
        CHECK (Distance > 0),

    CONSTRAINT CK_CATEGORIES_EntryFee
        CHECK (EntryFee >= 0)
);
GO


-- =============================================
-- 6. EVENT_ENROLMENTS TABLE
-- =============================================

CREATE TABLE EVENT_ENROLMENTS
(
    EnrolmentID INT IDENTITY(1,1) PRIMARY KEY,
    ParticipantID INT NOT NULL,
    CategoryID INT NOT NULL,
    EventID INT NOT NULL,
    EnrolmentDate DATETIME NOT NULL DEFAULT GETDATE(),
    PaymentStatus VARCHAR(30) NOT NULL,
    PaymentAmount DECIMAL(10,2) NOT NULL,
    Status VARCHAR(30) NOT NULL,

    CONSTRAINT FK_ENROLMENTS_PARTICIPANTS
        FOREIGN KEY (ParticipantID)
        REFERENCES PARTICIPANTS(ParticipantID),

    CONSTRAINT FK_ENROLMENTS_CATEGORIES
        FOREIGN KEY (CategoryID)
        REFERENCES CATEGORIES(CategoryID),

    CONSTRAINT FK_ENROLMENTS_EVENTS
        FOREIGN KEY (EventID)
        REFERENCES EVENTS(EventID),

    CONSTRAINT CK_ENROLMENTS_PaymentAmount
        CHECK (PaymentAmount >= 0)
);
GO


-- =============================================
-- 7. RESULTS TABLE
-- =============================================

CREATE TABLE RESULTS
(
    ResultID INT IDENTITY(1,1) PRIMARY KEY,
    EnrolmentID INT NOT NULL,
    FinishTime TIME,
    Position INT,
    Disqualified BIT NOT NULL DEFAULT 0,

    CONSTRAINT FK_RESULTS_ENROLMENTS
        FOREIGN KEY (EnrolmentID)
        REFERENCES EVENT_ENROLMENTS(EnrolmentID),

    CONSTRAINT UQ_RESULTS_EnrolmentID
        UNIQUE (EnrolmentID),

    CONSTRAINT CK_RESULTS_Position
        CHECK (Position IS NULL OR Position > 0)
);
GO


-- =============================================
-- SEED DATA
-- =============================================

-- USERS
INSERT INTO USERS
    (FirstName, LastName, Email, Password, Role)
VALUES
    ('John', 'Mokoena', 'john@raceday.com', 'Password123', 'Organiser'),
    ('Sarah', 'Molefe', 'sarah@raceday.com', 'Password123', 'Organiser'),
    ('Thabo', 'Nkosi', 'thabo@email.com', 'Password123', 'Participant'),
    ('Lerato', 'Mabena', 'lerato@email.com', 'Password123', 'Participant');
GO


-- ORGANISERS
INSERT INTO ORGANISERS
    (UserID, OrganisationName, ContactPhone, ContactEmail)
VALUES
    (1, 'Limpopo Running Club', '0712345678', 'info@limpoporunning.com'),
    (2, 'Polokwane Sports Events', '0723456789', 'events@polokwanesports.com');
GO


-- PARTICIPANTS
INSERT INTO PARTICIPANTS
    (UserID, DateOfBirth, Gender, EmergencyContact, MedicalConditions)
VALUES
    (3, '2002-05-15', 'Male', '0711111111', 'None'),
    (4, '2001-08-22', 'Female', '0722222222', 'Asthma');
GO


-- EVENTS
INSERT INTO EVENTS
    (OrganiserID, EventName, EventDescription, EventDate,
     RegistrationDeadline, Location, Status, MaxParticipants)
VALUES
    (1, 'Polokwane City Run',
     'Annual city running event',
     '2026-10-10',
     '2026-10-01',
     'Polokwane',
     'Open',
     500),

    (1, 'Limpopo Marathon',
     'Full marathon running event',
     '2026-11-15',
     '2026-11-01',
     'Polokwane Stadium',
     'Open',
     1000),

    (2, 'Spring Fun Run',
     'Community fun running event',
     '2026-09-25',
     '2026-09-20',
     'Polokwane Central Park',
     'Open',
     300);
GO


-- CATEGORIES
INSERT INTO CATEGORIES
    (EventID, CategoryName, Distance, EntryFee, AgeGroup, GenderRestriction)
VALUES
    (1, '5KM Fun Run', 5.00, 100.00, '18+', 'Open'),
    (1, '10KM Race', 10.00, 150.00, '18+', 'Open'),
    (2, 'Half Marathon', 21.10, 250.00, '18+', 'Open'),
    (2, 'Full Marathon', 42.20, 350.00, '18+', 'Open'),
    (3, '5KM Fun Run', 5.00, 80.00, 'All Ages', 'Open');
GO


-- EVENT ENROLMENTS
INSERT INTO EVENT_ENROLMENTS
    (ParticipantID, CategoryID, EventID,
     PaymentStatus, PaymentAmount, Status)
VALUES
    (1, 1, 1, 'Paid', 100.00, 'Confirmed'),
    (1, 3, 2, 'Paid', 250.00, 'Confirmed'),
    (2, 2, 1, 'Paid', 150.00, 'Confirmed'),
    (2, 5, 3, 'Pending', 80.00, 'Pending');
GO


-- RESULTS
INSERT INTO RESULTS
    (EnrolmentID, FinishTime, Position, Disqualified)
VALUES
    (1, '00:28:35', 12, 0),
    (2, '01:52:40', 25, 0),
    (3, '00:55:20', 8, 0);
GO


-- =============================================
-- CHECK THE DATA
-- =============================================

SELECT * FROM USERS;
SELECT * FROM ORGANISERS;
SELECT * FROM PARTICIPANTS;
SELECT * FROM EVENTS;
SELECT * FROM CATEGORIES;
SELECT * FROM EVENT_ENROLMENTS;
SELECT * FROM RESULTS;
GO