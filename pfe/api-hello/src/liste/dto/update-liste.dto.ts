import { PartialType } from "@nestjs/mapped-types";
import { CreateList } from "./create-liste.dto";

export class UpdateList extends PartialType(CreateList){
}