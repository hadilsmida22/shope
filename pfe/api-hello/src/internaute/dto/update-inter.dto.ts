import { CreateInter } from "./create-inter.dto";
import { PartialType } from '@nestjs/mapped-types';
export class UpdateInter extends PartialType(CreateInter){

}