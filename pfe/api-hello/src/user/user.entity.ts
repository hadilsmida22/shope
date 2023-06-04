import { Entity, Column, PrimaryGeneratedColumn, ManyToMany, OneToMany } from 'typeorm';
import * as bcrypt from 'bcrypt';
import { Role } from 'src/auth/enums/user-role.enum';
import { Listes } from 'src/liste/liste.entity';
import { Cartes } from 'src/carteFidelite/carteF.entity';
@Entity()
export class User {
  @PrimaryGeneratedColumn('uuid')
  idUser:string;

  @Column({ nullable: true })
  email:string;

  @Column({ nullable: true })
  password:string;

  @Column({type:'enum', enum:Role ,default: Role.INTERNAUTE})
  role : Role;

  @Column({ nullable: true })
  adresseIP :string;

  @OneToMany(() => Listes, (liste) => liste.inter_)
  lists: Listes[];


  @OneToMany(() => Cartes,
  (carte) => carte.inter_)
  cartess : Cartes[];

  async checkPassword(password: string): Promise<boolean> {
    return bcrypt.compare(password, this.password);
  }
}