import { Acheters } from 'src/acheter/acheter.entity';
import { internautes } from 'src/internaute/internaute.entity';
import { Produits } from 'src/produit/produit.entity';
import { User } from 'src/user/user.entity';
import { Entity, Column, PrimaryGeneratedColumn, ManyToMany, JoinColumn, OneToMany, ManyToOne } from 'typeorm';
/*export enum statusType {
  EN_COURS = 'en cours',
  NON_EFFECTUER ='non effectuer ',
  EFFECTUER ='effectuer'
}*/

@Entity()
export class Listes{
  @PrimaryGeneratedColumn()
  idListe:number;
  
  @Column({
    type: 'date',
    default: () => 'CURRENT_TIMESTAMP',
  })
  dateCreation: Date;

  @Column(/*{default: statusType.EN_COURS, enum:statusType}*/)
  etat:string;

  @Column({nullable : true})
  total:number;
  
  @ManyToOne(() => User)
  @JoinColumn({ name: 'idUser' }) // Nom de la clé étrangère dans la table Listes
  inter_: User;

  @OneToMany(() => Acheters,
  (achat) => achat.liste)
  achats: Acheters[];
  
  @ManyToMany(() => Produits,
  produit => produit.listes)
  produits: Produits[];

}         

