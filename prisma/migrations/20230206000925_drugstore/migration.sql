/*
  Warnings:

  - You are about to drop the column `drugId` on the `DrugCategory` table. All the data in the column will be lost.
  - You are about to drop the column `drugId` on the `DrugForm` table. All the data in the column will be lost.
  - Added the required column `drugCategoryId` to the `Drug` table without a default value. This is not possible if the table is not empty.
  - Added the required column `drugFormId` to the `Drug` table without a default value. This is not possible if the table is not empty.
  - Added the required column `drugId` to the `Movement` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "DrugCategory" DROP CONSTRAINT "DrugCategory_drugId_fkey";

-- DropForeignKey
ALTER TABLE "DrugForm" DROP CONSTRAINT "DrugForm_drugId_fkey";

-- AlterTable
ALTER TABLE "Drug" ADD COLUMN     "drugCategoryId" INTEGER NOT NULL,
ADD COLUMN     "drugFormId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "DrugCategory" DROP COLUMN "drugId";

-- AlterTable
ALTER TABLE "DrugForm" DROP COLUMN "drugId";

-- AlterTable
ALTER TABLE "Movement" ADD COLUMN     "drugId" UUID NOT NULL;

-- AddForeignKey
ALTER TABLE "Drug" ADD CONSTRAINT "Drug_drugFormId_fkey" FOREIGN KEY ("drugFormId") REFERENCES "DrugForm"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Drug" ADD CONSTRAINT "Drug_drugCategoryId_fkey" FOREIGN KEY ("drugCategoryId") REFERENCES "DrugCategory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Movement" ADD CONSTRAINT "Movement_drugId_fkey" FOREIGN KEY ("drugId") REFERENCES "Drug"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
