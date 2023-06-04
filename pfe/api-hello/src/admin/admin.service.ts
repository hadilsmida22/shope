import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Admins } from './admin.entity';
import { CreateAdmin } from './dto/create-admin.dto';
import { UpdateAdmin } from './dto/update-admin.dto';
import { Rayons } from 'src/rayon/rayon.entity';
import { Categories } from 'src/categorie/categorie.entity';
import { Produits } from 'src/produit/produit.entity';
@Injectable()
export class AdminService {
    constructor(
        @InjectRepository(Admins)
        private adminRepository: Repository<Admins>,
        @InjectRepository(Rayons)
        private rayonRepository: Repository<Rayons>,
        @InjectRepository(Categories)
        private categorieRepository: Repository<Categories>,
       
      ) {}

    async createRayon(nom: string): Promise<Rayons> {
        const rayon = new Rayons();
        rayon.nomR = nom;
        return this.rayonRepository.save(rayon);
    }

    async createCategorie(nom: string): Promise<Categories> {
        const categorie = new Categories();
        categorie.nomCat = nom;
        return this.categorieRepository.save(categorie);
    }

    
    

    async getCategoriesOfRayon(rayonId: number): Promise<Categories[]> {
        const rayon = await this.rayonRepository.findOne({
            where: {
              idR: rayonId,
            },
            relations: ['cat'],
          });
        return rayon.cat;
    }  


    findAll():Promise<Admins[]>{
        return this.adminRepository.find();
    }

    createAdmin(admin: CreateAdmin){
        const newAdmin = this.adminRepository.create({
            ...admin,

        });
        return this.adminRepository.save(newAdmin);
    }

    async remove(idAdm: number): Promise<void> {
        await this.adminRepository.delete(idAdm);
    }

    async update(idAdm : number, admin:UpdateAdmin) {
        return await this.adminRepository.update({idAdm}, {
            ...admin
        });
    }
}
