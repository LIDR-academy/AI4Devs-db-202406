/*
  Warnings:

  - You are about to drop the column `applicationDate` on the `Application` table. All the data in the column will be lost.
  - You are about to drop the column `candidateId` on the `Application` table. All the data in the column will be lost.
  - You are about to drop the column `positionId` on the `Application` table. All the data in the column will be lost.
  - You are about to drop the column `firstName` on the `Candidate` table. All the data in the column will be lost.
  - You are about to drop the column `lastName` on the `Candidate` table. All the data in the column will be lost.
  - You are about to drop the column `candidateId` on the `Education` table. All the data in the column will be lost.
  - You are about to drop the column `endDate` on the `Education` table. All the data in the column will be lost.
  - You are about to drop the column `startDate` on the `Education` table. All the data in the column will be lost.
  - You are about to drop the column `candidateId` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `isActive` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `applicationId` on the `Interview` table. All the data in the column will be lost.
  - You are about to drop the column `employeeId` on the `Interview` table. All the data in the column will be lost.
  - You are about to drop the column `interviewDate` on the `Interview` table. All the data in the column will be lost.
  - You are about to drop the column `interviewStepId` on the `Interview` table. All the data in the column will be lost.
  - You are about to drop the column `interviewFlowId` on the `InterviewStep` table. All the data in the column will be lost.
  - You are about to drop the column `interviewTypeId` on the `InterviewStep` table. All the data in the column will be lost.
  - You are about to drop the column `orderIndex` on the `InterviewStep` table. All the data in the column will be lost.
  - You are about to drop the column `applicationDeadline` on the `Position` table. All the data in the column will be lost.
  - You are about to drop the column `companyDescription` on the `Position` table. All the data in the column will be lost.
  - You are about to drop the column `companyId` on the `Position` table. All the data in the column will be lost.
  - You are about to drop the column `contactInfo` on the `Position` table. All the data in the column will be lost.
  - You are about to drop the column `employmentType` on the `Position` table. All the data in the column will be lost.
  - You are about to drop the column `interviewFlowId` on the `Position` table. All the data in the column will be lost.
  - You are about to drop the column `isVisible` on the `Position` table. All the data in the column will be lost.
  - You are about to drop the column `jobDescription` on the `Position` table. All the data in the column will be lost.
  - You are about to drop the column `salaryMax` on the `Position` table. All the data in the column will be lost.
  - You are about to drop the column `salaryMin` on the `Position` table. All the data in the column will be lost.
  - You are about to drop the column `candidateId` on the `Resume` table. All the data in the column will be lost.
  - You are about to drop the column `filePath` on the `Resume` table. All the data in the column will be lost.
  - You are about to drop the column `fileType` on the `Resume` table. All the data in the column will be lost.
  - You are about to drop the column `uploadDate` on the `Resume` table. All the data in the column will be lost.
  - You are about to drop the column `candidateId` on the `WorkExperience` table. All the data in the column will be lost.
  - You are about to drop the column `endDate` on the `WorkExperience` table. All the data in the column will be lost.
  - You are about to drop the column `startDate` on the `WorkExperience` table. All the data in the column will be lost.
  - Added the required column `application_date` to the `Application` table without a default value. This is not possible if the table is not empty.
  - Added the required column `candidate_id` to the `Application` table without a default value. This is not possible if the table is not empty.
  - Added the required column `position_id` to the `Application` table without a default value. This is not possible if the table is not empty.
  - Added the required column `first_name` to the `Candidate` table without a default value. This is not possible if the table is not empty.
  - Added the required column `last_name` to the `Candidate` table without a default value. This is not possible if the table is not empty.
  - Added the required column `candidate_id` to the `Education` table without a default value. This is not possible if the table is not empty.
  - Added the required column `start_date` to the `Education` table without a default value. This is not possible if the table is not empty.
  - Added the required column `company_id` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `application_id` to the `Interview` table without a default value. This is not possible if the table is not empty.
  - Added the required column `interview_step_id` to the `Interview` table without a default value. This is not possible if the table is not empty.
  - Added the required column `interview_flow_id` to the `InterviewStep` table without a default value. This is not possible if the table is not empty.
  - Added the required column `order_index` to the `InterviewStep` table without a default value. This is not possible if the table is not empty.
  - Added the required column `company_id` to the `Position` table without a default value. This is not possible if the table is not empty.
  - Added the required column `candidate_id` to the `Resume` table without a default value. This is not possible if the table is not empty.
  - Added the required column `file_path` to the `Resume` table without a default value. This is not possible if the table is not empty.
  - Added the required column `file_type` to the `Resume` table without a default value. This is not possible if the table is not empty.
  - Added the required column `upload_date` to the `Resume` table without a default value. This is not possible if the table is not empty.
  - Added the required column `candidate_id` to the `WorkExperience` table without a default value. This is not possible if the table is not empty.
  - Added the required column `start_date` to the `WorkExperience` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Application" DROP CONSTRAINT "Application_candidateId_fkey";

-- DropForeignKey
ALTER TABLE "Application" DROP CONSTRAINT "Application_positionId_fkey";

-- DropForeignKey
ALTER TABLE "Education" DROP CONSTRAINT "Education_candidateId_fkey";

-- DropForeignKey
ALTER TABLE "Employee" DROP CONSTRAINT "Employee_candidateId_fkey";

-- DropForeignKey
ALTER TABLE "Interview" DROP CONSTRAINT "Interview_applicationId_fkey";

-- DropForeignKey
ALTER TABLE "Interview" DROP CONSTRAINT "Interview_employeeId_fkey";

-- DropForeignKey
ALTER TABLE "Interview" DROP CONSTRAINT "Interview_interviewStepId_fkey";

-- DropForeignKey
ALTER TABLE "InterviewStep" DROP CONSTRAINT "InterviewStep_interviewFlowId_fkey";

-- DropForeignKey
ALTER TABLE "InterviewStep" DROP CONSTRAINT "InterviewStep_interviewTypeId_fkey";

-- DropForeignKey
ALTER TABLE "Position" DROP CONSTRAINT "Position_companyId_fkey";

-- DropForeignKey
ALTER TABLE "Position" DROP CONSTRAINT "Position_interviewFlowId_fkey";

-- DropForeignKey
ALTER TABLE "Resume" DROP CONSTRAINT "Resume_candidateId_fkey";

-- DropForeignKey
ALTER TABLE "WorkExperience" DROP CONSTRAINT "WorkExperience_candidateId_fkey";

-- DropIndex
DROP INDEX "idx_application_candidateId";

-- DropIndex
DROP INDEX "idx_application_positionId";

-- DropIndex
DROP INDEX "idx_employee_companyId";

-- DropIndex
DROP INDEX "idx_interview_applicationId";

-- DropIndex
DROP INDEX "idx_interview_employeeId";

-- DropIndex
DROP INDEX "idx_interviewStep_interviewFlowId";

-- DropIndex
DROP INDEX "idx_position_companyId";

-- DropIndex
DROP INDEX "idx_position_interviewFlowId";

-- AlterTable
ALTER TABLE "Application" DROP COLUMN "applicationDate",
DROP COLUMN "candidateId",
DROP COLUMN "positionId",
ADD COLUMN     "application_date" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "candidate_id" INTEGER NOT NULL,
ADD COLUMN     "position_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Candidate" DROP COLUMN "firstName",
DROP COLUMN "lastName",
ADD COLUMN     "first_name" VARCHAR(100) NOT NULL,
ADD COLUMN     "last_name" VARCHAR(100) NOT NULL;

-- AlterTable
ALTER TABLE "Education" DROP COLUMN "candidateId",
DROP COLUMN "endDate",
DROP COLUMN "startDate",
ADD COLUMN     "candidate_id" INTEGER NOT NULL,
ADD COLUMN     "end_date" TIMESTAMP(3),
ADD COLUMN     "start_date" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Employee" DROP COLUMN "candidateId",
DROP COLUMN "isActive",
ADD COLUMN     "company_id" INTEGER NOT NULL,
ADD COLUMN     "is_active" BOOLEAN NOT NULL DEFAULT true;

-- AlterTable
ALTER TABLE "Interview" DROP COLUMN "applicationId",
DROP COLUMN "employeeId",
DROP COLUMN "interviewDate",
DROP COLUMN "interviewStepId",
ADD COLUMN     "application_id" INTEGER NOT NULL,
ADD COLUMN     "employee_id" INTEGER,
ADD COLUMN     "interview_date" TIMESTAMP(3),
ADD COLUMN     "interview_step_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "InterviewStep" DROP COLUMN "interviewFlowId",
DROP COLUMN "interviewTypeId",
DROP COLUMN "orderIndex",
ADD COLUMN     "interview_flow_id" INTEGER NOT NULL,
ADD COLUMN     "interview_type_id" INTEGER,
ADD COLUMN     "order_index" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Position" DROP COLUMN "applicationDeadline",
DROP COLUMN "companyDescription",
DROP COLUMN "companyId",
DROP COLUMN "contactInfo",
DROP COLUMN "employmentType",
DROP COLUMN "interviewFlowId",
DROP COLUMN "isVisible",
DROP COLUMN "jobDescription",
DROP COLUMN "salaryMax",
DROP COLUMN "salaryMin",
ADD COLUMN     "application_deadline" TIMESTAMP(3),
ADD COLUMN     "company_description" TEXT,
ADD COLUMN     "company_id" INTEGER NOT NULL,
ADD COLUMN     "contact_info" VARCHAR(255),
ADD COLUMN     "employment_type" VARCHAR(50),
ADD COLUMN     "interview_flow_id" INTEGER,
ADD COLUMN     "is_visible" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "job_description" TEXT,
ADD COLUMN     "salary_max" DOUBLE PRECISION,
ADD COLUMN     "salary_min" DOUBLE PRECISION;

-- AlterTable
ALTER TABLE "Resume" DROP COLUMN "candidateId",
DROP COLUMN "filePath",
DROP COLUMN "fileType",
DROP COLUMN "uploadDate",
ADD COLUMN     "candidate_id" INTEGER NOT NULL,
ADD COLUMN     "file_path" VARCHAR(500) NOT NULL,
ADD COLUMN     "file_type" VARCHAR(50) NOT NULL,
ADD COLUMN     "upload_date" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "WorkExperience" DROP COLUMN "candidateId",
DROP COLUMN "endDate",
DROP COLUMN "startDate",
ADD COLUMN     "candidate_id" INTEGER NOT NULL,
ADD COLUMN     "end_date" TIMESTAMP(3),
ADD COLUMN     "start_date" TIMESTAMP(3) NOT NULL;

-- CreateIndex
CREATE INDEX "idx_application_position_id" ON "Application"("position_id");

-- CreateIndex
CREATE INDEX "idx_application_candidate_id" ON "Application"("candidate_id");

-- CreateIndex
CREATE INDEX "idx_employee_company_id" ON "Employee"("company_id");

-- CreateIndex
CREATE INDEX "idx_interview_application_id" ON "Interview"("application_id");

-- CreateIndex
CREATE INDEX "idx_interview_employee_id" ON "Interview"("employee_id");

-- CreateIndex
CREATE INDEX "idx_interview_step_interview_flow_id" ON "InterviewStep"("interview_flow_id");

-- CreateIndex
CREATE INDEX "idx_position_company_id" ON "Position"("company_id");

-- CreateIndex
CREATE INDEX "idx_position_interview_flow_id" ON "Position"("interview_flow_id");

-- AddForeignKey
ALTER TABLE "Education" ADD CONSTRAINT "Education_candidate_id_fkey" FOREIGN KEY ("candidate_id") REFERENCES "Candidate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorkExperience" ADD CONSTRAINT "WorkExperience_candidate_id_fkey" FOREIGN KEY ("candidate_id") REFERENCES "Candidate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Resume" ADD CONSTRAINT "Resume_candidate_id_fkey" FOREIGN KEY ("candidate_id") REFERENCES "Candidate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "Company"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Position" ADD CONSTRAINT "Position_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "Company"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Position" ADD CONSTRAINT "Position_interview_flow_id_fkey" FOREIGN KEY ("interview_flow_id") REFERENCES "InterviewFlow"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InterviewStep" ADD CONSTRAINT "InterviewStep_interview_flow_id_fkey" FOREIGN KEY ("interview_flow_id") REFERENCES "InterviewFlow"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InterviewStep" ADD CONSTRAINT "InterviewStep_interview_type_id_fkey" FOREIGN KEY ("interview_type_id") REFERENCES "InterviewType"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Application" ADD CONSTRAINT "Application_position_id_fkey" FOREIGN KEY ("position_id") REFERENCES "Position"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Application" ADD CONSTRAINT "Application_candidate_id_fkey" FOREIGN KEY ("candidate_id") REFERENCES "Candidate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Interview" ADD CONSTRAINT "Interview_application_id_fkey" FOREIGN KEY ("application_id") REFERENCES "Application"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Interview" ADD CONSTRAINT "Interview_interview_step_id_fkey" FOREIGN KEY ("interview_step_id") REFERENCES "InterviewStep"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Interview" ADD CONSTRAINT "Interview_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employee"("id") ON DELETE SET NULL ON UPDATE CASCADE;
