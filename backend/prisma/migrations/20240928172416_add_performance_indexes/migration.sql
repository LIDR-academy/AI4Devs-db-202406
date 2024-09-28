/*
  Warnings:

  - Added the required column `companyId` to the `JobPosition` table without a default value. This is not possible if the table is not empty.
  - Added the required column `status` to the `JobPosition` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "JobPosition" ADD COLUMN     "companyId" INTEGER NOT NULL,
ADD COLUMN     "isVisible" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "location" VARCHAR(100),
ADD COLUMN     "salaryMax" DECIMAL(10,2),
ADD COLUMN     "salaryMin" DECIMAL(10,2),
ADD COLUMN     "status" VARCHAR(50) NOT NULL;

-- CreateTable
CREATE TABLE "Company" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,

    CONSTRAINT "Company_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Employee" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "role" VARCHAR(50) NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "companyId" INTEGER NOT NULL,

    CONSTRAINT "Employee_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Application" (
    "id" SERIAL NOT NULL,
    "applicationDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" VARCHAR(50) NOT NULL,
    "notes" TEXT,
    "candidateId" INTEGER NOT NULL,
    "jobPositionId" INTEGER NOT NULL,

    CONSTRAINT "Application_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Interview" (
    "id" SERIAL NOT NULL,
    "interviewDate" TIMESTAMP(3) NOT NULL,
    "result" VARCHAR(50),
    "score" INTEGER,
    "notes" TEXT,
    "applicationId" INTEGER NOT NULL,
    "employeeId" INTEGER NOT NULL,
    "interviewStepId" INTEGER NOT NULL,

    CONSTRAINT "Interview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InterviewFlow" (
    "id" SERIAL NOT NULL,
    "description" TEXT,

    CONSTRAINT "InterviewFlow_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InterviewStep" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "orderIndex" INTEGER NOT NULL,
    "interviewFlowId" INTEGER NOT NULL,
    "interviewTypeId" INTEGER NOT NULL,

    CONSTRAINT "InterviewStep_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InterviewType" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" TEXT,

    CONSTRAINT "InterviewType_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Employee_email_key" ON "Employee"("email");

-- CreateIndex
CREATE INDEX "Employee_companyId_idx" ON "Employee"("companyId");

-- CreateIndex
CREATE INDEX "Application_candidateId_idx" ON "Application"("candidateId");

-- CreateIndex
CREATE INDEX "Application_jobPositionId_idx" ON "Application"("jobPositionId");

-- CreateIndex
CREATE INDEX "Interview_applicationId_idx" ON "Interview"("applicationId");

-- CreateIndex
CREATE INDEX "Interview_employeeId_idx" ON "Interview"("employeeId");

-- CreateIndex
CREATE INDEX "Interview_interviewStepId_idx" ON "Interview"("interviewStepId");

-- CreateIndex
CREATE INDEX "InterviewStep_interviewFlowId_idx" ON "InterviewStep"("interviewFlowId");

-- CreateIndex
CREATE INDEX "InterviewStep_interviewTypeId_idx" ON "InterviewStep"("interviewTypeId");

-- CreateIndex
CREATE INDEX "Candidate_jobPositionId_idx" ON "Candidate"("jobPositionId");

-- CreateIndex
CREATE INDEX "Education_institution_idx" ON "Education"("institution");

-- CreateIndex
CREATE INDEX "JobPosition_companyId_idx" ON "JobPosition"("companyId");

-- CreateIndex
CREATE INDEX "Resume_uploadDate_idx" ON "Resume"("uploadDate");

-- CreateIndex
CREATE INDEX "WorkExperience_company_idx" ON "WorkExperience"("company");

-- CreateIndex
CREATE INDEX "WorkExperience_position_idx" ON "WorkExperience"("position");

-- AddForeignKey
ALTER TABLE "JobPosition" ADD CONSTRAINT "JobPosition_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Application" ADD CONSTRAINT "Application_candidateId_fkey" FOREIGN KEY ("candidateId") REFERENCES "Candidate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Application" ADD CONSTRAINT "Application_jobPositionId_fkey" FOREIGN KEY ("jobPositionId") REFERENCES "JobPosition"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Interview" ADD CONSTRAINT "Interview_applicationId_fkey" FOREIGN KEY ("applicationId") REFERENCES "Application"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Interview" ADD CONSTRAINT "Interview_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Interview" ADD CONSTRAINT "Interview_interviewStepId_fkey" FOREIGN KEY ("interviewStepId") REFERENCES "InterviewStep"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InterviewStep" ADD CONSTRAINT "InterviewStep_interviewFlowId_fkey" FOREIGN KEY ("interviewFlowId") REFERENCES "InterviewFlow"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InterviewStep" ADD CONSTRAINT "InterviewStep_interviewTypeId_fkey" FOREIGN KEY ("interviewTypeId") REFERENCES "InterviewType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
