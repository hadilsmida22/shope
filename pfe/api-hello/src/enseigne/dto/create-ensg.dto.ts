import { IsNotEmpty, Length } from "class-validator";
import { Url } from "url";
export class CreateEnseigne{
    @Length(3, 50)
    @IsNotEmpty({ message: 'ensg should have a nom' })
    nomCommercial:string;

    catalogue?:string;

    image?:string;
}