import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Produits } from './produit.entity';
import { CreateProduit } from './dto/create-pdt.dto';
import { UpdateProduit } from './dto/update-pdt.dto';
import { Acheters } from 'src/acheter/acheter.entity';
import { Listes } from 'src/liste/liste.entity';
@Injectable()
export class ProduitService {
    constructor(
        @InjectRepository(Produits)
        private pdtRepository: Repository<Produits>,
        @InjectRepository(Acheters)
         private readonly achetersRepository: Repository<Acheters>,
        @InjectRepository(Listes)
         private readonly listeRepository: Repository<Listes>,
    ) {}

    findOne(idP:number):Promise<Produits | null>{
        return this.pdtRepository.findOneBy({idP});
    }

    getByLibelle(libelle:string):Promise<Produits | null>{
        return this.pdtRepository.findOneBy({libelle});
    }

    findAll():Promise<Produits[]>{
        return this.pdtRepository.find();
    }

    create(pdt: CreateProduit){
        const newpdt = this.pdtRepository.create({
            ...pdt,

        });
        return this.pdtRepository.save(newpdt);
    }

    

    async remove(idP: number): Promise<void> {
        await this.pdtRepository.delete(idP);
    }
    async update(idP : number, pdt:UpdateProduit) {
        return await this.pdtRepository.update({idP}, {
            ...pdt
        });
    }

    async findByLibelle(libelle: string): Promise<{ marque: string, grammage: string }[]> {
        const queryBuilder = this.pdtRepository.createQueryBuilder('produit')
          .select(' produit.marque', 'marque')
          .addSelect('produit.grammage', 'grammage')
          .where('produit.libelle LIKE :libelle', { libelle: `%${libelle}%` });
    
        return queryBuilder.getRawMany<{ marque: string, grammage: string }>();
    }
    //bas prix du pdt --> admin
    async getProduct(libelle: string): Promise<Produits> {
      const keywords = libelle.split(' ');
      const product = await this.pdtRepository
        .createQueryBuilder('produits')
        .where(
          keywords
            .map((keyword, index) => (`produits.libelle ILIKE :keyword${index}`))
            .join(' OR '),
          keywords.reduce((params, keyword, index) => {
            params[`keyword${index}`] = `%${keyword}%`;
            return params;
          }, {})
        )
        .orderBy('produits.prixPdt', 'ASC')
        .getOne();
    
      if (!product) {
        throw new Error('Aucun produit trouvé avec ce libellé');
      }
      
      return product;
    }
    

    //Autre prix 
    async getProductsByLibelle(libelle: string): Promise<any[]> {
      if (libelle.includes('el')||libelle.includes('de')||libelle.includes('au')||libelle.includes('et')||libelle.includes('grand')||libelle.includes('modèle') ||libelle.includes('en')) {
        return this.getProductsByLibelle_de(libelle);
      } else {
        const keywords = libelle.split(' ');
    
        const query = this.pdtRepository.createQueryBuilder('produits')
          .select([
            'produits.idP as idP',
            'produits.libelle as libelle',
            'produits.grammage as grammage',
            'MIN(produits.prixPdt) as prixPdt',
            'produits.nomMagasin as nomMagasin'
          ])
          .where(
            keywords
              .map((keyword, index) => `(produits.libelle ILIKE :keyword${index})`)
              .join(' OR '),
            keywords.reduce((params, keyword, index) => {
              params[`keyword${index}`] = `%${keyword}%`;
              return params;
            }, {})
          )
          .groupBy('produits.idP, produits.libelle, produits.grammage, produits.nomMagasin')
          .orderBy('prixPdt', 'ASC')
          .getRawMany();
    
        return query;
      }
    }
    
    async getProductsByLibelle_de(libelle: string): Promise<any[]> {
      const query = this.pdtRepository.createQueryBuilder('produits')
        .select([
          'produits.idP as idP',
          'produits.libelle as libelle',
          'produits.grammage as grammage',
          'produits.prixPdt as prixPdt',
          'produits.nomMagasin as nomMagasin'
        ])
        .where('produits.libelle ILIKE :libelle', { libelle: `%${libelle}%` })
        .orderBy('produits.prixPdt', 'ASC')
        .getRawMany();
    
      return query;
    }
    
    
      
      
      
    async getRecentlyPurchasedProducts(): Promise<Produits[]> {
        return await this.pdtRepository.createQueryBuilder('produits')
          .select('DISTINCT produits.*')
          .innerJoin('produits.achats', 'a')
          .orderBy('a.dateAchat', 'DESC')
          .take(10)
          .getMany();
    }

    
    //mettre à jour un produit (pdt 9dim yatbdel bi pdt jdid)
    async updateProduit(oldProductId: number, newProductId: number): Promise<void> {
      const lastListeId = await this.listeRepository
        .createQueryBuilder('liste')
        .select('MAX(liste.idListe)', 'maxId')
        .where('liste.etat = :etat', { etat: 'en cours' })
        .getRawOne();
    
      const achetersToUpdate = await this.achetersRepository
        .createQueryBuilder('acheter')
        .leftJoinAndSelect('acheter.produit', 'produit')
        .leftJoin('acheter.liste', 'liste')
        .where('produit.idP = :oldProductId', { oldProductId })
        .andWhere('liste.idListe = :lastListeId', { lastListeId: lastListeId.maxId })
        .getMany();
    
      for (const acheter of achetersToUpdate) {
        if (acheter.produit) {
          acheter.produit.idP = newProductId;
          await this.achetersRepository.save(acheter);
        }
      }
    
      const updatedListe = await this.listeRepository.findOne({ 
        where: {
            idListe:lastListeId.maxId,
        },
        relations: ['achats', 'achats.produit']
      });
      if (updatedListe) {
        let total = 0;
        for (const achat of updatedListe.achats) {
          const productPrice = parseFloat(achat.produit.prixPdt.replace(/[^0-9\.]+/g, ""));
          total += productPrice * achat.quantite;
        }
        updatedListe.total = total;
    
        await this.listeRepository.save(updatedListe);
      }
    }
    
    async searchByLibelle(libelle: string): Promise<Produits[]> {
      const produits = await this.pdtRepository
        .createQueryBuilder('produit')
        .where('produit.libelle LIKE :libelle', { libelle: `%${libelle}%` })
        .getMany();
  
      return produits;
    }

    async addImageToProduit(produitId: number, imageUrl: string): Promise<Produits> {
      // Recherchez le produit correspondant à l'ID dans votre base de données ou référentiel
      const produit = await this.pdtRepository.findOne({ where: { idP: produitId } });
    
      if (!produit) {
        throw new NotFoundException('Le produit de id ${produitId} n existe pas');
      }
    
      // Associez l'URL de l'image au produit
      produit.image = imageUrl;
    
      // Enregistrez les modifications apportées au produit dans votre base de données ou référentiel
      await this.pdtRepository.save(produit);
    
      return produit;
    }
        
}
