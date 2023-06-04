import { Injectable, NotFoundException } from "@nestjs/common";
import { Acheters } from "./acheter.entity";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { Listes } from "src/liste/liste.entity";
import { Produits } from "src/produit/produit.entity";

@Injectable()
export class AchetersService {
    constructor(
        @InjectRepository(Acheters)
        private acheteRepository: Repository<Acheters>,
        @InjectRepository(Listes)
        private listeRepository: Repository<Listes>,
        @InjectRepository(Produits)
        private produitRepository: Repository<Produits>,
      ) {}


    findOne(idAchete:number):Promise<Acheters>{
        return this.acheteRepository.findOneBy({idAchete});
    }

    async updateAcheter(id: number): Promise<Acheters> {
        const acheter = await this.acheteRepository.findOneOrFail({where: {idAchete: id}});
        acheter.acheterNonAcheter = true;
        return await this.acheteRepository.save(acheter);
    }
    
    async delete(id: number): Promise<void> {
        await this.acheteRepository.delete(id);
    }

    async addAcheters(acheters: Acheters): Promise<Acheters> {
        return this.acheteRepository.save(acheters); // Use the save method of AchetersRepository
    }

    async getEtatAchat(idListe: number, idAchats: number): Promise<boolean> {
        // Effectuer la logique pour récupérer l'état d'achat à partir des paramètres
        const achat = await this.acheteRepository.findOneOrFail({
          where: {
            idAchete: idAchats,
            liste: { idListe },
          },
        });
    
        return achat.acheterNonAcheter;
    }
    async findAchatWithRelations(idAchat: number): Promise<Acheters> {
        return this.acheteRepository
          .createQueryBuilder('achat')
          .leftJoinAndSelect('achat.produit', 'produit')
          .leftJoinAndSelect('achat.liste', 'liste')
          .where('achat.idAchete = :idAchat', { idAchat })
          .getOne();
      }
      
      async updateAchatQuantite(idAchat: number, quantite: number): Promise<void> {
        const achat = await this.findAchatWithRelations(idAchat);
      
        if (!achat) {
          throw new NotFoundException('Achat not found');
        }
      
        // Mettez à jour le total de la liste
        const liste = achat.liste;
      
        if (!liste) {
          throw new NotFoundException('Liste not found');
        }
      
        const ancienneQuantite = achat.quantite;
        const prix = parseFloat(achat.produit.prixPdt.replace(/[^0-9\.]+/g, ''));
        const ancienTotal = liste.total || 0;
        const nouveauTotal = ancienTotal - ancienneQuantite * prix + quantite * prix;
        liste.total = nouveauTotal;
      
        // Mettez à jour la quantité de l'achat
        achat.quantite = quantite;
        await this.acheteRepository.save(achat);
      
        await this.listeRepository.save(liste);
      }
      
      
    /*async updateAchatQuantite(idAchat: number, quantite: number): Promise<void> {
        const achat = await this.acheteRepository.findOne({
            where: {
              idAchete: idAchat,
            },
          });
        if (!achat) {
          throw new NotFoundException('Achat not found');
        }
    
        achat.quantite = quantite;
        await this.acheteRepository.save(achat);
    
        const liste = await this.listeRepository.findOne({
            where: {
              idListe: achat.liste.idListe,
            },
          });
        if (!liste) {
          throw new NotFoundException('Liste not found');
        }
    
        const produit = await this.produitRepository.findOne({
            where: {
              idP: achat.produit.idP,
            },
          });
        if (!produit) {
          throw new NotFoundException('Produit not found');
        }
    
        const prix = parseFloat(produit.prixPdt.replace(/[^0-9\.]+/g, ''));
        const ancienTotal = liste.total;
        const nouveauTotal = ancienTotal - achat.quantite * prix + quantite * prix;
        liste.total = nouveauTotal;
        await this.listeRepository.save(liste);
      }*/
}