/*
  Warnings:

  - You are about to drop the column `title` on the `Education` table. All the data in the column will be lost.
  - You are about to alter the column `result` on the `Interview` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(255)`.
  - You are about to drop the column `companyDescription` on the `Position` table. All the data in the column will be lost.
  - You are about to alter the column `filePath` on the `Resume` table. The data in that column could be lost. The data in that column will be cast from `VarChar(500)` to `VarChar(255)`.
  - You are about to drop the column `description` on the `WorkExperience` table. All the data in the column will be lost.
  - Added the required column `degree` to the `Education` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Company" ADD COLUMN     "description" TEXT;

-- AlterTable
ALTER TABLE "Education" DROP COLUMN "title",
ADD COLUMN     "degree" VARCHAR(255) NOT NULL,
ALTER COLUMN "institution" SET DATA TYPE VARCHAR(255);

-- AlterTable
ALTER TABLE "Interview" ALTER COLUMN "result" SET DATA TYPE VARCHAR(255);

-- AlterTable
ALTER TABLE "Position" DROP COLUMN "companyDescription";

-- AlterTable
ALTER TABLE "Resume" ALTER COLUMN "filePath" SET DATA TYPE VARCHAR(255);

-- AlterTable
ALTER TABLE "WorkExperience" DROP COLUMN "description",
ALTER COLUMN "company" SET DATA TYPE VARCHAR(255),
ALTER COLUMN "position" SET DATA TYPE VARCHAR(255);
