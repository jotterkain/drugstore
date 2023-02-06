-- CreateTable
CREATE TABLE "DrugProvider" (
    "id" UUID NOT NULL,
    "incorp_number" TEXT NOT NULL,
    "phone_number" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "town" TEXT NOT NULL,
    "areas" TEXT NOT NULL,
    "address" TEXT,

    CONSTRAINT "DrugProvider_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DrugForm" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "drugId" UUID NOT NULL,

    CONSTRAINT "DrugForm_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DrugCategory" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "drugId" UUID,

    CONSTRAINT "DrugCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Drug" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "dosage" INTEGER NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "description" TEXT,
    "fab_date" TIMESTAMP(3) NOT NULL,
    "exp_date" TIMESTAMP(3) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "size" INTEGER NOT NULL,

    CONSTRAINT "Drug_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Movement" (
    "id" UUID NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "quantity" INTEGER NOT NULL,

    CONSTRAINT "Movement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Customer" (
    "id" UUID NOT NULL,
    "phoneNumber" INTEGER NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "town" TEXT NOT NULL,
    "addreas" TEXT NOT NULL,
    "address" TEXT,

    CONSTRAINT "Customer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Purchase" (
    "id" UUID NOT NULL,
    "quantity" INTEGER NOT NULL,
    "drugId" UUID NOT NULL,
    "customerId" UUID NOT NULL,

    CONSTRAINT "Purchase_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Supply" (
    "id" UUID NOT NULL,
    "quantity" INTEGER NOT NULL,
    "drugId" UUID NOT NULL,
    "drugProviderId" UUID NOT NULL,

    CONSTRAINT "Supply_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DrugPhoto" (
    "id" UUID NOT NULL,
    "url" TEXT NOT NULL,
    "size" INTEGER NOT NULL,
    "drugId" UUID NOT NULL,

    CONSTRAINT "DrugPhoto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_DrugToDrugProvider" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "DrugProvider_incorp_number_key" ON "DrugProvider"("incorp_number");

-- CreateIndex
CREATE UNIQUE INDEX "DrugProvider_phone_number_key" ON "DrugProvider"("phone_number");

-- CreateIndex
CREATE UNIQUE INDEX "Drug_name_key" ON "Drug"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Customer_phoneNumber_key" ON "Customer"("phoneNumber");

-- CreateIndex
CREATE UNIQUE INDEX "DrugPhoto_url_key" ON "DrugPhoto"("url");

-- CreateIndex
CREATE UNIQUE INDEX "_DrugToDrugProvider_AB_unique" ON "_DrugToDrugProvider"("A", "B");

-- CreateIndex
CREATE INDEX "_DrugToDrugProvider_B_index" ON "_DrugToDrugProvider"("B");

-- AddForeignKey
ALTER TABLE "DrugForm" ADD CONSTRAINT "DrugForm_drugId_fkey" FOREIGN KEY ("drugId") REFERENCES "Drug"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DrugCategory" ADD CONSTRAINT "DrugCategory_drugId_fkey" FOREIGN KEY ("drugId") REFERENCES "Drug"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Purchase" ADD CONSTRAINT "Purchase_drugId_fkey" FOREIGN KEY ("drugId") REFERENCES "Drug"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Purchase" ADD CONSTRAINT "Purchase_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Supply" ADD CONSTRAINT "Supply_drugId_fkey" FOREIGN KEY ("drugId") REFERENCES "Drug"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Supply" ADD CONSTRAINT "Supply_drugProviderId_fkey" FOREIGN KEY ("drugProviderId") REFERENCES "DrugProvider"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DrugPhoto" ADD CONSTRAINT "DrugPhoto_drugId_fkey" FOREIGN KEY ("drugId") REFERENCES "Drug"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DrugToDrugProvider" ADD CONSTRAINT "_DrugToDrugProvider_A_fkey" FOREIGN KEY ("A") REFERENCES "Drug"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DrugToDrugProvider" ADD CONSTRAINT "_DrugToDrugProvider_B_fkey" FOREIGN KEY ("B") REFERENCES "DrugProvider"("id") ON DELETE CASCADE ON UPDATE CASCADE;
