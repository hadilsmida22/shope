import { Produits } from 'src/produit/produit.entity';
import { Rayons } from 'src/rayon/rayon.entity';
import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, OneToMany } from 'typeorm';

@Entity()
export class Categories {
  @PrimaryGeneratedColumn()
  idCat:number;

  @Column()
  nomCat:string;

 @ManyToOne(() => Rayons,
  rayon => rayon.cat)
  rayon_: Rayons;

  @OneToMany(() => Produits,
  produit => produit.categorie)
  produits: Produits[];
}

