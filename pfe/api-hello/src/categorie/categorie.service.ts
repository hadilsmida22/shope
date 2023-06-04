import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Categories } from './categorie.entity';
import { CreateCategorie } from './dto/create-categorie.dto';
import { UpdateCategorie } from './dto/update-categorie.dto';
import { Produits } from 'src/produit/produit.entity';

@Injectable()
export class CategorieService {
    constructor(
        @InjectRepository(Categories)
        private categorieRepository: Repository<Categories>,
        @InjectRepository(Produits)
        private readonly produitRepository: Repository<Produits>,
      ) {}

    async addProduitToCategorie(categorieId: number, produitId: number): Promise<Categories> {
        const categorie = await this.categorieRepository.findOne({
            where: {
              idCat: categorieId,
            },
            relations: ['produits'],
          });
        const produit = await this.produitRepository.findOneBy({idP:produitId});
        if (!categorie || !produit) {
            throw new NotFoundException(`La catégorie d'id ${categorieId} ou le produit d'id ${produitId} n'existe pas`);
        }
        if (categorie.produits.findIndex(p => p.idP === produitId) === -1) {
            categorie.produits.push(produit);
            await this.categorieRepository.save(categorie);
          }
          return categorie;
    }  

    async removeCategorieFromProduit(produitId: number, categorieId: number): Promise<Produits> {
      const produit = await this.produitRepository.findOne({
        where: {
          idP: produitId,
        },
        relations: ['categorie'], // Charger la relation avec la catégorie
      });
    
      if (!produit) {
        throw new NotFoundException('Le produit d id ${produitId} n existe pas');
      }
    
      produit.categorie = null; // Supprimer la référence à la catégorie
    
      await this.produitRepository.save(produit);
    
      return produit;
    }
      

    findOne(idCat:number):Promise<Categories | null>{
        return this.categorieRepository.findOneBy({idCat});
    }

    findAll():Promise<Categories[]>{
        return this.categorieRepository.find();
    }

    create(cat: CreateCategorie){
        const newcategorie = this.categorieRepository.create({
            ...cat,

        });
        return this.categorieRepository.save(newcategorie);
    }

    async remove(idCat: number): Promise<void> {
        await this.categorieRepository.delete(idCat);
    }
    async update(idCat : number, cat:UpdateCategorie) {
        return await this.categorieRepository.update({idCat}, {
            ...cat
        });
    }

    async getProduitsByCategorie(categorieId: number): Promise<Produits[]> {
        const produits = await this.produitRepository
          .createQueryBuilder('produit')
          .leftJoin('produit.categorie', 'categorie')
          .where('categorie.idCat = :categorieId', { categorieId })
          .getMany();
      
        return produits;
    }

    
}
