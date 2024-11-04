-- Creating audit trail tables for tracking changes
CREATE TABLE PositionHistory (
    id SERIAL PRIMARY KEY,
    positionId INT NOT NULL REFERENCES Position(id),
    title VARCHAR(100),
    description TEXT,
    modifiedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
