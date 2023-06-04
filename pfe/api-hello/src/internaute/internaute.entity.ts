import { Cartes } from 'src/carteFidelite/carteF.entity';
import { Listes } from 'src/liste/liste.entity';
import { Entity, Column, PrimaryGeneratedColumn, OneToMany, ManyToMany, JoinTable } from 'typeorm';

import * as bcrypt from 'bcrypt';

@Entity()
export class internautes{
  @PrimaryGeneratedColumn()
  idInternaute:number;
  @Column({ default: "inconnu" })
  browser: string;

  @Column({ default: "inconnu" })
  browserVersion: string;

  @Column({ default: "inconnu" })
  os: string;

  @Column({ default: "inconnu" })
  osVersion: string;

  @Column({ default: "inconnu" })
  device: string;

  @Column({ default: "inconnu" })
  source: string;

  @ManyToMany(() => Listes,
  list => list.inter_)
  lists: Listes[];


  @OneToMany(() => Cartes,
  (carte) => carte.inter_)
  cartess : Cartes[];
}     












