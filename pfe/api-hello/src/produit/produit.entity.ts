import { Acheters } from 'src/acheter/acheter.entity';
import { Categories } from 'src/categorie/categorie.entity';
import { images } from 'src/image/image.entity';
import { Listes } from 'src/liste/liste.entity';
import { Entity, Column, PrimaryGeneratedColumn, OneToOne, JoinColumn, ManyToMany, OneToMany, ManyToOne } from 'typeorm';

@Entity()
export class Produits{
  @PrimaryGeneratedColumn()
  idP:number;

  @Column({nullable : true})
  marque?:string;

  @Column({nullable : true})
  libelle?:string;

  @Column({nullable : true})
  grammage?:string;

  @Column()
  prixPdt:string;

  @Column()
  nomMagasin:string;
  
  @Column({nullable : true})
  image?:string;
  
  @OneToMany(() => Acheters,
  (achat) => achat.produit)
  achats : Acheters[];

  @ManyToMany(() => Listes,
  liste => liste.produits)
  listes: Listes[];

  @ManyToOne(() => Categories,
  categorie => categorie.produits)
  categorie: Categories;
}     