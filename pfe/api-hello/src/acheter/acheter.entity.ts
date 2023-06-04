import { Listes } from 'src/liste/liste.entity';
import { Produits } from 'src/produit/produit.entity';
import { Entity, Column, PrimaryGeneratedColumn,  ManyToOne } from 'typeorm';

@Entity()
export class Acheters {
  @PrimaryGeneratedColumn()
  idAchete:number;

  @Column()
  acheterNonAcheter:boolean;

  @ManyToOne(() => Produits, 
  (produit) => produit.achats)
  produit:Produits;
  
  @ManyToOne(() => Listes, 
  (liste) => liste.achats)
  liste:Listes;
  @Column()
  quantite: number;
  
}