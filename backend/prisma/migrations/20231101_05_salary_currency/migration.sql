-- Adding currency to Position table
ALTER TABLE Position ADD COLUMN currency VARCHAR(3) NOT NULL DEFAULT 'USD';
