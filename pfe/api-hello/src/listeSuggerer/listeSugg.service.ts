import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Listesuggs } from './listeSugg.entity';
import { CreateListSugg } from './dto/create-listeSugg.dto';
import { UpdateListSugg } from './dto/update-listeSugg.dto';
import { Produits } from 'src/produit/produit.entity';
import { Acheters } from 'src/acheter/acheter.entity';
@Injectable()
export class ListSuggService {
    constructor(
        @InjectRepository(Listesuggs)
        private listeSuggRepository: Repository<Listesuggs>,
        @InjectRepository(Acheters)
        private achetersRepository: Repository<Acheters>,
        @InjectRepository(Produits)
        private produitsRepository: Repository<Produits>,
      ) {}
     
    findOne(idListeSugg:number):Promise<Listesuggs | null>{
        return this.listeSuggRepository.findOneBy({idListeSugg});
    }

    findAll():Promise<Listesuggs[]>{
        return this.listeSuggRepository.find();
    }

    create(liste: CreateListSugg){
        const newliste = this.listeSuggRepository.create({
            ...liste,

        });
        return this.listeSuggRepository.save(newliste);
    }

    async remove(idListeSugg: number): Promise<void> {
        await this.listeSuggRepository.delete(idListeSugg);
    }
    async update(idListeSugg : number, liste:UpdateListSugg) {
        return await this.listeSuggRepository.update({idListeSugg}, {
            ...liste
        });
    }
    async getIdProduitsByListeEtatEffectuer(listeId: number): Promise<number[]> {
        const acheters = await this.achetersRepository.createQueryBuilder('acheter')
          .innerJoinAndSelect('acheter.produit', 'produit')
          .innerJoinAndSelect('acheter.liste', 'liste')
          .where('liste.idListe = :id AND liste.etat = :etat', {id: listeId, etat: 'effectuer'})
          .getMany();
    
        return acheters.map(acheter => acheter.produit.idP);
      }
    
      async getProduitsByListesEtatEffectuer(): Promise<Produits[]> {
        const produits = await this.produitsRepository.createQueryBuilder('produit')
          .innerJoin('produit.achats', 'achat')
          .innerJoin('achat.liste', 'liste')
          .where('liste.etat = :etat', { etat: 'effectuer' })
          .getMany();
    
        return produits;
      }

      async findIdProduitsWithEffectue(): Promise<number[]> {
        const acheters = await this.achetersRepository.createQueryBuilder('acheters')
          .leftJoinAndSelect('acheters.liste', 'liste')
          .where('liste.etat = :etat', { etat: 'effectuer' })
          .getMany();
    
        const idProduits: number[] = [];
        acheters.forEach((achat) => {
          if (!idProduits.includes(achat.produit.idP)) {
            idProduits.push(achat.produit.idP);
          }
        });
        return idProduits;
  }
}
