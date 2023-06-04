import { PartialType } from "@nestjs/mapped-types";
import { CreateEnseigne } from "./create-ensg.dto";

export class UpdateEnseigne extends PartialType(CreateEnseigne){

}