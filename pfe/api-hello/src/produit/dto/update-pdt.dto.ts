import { PartialType } from "@nestjs/mapped-types";
import { CreateProduit } from "./create-pdt.dto";

export class UpdateProduit extends PartialType(CreateProduit){
}