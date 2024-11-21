-- Add indexes to foreign key fields
CREATE INDEX idx_education_candidate_id ON "Education"("candidateId");
CREATE INDEX idx_work_experience_candidate_id ON "WorkExperience"("candidateId");
CREATE INDEX idx_resume_candidate_id ON "Resume"("candidateId");

-- Add createdAt and updatedAt to Candidate
ALTER TABLE "Candidate" ADD COLUMN "createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE "Candidate" ADD COLUMN "updatedAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- Add status to Candidate
ALTER TABLE "Candidate" ADD COLUMN "status" VARCHAR(50) NOT NULL DEFAULT 'New';

-- Create Skills table
CREATE TABLE "Skill" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(100) NOT NULL UNIQUE
);

-- Create CandidateSkill junction table
CREATE TABLE "CandidateSkill" (
  "candidateId" INTEGER NOT NULL,
  "skillId" INTEGER NOT NULL,
  PRIMARY KEY ("candidateId", "skillId"),
  FOREIGN KEY ("candidateId") REFERENCES "Candidate"("id") ON DELETE CASCADE,
  FOREIGN KEY ("skillId") REFERENCES "Skill"("id") ON DELETE CASCADE
);

-- Create JobPosition table
CREATE TABLE "JobPosition" (
  "id" SERIAL PRIMARY KEY,
  "title" VARCHAR(100) NOT NULL,
  "description" TEXT,
  "createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Add jobPositionId to Candidate
ALTER TABLE "Candidate" ADD COLUMN "jobPositionId" INTEGER;
ALTER TABLE "Candidate" ADD CONSTRAINT fk_candidate_job_position FOREIGN KEY ("jobPositionId") REFERENCES "JobPosition"("id");