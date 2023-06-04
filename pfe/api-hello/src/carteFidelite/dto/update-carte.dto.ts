import { PartialType } from "@nestjs/mapped-types";
import { CreateCarte } from "./create-carte.dto";

export class UpdateCarte extends PartialType(CreateCarte){
}