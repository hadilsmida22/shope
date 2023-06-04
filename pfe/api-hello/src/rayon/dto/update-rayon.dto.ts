import { PartialType } from "@nestjs/mapped-types";
import { CreateRayon } from "./create-rayon.dto";

export class UpdateRayon extends PartialType(CreateRayon){
}