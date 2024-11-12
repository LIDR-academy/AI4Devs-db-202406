/*
  Warnings:

  - You are about to drop the column `companyId` on the `Employee` table. All the data in the column will be lost.
  - Added the required column `candidateId` to the `Employee` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Employee" DROP CONSTRAINT "Employee_companyId_fkey";

-- DropIndex
DROP INDEX "idx_employee_companyId";

-- AlterTable
ALTER TABLE "Employee" DROP COLUMN "companyId",
ADD COLUMN     "candidateId" INTEGER NOT NULL;

-- CreateIndex
CREATE INDEX "idx_employee_companyId" ON "Employee"("candidateId");

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_candidateId_fkey" FOREIGN KEY ("candidateId") REFERENCES "Company"("id") ON DELETE CASCADE ON UPDATE CASCADE;
