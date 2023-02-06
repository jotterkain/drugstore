/*
  Warnings:

  - You are about to drop the `Drug` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_DrugToDrugProvider` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Drug" DROP CONSTRAINT "Drug_drugCategoryId_fkey";

-- DropForeignKey
ALTER TABLE "Drug" DROP CONSTRAINT "Drug_drugFormId_fkey";

-- DropForeignKey
ALTER TABLE "DrugPhoto" DROP CONSTRAINT "DrugPhoto_drugId_fkey";

-- DropForeignKey
ALTER TABLE "Movement" DROP CONSTRAINT "Movement_drugId_fkey";

-- DropForeignKey
ALTER TABLE "Purchase" DROP CONSTRAINT "Purchase_drugId_fkey";

-- DropForeignKey
ALTER TABLE "Supply" DROP CONSTRAINT "Supply_drugId_fkey";

-- DropForeignKey
ALTER TABLE "_DrugToDrugProvider" DROP CONSTRAINT "_DrugToDrugProvider_A_fkey";

-- DropForeignKey
ALTER TABLE "_DrugToDrugProvider" DROP CONSTRAINT "_DrugToDrugProvider_B_fkey";

-- DropTable
DROP TABLE "Drug";

-- DropTable
DROP TABLE "_DrugToDrugProvider";

-- CreateTable
CREATE TABLE "drug" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "dosage" INTEGER NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "description" TEXT,
    "fab_date" TIMESTAMP(3) NOT NULL,
    "exp_date" TIMESTAMP(3) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "size" INTEGER NOT NULL,
    "drugFormId" INTEGER NOT NULL,
    "drugCategoryId" INTEGER NOT NULL,

    CONSTRAINT "drug_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_DrugProviderTodrug" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "drug_name_key" ON "drug"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_DrugProviderTodrug_AB_unique" ON "_DrugProviderTodrug"("A", "B");

-- CreateIndex
CREATE INDEX "_DrugProviderTodrug_B_index" ON "_DrugProviderTodrug"("B");

-- AddForeignKey
ALTER TABLE "drug" ADD CONSTRAINT "drug_drugFormId_fkey" FOREIGN KEY ("drugFormId") REFERENCES "DrugForm"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drug" ADD CONSTRAINT "drug_drugCategoryId_fkey" FOREIGN KEY ("drugCategoryId") REFERENCES "DrugCategory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Movement" ADD CONSTRAINT "Movement_drugId_fkey" FOREIGN KEY ("drugId") REFERENCES "drug"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Purchase" ADD CONSTRAINT "Purchase_drugId_fkey" FOREIGN KEY ("drugId") REFERENCES "drug"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Supply" ADD CONSTRAINT "Supply_drugId_fkey" FOREIGN KEY ("drugId") REFERENCES "drug"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DrugPhoto" ADD CONSTRAINT "DrugPhoto_drugId_fkey" FOREIGN KEY ("drugId") REFERENCES "drug"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DrugProviderTodrug" ADD CONSTRAINT "_DrugProviderTodrug_A_fkey" FOREIGN KEY ("A") REFERENCES "DrugProvider"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DrugProviderTodrug" ADD CONSTRAINT "_DrugProviderTodrug_B_fkey" FOREIGN KEY ("B") REFERENCES "drug"("id") ON DELETE CASCADE ON UPDATE CASCADE;
