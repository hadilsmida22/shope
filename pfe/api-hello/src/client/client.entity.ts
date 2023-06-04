import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';
import * as bcrypt from 'bcrypt';
@Entity()
export class Clients {
  @PrimaryGeneratedColumn()
  idCl:number;
  
 /* @Column({ default: '' })
  nom: string;*/

  @Column({ default: '' })
  email:string;

  @Column({ default: '' })
  password:string;

  async checkPassword(password: string): Promise<boolean> {
    return bcrypt.compare(password, this.password);
  }
}