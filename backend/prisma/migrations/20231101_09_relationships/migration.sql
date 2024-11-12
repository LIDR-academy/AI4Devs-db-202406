-- Refining relationships
CREATE TABLE PositionInterviewFlow (
    positionId INT NOT NULL REFERENCES Position(id),
    interviewFlowId INT NOT NULL REFERENCES InterviewFlow(id),
    PRIMARY KEY (positionId, interviewFlowId)
);
