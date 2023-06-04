import { IsNotEmpty, IsString, Length } from "class-validator";

export class CreateCarte{
    @Length(8, 50)
    numero?:string;
    @IsString()
    @IsNotEmpty({ message: 'carte should have a nom' })
    @Length(2, 50)
    nom:string;
    adresseIP: string;  // Ajouter la propriété ici
    passwordUtilisateur: string;
    emailUtilisateur: string;
} 
