import { IsNotEmpty, IsString, Length } from "class-validator";

export class CreateCategorie{
    @IsString()
    @Length(3, 50)
    @IsNotEmpty({ message: 'categorie should have a nom' })
    nomCat:string;
}