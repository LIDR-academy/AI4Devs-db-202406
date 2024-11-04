-- Adding ENUMs and CHECK constraints
CREATE TYPE PositionStatus AS ENUM ('open', 'closed', 'pending');
ALTER TABLE Position ADD COLUMN status PositionStatus;

ALTER TABLE Position ADD CHECK (salary_min <= salary_max);
