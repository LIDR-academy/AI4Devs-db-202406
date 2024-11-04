-- Adding indexes for performance improvements
CREATE INDEX idx_candidate_email ON Candidate(email);
CREATE INDEX idx_position_status ON Position(status);
CREATE INDEX idx_application_status ON Application(status);
