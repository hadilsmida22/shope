import { PartialType } from "@nestjs/mapped-types";
import { CreateAdmin } from "./create-admin.dto";

export class UpdateAdmin extends PartialType(CreateAdmin){
}