-- Partitioning Application table by status
ALTER TABLE Application PARTITION BY LIST (status);
