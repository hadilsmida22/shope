import { IsNotEmpty, IsNumber, Length } from "class-validator";

export class CreateVisiteur{
    @IsNotEmpty({ message: 'User should have an email' })
    @Length(3, 255)
    email?: string;
    @IsNotEmpty({ message: 'User should have a password' })
    @Length(3, 255)
    password?: string;
}