import { Produits } from 'src/produit/produit.entity';
import { Entity, Column, PrimaryGeneratedColumn, OneToOne, JoinColumn } from 'typeorm';

@Entity()
export class images{
  @PrimaryGeneratedColumn()
  idImage:number;

  @Column()
  url:String;
  
  @OneToOne(() => Produits)
  @JoinColumn()
  pdt_: Produits;
}     









