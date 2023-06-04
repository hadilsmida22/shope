import { PartialType } from "@nestjs/mapped-types";
import { CreateClient } from "./create-client.dto";

export class UpdateClient extends PartialType(CreateClient){
}