import { Listes } from 'src/liste/liste.entity';
import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Listesuggs {
  @PrimaryGeneratedColumn()
  idListeSugg:number;
  
} 