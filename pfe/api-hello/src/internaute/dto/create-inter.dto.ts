import { IsNotEmpty, Length, IsString,IsEmail} from 'class-validator';

export class CreateInter{
    @IsNotEmpty({ message: 'User should have a prenom' })
    @IsString()
    @Length(5, 50)
    prenom:string;
    @IsNotEmpty({ message: 'User should have a nom' })
    @IsString()
    @Length(5, 50)
    nom:string;
    @IsEmail()
    email:string;
    @IsNotEmpty({ message: 'User should have a password' })
    @Length(3, 255)
    password:string;
}