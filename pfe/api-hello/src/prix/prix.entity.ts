import { Produits } from 'src/produit/produit.entity';
import { Entity, Column, PrimaryGeneratedColumn, ManyToMany, JoinColumn, OneToMany } from 'typeorm';

@Entity()
export class Prix{
  @PrimaryGeneratedColumn()
  idPrix:number;

  @Column()
  nomMagasin:string;

  @Column()
  prixPdt:string;
}         