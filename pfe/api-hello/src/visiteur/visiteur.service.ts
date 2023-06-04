import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { UpdateVisiteur } from './dto/update-visit.dto';
import { CreateVisiteur } from './dto/create-visit.dto';
import { visiteurs } from './visiteur.entity';
@Injectable()
export class VisiteurService {
    constructor(
        @InjectRepository(visiteurs)
        private visiteursRepository: Repository<visiteurs>,
      ) {}

    findOne(idVisiteur:number):Promise<visiteurs | null>{
        return this.visiteursRepository.findOneBy({idVisiteur});
    }

    findAll():Promise<visiteurs[]>{
        return this.visiteursRepository.find();
    }

    create(visit: CreateVisiteur){
        const newvisit = this.visiteursRepository.create({
            ...visit,

        });
        return this.visiteursRepository.save(newvisit);
    }

    async remove(idVisiteur: number): Promise<void> {
        await this.visiteursRepository.delete(idVisiteur);
    }
    async update(idVisiteur : number, visit:UpdateVisiteur) {
        return await this.visiteursRepository.update({idVisiteur}, {
            ...visit
        });
      }
}
