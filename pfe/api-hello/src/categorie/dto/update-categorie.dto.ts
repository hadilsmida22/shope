import { PartialType } from "@nestjs/mapped-types";
import { CreateCategorie } from "./create-categorie.dto";

export class UpdateCategorie extends PartialType(CreateCategorie){

}