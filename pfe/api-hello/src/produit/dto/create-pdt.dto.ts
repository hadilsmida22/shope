import {  IsString } from "class-validator";

export class CreateProduit{
   // @IsString()
    marque?:string;
   // @IsString()
    libelle?:string;
   // @IsString()
    grammage?:string;
}