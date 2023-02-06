import { Module } from "@nestjs/common";
import { DrugModule } from "./drug/drug.module";
import { DrugController } from "./drug/drug.controller";
import { PurchaseModule } from "./purchase/purchase.module";
import { DosageFormModule } from "./dosage_form/dosage_form.module";
import { MovementModule } from "./movement/movement.module";
import { DrugProviderModule } from "./drug_provider/drug_provider.module";
import { CustomerModule } from "./customer/customer.module";
import { DrugPhotoModule } from "./drug_photo/drug_photo.module";
import { DrugCategoryModule } from "./drug_category/drug_category.module";
import { PrismaModule } from './prisma/prisma.module';

@Module({
  imports: [
    DrugModule,
    DrugModule,
    PurchaseModule,
    DosageFormModule,
    DosageFormModule,
    MovementModule,
    MovementModule,
    DrugProviderModule,
    CustomerModule,
    DrugCategoryModule,
    DrugPhotoModule,
    PrismaModule,
  ],
  controllers: [DrugController],
  providers: [],
})
export class AppModule {}
