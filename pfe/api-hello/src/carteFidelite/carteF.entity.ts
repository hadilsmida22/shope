import { Enseignes } from 'src/enseigne/enseigne.entity';
import { internautes } from 'src/internaute/internaute.entity';
import { User } from 'src/user/user.entity';
import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, Index } from 'typeorm';

@Entity()
export class Cartes {
  @PrimaryGeneratedColumn()
  idCart:number;

  @Column({ nullable: true })
  @Index({ unique: true, where: "(numero IS NOT NULL)" })
  numero?:string;

  @Column()
  nom:string;

  @ManyToOne(() => User, 
  (inter) => inter.cartess)
  inter_: User;

  @ManyToOne(() => Enseignes, 
  enseigne => enseigne.cartes)
  enseigne: Enseignes;
}

