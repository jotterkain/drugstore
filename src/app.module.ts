import { Module } from "@nestjs/common";
import { DrugModule } from "./drug/drug.module";
import { DrugController } from "./drug/drug.controller";
import { PurchaseModule } from "./purchase/purchase.module";
import { DosageFomrsModule } from "./dosage_fomrs/dosage_fomrs.module";
import { DosageFormModule } from "./dosage_form/dosage_form.module";
import { MoovementModule } from "./moovement/moovement.module";
import { MovementModule } from "./movement/movement.module";
import { ProviderModule } from "./provider/provider.module";
import { DrugProviderModule } from "./drug_provider/drug_provider.module";
import { DrugsProviderModule } from "./drug_provider/drug_provider.module";
import { CustomerModule } from './customer/customer.module';
import { DrugsCategoryModule } from './drug_category/drug_category.module';
import { DrugsImageModule } from './drug_image/drug_image.module';

@Module({
  imports: [
    DrugModule,
    DrugModule,
    PurchaseModule,
    DosageFomrsModule,
    DosageFormModule,
    MoovementModule,
    MovementModule,
    ProviderModule,
    DrugProviderModule,
    DrugsProviderModule,
    CustomerModule,
    DrugsCategoryModule,
    DrugsImageModule,
  ],
  controllers: [DrugController],
  providers: [],
})
export class AppModule {}
