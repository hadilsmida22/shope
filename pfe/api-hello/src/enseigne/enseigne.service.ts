import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Enseignes } from './enseigne.entity';
import { CreateEnseigne } from './dto/create-ensg.dto';
import { UpdateEnseigne } from './dto/update-ensg.dto';

@Injectable()
export class EnseigneService {
    constructor(
        @InjectRepository(Enseignes)
        private ensgRepository: Repository<Enseignes>,
      ) {}

    findOne(idE:number):Promise<Enseignes | null>{
        return this.ensgRepository.findOneBy({idE});
    }

    findAll():Promise<Enseignes[]>{
        return this.ensgRepository.find();
    }

    create(ensg: CreateEnseigne){
        const newensg = this.ensgRepository.create({
            ...ensg,

        });
        return this.ensgRepository.save(newensg);
    }

    async remove(idE: number): Promise<void> {
        await this.ensgRepository.delete(idE);
    }
    async update(idE : number, ensg:UpdateEnseigne) {
        return await this.ensgRepository.update({idE}, {
            ...ensg
        });
      }
}
