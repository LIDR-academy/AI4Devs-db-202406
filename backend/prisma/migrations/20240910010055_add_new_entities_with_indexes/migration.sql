-- CreateIndex
CREATE INDEX "idx_application_positionId" ON "Application"("positionId");

-- CreateIndex
CREATE INDEX "idx_application_candidateId" ON "Application"("candidateId");

-- CreateIndex
CREATE INDEX "idx_employee_companyId" ON "Employee"("companyId");

-- CreateIndex
CREATE INDEX "idx_interview_applicationId" ON "Interview"("applicationId");

-- CreateIndex
CREATE INDEX "idx_interview_employeeId" ON "Interview"("employeeId");

-- CreateIndex
CREATE INDEX "idx_interviewStep_interviewFlowId" ON "InterviewStep"("interviewFlowId");

-- CreateIndex
CREATE INDEX "idx_position_companyId" ON "Position"("companyId");

-- CreateIndex
CREATE INDEX "idx_position_interviewFlowId" ON "Position"("interviewFlowId");
