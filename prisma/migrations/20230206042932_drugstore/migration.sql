-- CreateEnum
CREATE TYPE "move_type" AS ENUM ('SUPPLY', 'PURCHASE');

-- CreateTable
CREATE TABLE "drug_provider" (
    "id" UUID NOT NULL,
    "incorp_number" TEXT NOT NULL,
    "phone_number" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "town" TEXT NOT NULL,
    "areas" TEXT NOT NULL,
    "address" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL,

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
CREATE TABLE "drug" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "dosage" INTEGER NOT NULL,
    "price" DECIMAL(65,30) NOT NULL,
    "description" TEXT,
    "fab_date" TIMESTAMP(3) NOT NULL,
    "exp_date" TIMESTAMP(3) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "size" INTEGER NOT NULL,
    "dosage_form_id" INTEGER NOT NULL,
    "drug_category_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "drug_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "movement" (
    "id" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "drugId" UUID NOT NULL,
    "move_type" "move_type" NOT NULL,
    "purchase_id" UUID,

    CONSTRAINT "movement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "customer" (
    "id" UUID NOT NULL,
    "phone_number" INTEGER NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "town" TEXT NOT NULL,
    "addreas" TEXT NOT NULL,
    "address" TEXT,
    "deb_card_infos" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "customer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "purchase" (
    "id" UUID NOT NULL,
    "quantity" INTEGER NOT NULL,
    "drug_id" UUID NOT NULL,
    "customer_id" UUID NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "purchase_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "supply" (
    "id" UUID NOT NULL,
    "quantity" INTEGER NOT NULL,
    "drugId" UUID NOT NULL,
    "drug_provider_id" UUID NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "supply_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "drug_photo" (
    "id" UUID NOT NULL,
    "url" TEXT NOT NULL,
    "size" INTEGER NOT NULL,
    "drug_id" UUID NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,

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
CREATE UNIQUE INDEX "drug_name_key" ON "drug"("name");

-- CreateIndex
CREATE UNIQUE INDEX "customer_phone_number_key" ON "customer"("phone_number");

-- CreateIndex
CREATE UNIQUE INDEX "drug_photo_url_key" ON "drug_photo"("url");

-- CreateIndex
CREATE UNIQUE INDEX "_drugTodrug_provider_AB_unique" ON "_drugTodrug_provider"("A", "B");

-- CreateIndex
CREATE INDEX "_drugTodrug_provider_B_index" ON "_drugTodrug_provider"("B");

-- AddForeignKey
ALTER TABLE "drug" ADD CONSTRAINT "drug_dosage_form_id_fkey" FOREIGN KEY ("dosage_form_id") REFERENCES "drug_form"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drug" ADD CONSTRAINT "drug_drug_category_id_fkey" FOREIGN KEY ("drug_category_id") REFERENCES "drug_category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "movement" ADD CONSTRAINT "movement_drugId_fkey" FOREIGN KEY ("drugId") REFERENCES "drug"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "movement" ADD CONSTRAINT "movement_purchase_id_fkey" FOREIGN KEY ("purchase_id") REFERENCES "purchase"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "purchase" ADD CONSTRAINT "purchase_drug_id_fkey" FOREIGN KEY ("drug_id") REFERENCES "drug"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "purchase" ADD CONSTRAINT "purchase_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "supply" ADD CONSTRAINT "supply_drugId_fkey" FOREIGN KEY ("drugId") REFERENCES "drug"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "supply" ADD CONSTRAINT "supply_drug_provider_id_fkey" FOREIGN KEY ("drug_provider_id") REFERENCES "drug_provider"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "drug_photo" ADD CONSTRAINT "drug_photo_drug_id_fkey" FOREIGN KEY ("drug_id") REFERENCES "drug"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_drugTodrug_provider" ADD CONSTRAINT "_drugTodrug_provider_A_fkey" FOREIGN KEY ("A") REFERENCES "drug"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_drugTodrug_provider" ADD CONSTRAINT "_drugTodrug_provider_B_fkey" FOREIGN KEY ("B") REFERENCES "drug_provider"("id") ON DELETE CASCADE ON UPDATE CASCADE;
