import { IsEmail, IsNotEmpty, IsNumber, IsString, Length } from "class-validator";

export class CreateClient{
    /*@IsNotEmpty({ message: 'User should have a name' })
    @IsString()
    @Length(5, 50)
    nom: string;*/
    @IsNotEmpty({ message: 'User should have an email' })
    @Length(3, 255)
    @IsEmail()
    email: string;
    @IsNotEmpty({ message: 'User should have a password' })
    @Length(3, 255)
    password: string;
}