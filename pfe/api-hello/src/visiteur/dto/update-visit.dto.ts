import { PartialType } from "@nestjs/mapped-types";
import { CreateVisiteur } from "./create-visit.dto";

export class UpdateVisiteur extends PartialType(CreateVisiteur){
}