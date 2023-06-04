import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Admins {
  @PrimaryGeneratedColumn()
  idAdm:number;

  @Column({default :'admin'})
  nom:string;

  @Column({default :'admin'})
  password:string;
}


