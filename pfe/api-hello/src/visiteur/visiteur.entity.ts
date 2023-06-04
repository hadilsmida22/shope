import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';
import * as bcrypt from 'bcrypt';
@Entity()
export class visiteurs{
  @PrimaryGeneratedColumn()
  idVisiteur:number;

  @Column({ default: '' })
  email:string;

  @Column({ default: '' })
  password:string;

  async checkPassword(password: string): Promise<boolean> {
    return bcrypt.compare(password, this.password);
  }
}         
