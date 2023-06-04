import { IsNotEmpty, IsString, Length } from "class-validator";

export class CreateRayon{
    @IsString()
    @Length(3, 50)
    @IsNotEmpty({ message: 'rayon should have a nom' })
    nomR:string;
}