import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Rayons } from './rayon.entity';
import { CreateRayon } from './dto/create-rayon.dto';
import { UpdateRayon } from './dto/update-rayon.dto';
import { Categories } from 'src/categorie/categorie.entity';
@Injectable()
export class RayonService {
    constructor(
        @InjectRepository(Rayons)
        private rayonsRepository: Repository<Rayons>,
        @InjectRepository(Categories)
        private categorieRepository: Repository<Categories>,
      ) {}

    findOne(idR:number):Promise<Rayons | null>{
        return this.rayonsRepository.findOneBy({idR});
    }

    findAll():Promise<Rayons[]>{
        return this.rayonsRepository.find();
    }

    create(rayon: CreateRayon){
        const newrayon = this.rayonsRepository.create({
            ...rayon,

        });
        return this.rayonsRepository.save(newrayon);
    }

    async remove(idR: number): Promise<void> {
        await this.rayonsRepository.delete(idR);
    }
    async update(idR : number, rayon:UpdateRayon) {
        return await this.rayonsRepository.update({idR}, {
            ...rayon
        });
    }
    async findOneWithCategories(rayonId: number): Promise<Rayons> {
        return this.rayonsRepository
          .createQueryBuilder('rayon')
          .leftJoinAndSelect('rayon.categories', 'categorie')
          .where('rayon.id = :rayonId', { rayonId })
          .getOne();
    }

    async addCategorieToRayon(rayonId: number, categorieId: number): Promise<Rayons> {
        const rayon = await this.rayonsRepository.findOne({
            where: {
              idR: rayonId,
            },
            relations: ['cat'],
          });
        const categorie = await this.categorieRepository.findOneBy({idCat: categorieId});
        rayon.cat.push(categorie);
        return this.rayonsRepository.save(rayon);
    }
}
