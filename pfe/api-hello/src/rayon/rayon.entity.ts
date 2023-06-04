import { Categories } from 'src/categorie/categorie.entity';
import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';

@Entity()
export class Rayons{
  @PrimaryGeneratedColumn()
  idR:number;

  @Column()
  nomR:string;
  
  @OneToMany(() => Categories,
  cat => cat.rayon_)
  cat: Categories[];
}         

