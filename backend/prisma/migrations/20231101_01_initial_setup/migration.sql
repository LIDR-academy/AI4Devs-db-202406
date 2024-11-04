-- Initial setup migration
CREATE TABLE Candidate (
    id SERIAL PRIMARY KEY,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(100)
);

CREATE TABLE Education (
    id SERIAL PRIMARY KEY,
    institution VARCHAR(100) NOT NULL,
    title VARCHAR(250) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE,
    candidateId INT NOT NULL REFERENCES Candidate(id)
);

CREATE TABLE WorkExperience (
    id SERIAL PRIMARY KEY,
    company VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL,
    description VARCHAR(200),
    startDate DATE NOT NULL,
    endDate DATE,
    candidateId INT NOT NULL REFERENCES Candidate(id)
);

CREATE TABLE Resume (
    id SERIAL PRIMARY KEY,
    filePath VARCHAR(500) NOT NULL,
    fileType VARCHAR(50) NOT NULL,
    uploadDate DATE NOT NULL,
    candidateId INT NOT NULL REFERENCES Candidate(id)
);
