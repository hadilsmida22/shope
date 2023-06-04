import { IsNotEmpty, IsString, Length } from "class-validator";

export class CreateAdmin{
    @IsString()
    @Length(4, 50)
    @IsNotEmpty({ message: 'admin should have a nom' })
    nom:string;
    @IsNotEmpty({ message: 'admin should have a password' })
    @Length(5, 50)
    password:string;
}