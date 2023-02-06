/*
  Warnings:

  - You are about to drop the `Customer` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DrugCategory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DrugForm` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DrugPhoto` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DrugProvider` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Movement` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Purchase` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Supply` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_DrugProviderTodrug` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "DrugPhoto" DROP CONSTRAINT "DrugPhoto_drugId_fkey";

-- DropForeignKey
ALTER TABLE "Movement" DROP CONSTRAINT "Movement_drugId_fkey";

-- DropForeignKey
ALTER TABLE "Purchase" DROP CONSTRAINT "Purchase_customerId_fkey";

-- DropForeignKey
ALTER TABLE "Purchase" DROP CONSTRAINT "Purchase_drugId_fkey";

-- DropForeignKey
ALTER TABLE "Supply" DROP CONSTRAINT "Supply_drugId_fkey";

-- DropForeignKey
ALTER TABLE "Supply" DROP CONSTRAINT "Supply_drugProviderId_fkey";

-- DropForeignKey
ALTER TABLE "_DrugProviderTodrug" DROP CONSTRAINT "_DrugProviderTodrug_A_fkey";

-- DropForeignKey
ALTER TABLE "_DrugProviderTodrug" DROP CONSTRAINT "_DrugProviderTodrug_B_fkey";

-- DropForeignKey
ALTER TABLE "drug" DROP CONSTRAINT "drug_drugCategoryId_fkey";

-- DropForeignKey
ALTER TABLE "drug" DROP CONSTRAINT "drug_drugFormId_fkey";

-- DropTable
DROP TABLE "Customer";

-- DropTable
DROP TABLE "DrugCategory";

-- DropTable
DROP TABLE "DrugForm";

-- DropTable
DROP TABLE "DrugPhoto";

-- DropTable
DROP TABLE "DrugProvider";

-- DropTable
DROP TABLE "Movement";

-- DropTable
DROP TABLE "Purchase";

-- DropTable
DROP TABLE "Supply";

-- DropTable
DROP TABLE "_DrugProviderTodrug";

-- CreateTable
CREATE TABLE "drug_provider" (
    "id" UUID NOT NULL,
    "incorp_number" TEXT NOT NULL,
    "phone_number" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "town" TEXT NOT NULL,
    "areas" TEXT NOT NULL,
    "address" TEXT,

    CONSTRAINT "drug_provider_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drug_form" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "drug_form_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drug_category" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "drug_category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "movement" (
    "id" UUID NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "drugId" UUID NOT NULL,

    CONSTRAINT "movement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "mustomer" (
    "id" UUID NOT NULL,
    "phoneNumber" INTEGER NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "town" TEXT NOT NULL,
    "addreas" TEXT NOT NULL,
    "address" TEXT,

    CONSTRAINT "mustomer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "purchase" (
    "id" UUID NOT NULL,
    "quantity" INTEGER NOT NULL,
    "drugId" UUID NOT NULL,
    "customerId" UUID NOT NULL,

    CONSTRAINT "purchase_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "supply" (
    "id" UUID NOT NULL,
    "quantity" INTEGER NOT NULL,
    "drugId" UUID NOT NULL,
    "drugProviderId" UUID NOT NULL,

    CONSTRAINT "supply_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drug_photo" (
    "id" UUID NOT NULL,
    "url" TEXT NOT NULL,
    "size" INTEGER NOT NULL,
    "drugId" UUID NOT NULL,

    CONSTRAINT "drug_photo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_drugTodrug_provider" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "drug_provider_incorp_number_key" ON "drug_provider"("incorp_number");

-- CreateIndex
CREATE UNIQUE INDEX "drug_provider_phone_number_key" ON "drug_provider"("phone_number");

-- CreateIndex
CREATE UNIQUE INDEX "mustomer_phoneNumber_key" ON "mustomer"("phoneNumber");

-- CreateIndex
CREATE UNIQUE INDEX "drug_photo_url_key" ON "drug_photo"("url");

-- CreateIndex
CREATE UNIQUE INDEX "_drugTodrug_provider_AB_unique" ON "_drugTodrug_provider"("A", "B");

-- CreateIndex
CREATE INDEX "_drugTodrug_provider_B_index" ON "_drugTodrug_provider"("B");

-- AddForeignKey
ALTER TABLE "drug" ADD CONSTRAINT "drug_drugFormId_fkey" FOREIGN KEY ("drugFormId") REFERENCES "drug_form"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drug" ADD CONSTRAINT "drug_drugCategoryId_fkey" FOREIGN KEY ("drugCategoryId") REFERENCES "drug_category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "movement" ADD CONSTRAINT "movement_drugId_fkey" FOREIGN KEY ("drugId") REFERENCES "drug"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "purchase" ADD CONSTRAINT "purchase_drugId_fkey" FOREIGN KEY ("drugId") REFERENCES "drug"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "purchase" ADD CONSTRAINT "purchase_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "mustomer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "supply" ADD CONSTRAINT "supply_drugId_fkey" FOREIGN KEY ("drugId") REFERENCES "drug"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "supply" ADD CONSTRAINT "supply_drugProviderId_fkey" FOREIGN KEY ("drugProviderId") REFERENCES "drug_provider"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drug_photo" ADD CONSTRAINT "drug_photo_drugId_fkey" FOREIGN KEY ("drugId") REFERENCES "drug"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_drugTodrug_provider" ADD CONSTRAINT "_drugTodrug_provider_A_fkey" FOREIGN KEY ("A") REFERENCES "drug"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_drugTodrug_provider" ADD CONSTRAINT "_drugTodrug_provider_B_fkey" FOREIGN KEY ("B") REFERENCES "drug_provider"("id") ON DELETE CASCADE ON UPDATE CASCADE;
