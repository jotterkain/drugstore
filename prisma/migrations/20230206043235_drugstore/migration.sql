/*
  Warnings:

  - You are about to drop the `drug_form` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "drug" DROP CONSTRAINT "drug_dosage_form_id_fkey";

-- DropTable
DROP TABLE "drug_form";

-- CreateTable
CREATE TABLE "dosage_form" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "dosage_form_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "drug" ADD CONSTRAINT "drug_dosage_form_id_fkey" FOREIGN KEY ("dosage_form_id") REFERENCES "dosage_form"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
