-- Adding soft delete columns
ALTER TABLE Employee ADD COLUMN is_deleted BOOLEAN DEFAULT FALSE;
ALTER TABLE Position ADD COLUMN is_deleted BOOLEAN DEFAULT FALSE;
