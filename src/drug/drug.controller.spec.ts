import { Test, TestingModule } from "@nestjs/testing";
import { DrugController } from "./drug.controller";

describe("DrugController", () => {
  let controller: DrugController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [DrugController],
    }).compile();

    controller = module.get<DrugController>(DrugController);
  });

  it("should be defined", () => {
    expect(controller).toBeDefined();
  });
});
