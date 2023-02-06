import { Module } from "@nestjs/common";
import { DrugController } from "./drug.controller";

@Module({
  controllers: [DrugController],
})
export class DrugModule {}
