
import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class Todos {
  @PrimaryGeneratedColumn()
  id: number

  @Column()
  title: string

  @Column()
  description : string
  
}