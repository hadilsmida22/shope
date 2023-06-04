import { Cartes } from 'src/carteFidelite/carteF.entity';
import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { Url } from 'url';

@Entity()
export class Enseignes{
  @PrimaryGeneratedColumn()
  idE:number;

  @Column()
  nomCommercial:string;

  @Column()
  catalogue?:string;

  @Column({nullable : true})
  image? :string;
  
  @OneToMany(() => Cartes, 
  carte => carte.enseigne)
  cartes: Cartes[];
} 








