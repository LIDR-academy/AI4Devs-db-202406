-- CreateIndex
CREATE INDEX "idx_application_position_id" ON "Application"("positionId");

-- CreateIndex
CREATE INDEX "idx_application_candidate_id" ON "Application"("candidateId");

-- CreateIndex
CREATE INDEX "idx_education_candidate_id" ON "Education"("candidateId");

-- CreateIndex
CREATE INDEX "idx_employee_company_id" ON "Employee"("companyId");

-- CreateIndex
CREATE INDEX "idx_interview_application_id" ON "Interview"("applicationId");

-- CreateIndex
CREATE INDEX "idx_interview_interview_step_id" ON "Interview"("interviewStepId");

-- CreateIndex
CREATE INDEX "idx_interview_employee_id" ON "Interview"("employeeId");

-- CreateIndex
CREATE INDEX "idx_position_company_id" ON "Position"("companyId");

-- CreateIndex
CREATE INDEX "idx_position_interview_flow_id" ON "Position"("interviewFlowId");

-- CreateIndex
CREATE INDEX "idx_resume_candidate_id" ON "Resume"("candidateId");

-- CreateIndex
CREATE INDEX "idx_work_experience_candidate_id" ON "WorkExperience"("candidateId");
