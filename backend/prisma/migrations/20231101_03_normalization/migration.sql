-- Applying normalization improvements
CREATE TABLE PositionDetails (
    id SERIAL PRIMARY KEY,
    positionId INT UNIQUE REFERENCES Position(id),
    job_description TEXT,
    requirements TEXT,
    responsibilities TEXT
);
