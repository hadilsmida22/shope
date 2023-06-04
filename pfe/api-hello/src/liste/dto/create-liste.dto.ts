import { IsDate, IsEnum, IsIn, IsNotEmpty, IsString,  } from 'class-validator';
//import { statusType } from '../liste.entity';
export class CreateList{
 idListe: number;
etat: string;
adresseIP: string; 
total: string;


}