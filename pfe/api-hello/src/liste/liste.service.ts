import { BadRequestException, Body, HttpException, HttpStatus, Injectable, NotFoundException, Param } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Listes } from './liste.entity';
import { Produits } from 'src/produit/produit.entity';
import { Acheters } from 'src/acheter/acheter.entity';
import { CreateList } from './dto/create-liste.dto';
import { User } from 'src/user/user.entity';
import { v4 as uuidv4 } from 'uuid';
@Injectable()
export class ListService {
    constructor(
        @InjectRepository(Listes)
        private  readonly listeRepository: Repository<Listes>,
        @InjectRepository(Produits)
        private readonly produitRepository: Repository<Produits>,
        @InjectRepository(Acheters)
        private readonly acheterRepository: Repository<Acheters>, 
        @InjectRepository(User)
        private readonly userRepository: Repository<User>,
   ) {}
      //creer liste en cours
      async ajouterListe(listeDto: CreateList): Promise<Listes | { utilisateur: User }> {
        const utilisateur = await this.userRepository.findOne({
          where: {
            adresseIP: listeDto.adresseIP,
          },
        });
      
        if (!utilisateur) {
          return { utilisateur: null };
          // ou bien, pour créer un nouvel utilisateur
          // const nouvelUtilisateur = new Utilisateurs();
          // nouvelUtilisateur.nom = listeDto.nomUtilisateur;
          // nouvelUtilisateur.email = listeDto.emailUtilisateur;
          // const utilisateurCree = await this.userRepository.save(nouvelUtilisateur);
          // utilisateur = utilisateurCree;
        }
      
        const nouvelleListe = new Listes();
        nouvelleListe.idListe = listeDto.idListe;
        nouvelleListe.dateCreation = new Date();
        nouvelleListe.etat = listeDto.etat || 'en cours';
        nouvelleListe.total = parseInt(listeDto.total) || 0;
        nouvelleListe.inter_ = utilisateur;
      
        const listeCreee = await this.listeRepository.save(nouvelleListe);
        return listeCreee;
      }

    //ajouter un produit dans la liste en cours
    async addProduitToListe(idProduit: number, quantite: number): Promise<void> {
      const lastListe = await this.listeRepository.find({ order: { idListe: 'DESC' }, take: 1 });
      const produit = await this.produitRepository.findOne({ where: { idP: idProduit } });
      if (!lastListe || lastListe.length === 0) throw new NotFoundException('No list found');
      const lastListeObject = lastListe[0];
      if (!produit) throw new NotFoundException('Produit not found');
      let productInList = await this.acheterRepository.createQueryBuilder('Acheters')
        .leftJoinAndSelect('Acheters.liste', 'liste')
        .leftJoinAndSelect('Acheters.produit', 'produit')
        .where('liste.idListe = :idListe', { idListe: lastListeObject.idListe })
        .andWhere('produit.idP = :idProduit', { idProduit: idProduit })
        .getOne();
      if (productInList) {
        productInList.quantite += quantite;
      } else {
        productInList = new Acheters();
        productInList.liste = lastListeObject;
        productInList.produit = produit;
        productInList.quantite = quantite;
        productInList.acheterNonAcheter = false;
      }
      await this.acheterRepository.save(productInList);
      const price_String = produit.prixPdt;
      const price_float = parseFloat(price_String.replace(/[^0-9\.]+/g, ""));
      lastListeObject.total += price_float * quantite;
      await this.listeRepository.save(lastListeObject);
    }
    /*async addProduitToListe_id(idListe: number, idProduit: number, quantite: number): Promise<void> {
        const liste = await this.listeRepository.findOneBy({idListe:idListe});
        const produit = await this.produitRepository.findOneBy({idP:idProduit});
        if (!liste) throw new NotFoundException('Liste not found');
        if (!produit) throw new NotFoundException('Produit not found');
        let productInList = await this.acheterRepository.createQueryBuilder('Acheters')
            .leftJoinAndSelect('Acheters.liste', 'liste')
            .leftJoinAndSelect('Acheters.produit', 'produit')
            .where('liste.idListe = :idListe', {idListe })
            .andWhere('produit.idP = :idProduit',{idProduit })
            .getOne();
        if (productInList) {
          productInList.quantite += quantite;
        } else {
          productInList = new Acheters();
          productInList.liste = liste;
          productInList.produit = produit;
          productInList.quantite = quantite;
          productInList.acheterNonAcheter = false;
        }
    
        await this.acheterRepository.save(productInList);
        const price_String=produit.prixPdt;
        const price_float=parseFloat(price_String.replace(/[^0-9\.]+/g, ""));
        liste.total += price_float * quantite;
        await this.listeRepository.save(liste);
      }*/

      async removeProduitFromListe( idProduit: number): Promise<void> {
        const lastList = await this.listeRepository.find({ order: { idListe: 'DESC' }, take: 1 });
          const produit = await this.produitRepository.findOneBy({idP:idProduit});
          if (!lastList || lastList.length === 0) throw new NotFoundException('No list found');
          const lastListeObject = lastList[0];
        if (!produit) throw new NotFoundException('Produit not found');
    
        const productInList = await this.acheterRepository.createQueryBuilder('Acheters')
            .leftJoinAndSelect('Acheters.liste', 'liste')
            .leftJoinAndSelect('Acheters.produit', 'produit')
            .where('liste.idListe = :idListe', { idListe: lastListeObject.idListe })
            .andWhere('produit.idP = :idProduit', {idProduit })
            .getOne();
    
        if (!productInList) throw new NotFoundException('Produit not found in liste');
        await this.acheterRepository.remove(productInList);
        const price_String = produit.prixPdt;
        const price_float =  parseFloat(price_String.replace(/[^0-9\.]+/g, ""));
        lastListeObject.total -= price_float * productInList.quantite;
        await this.listeRepository.save(lastList);
      }

    //recuperer mes listes
    async getLists(adresseIP: string): Promise<Listes[]> {
      const listes = await this.listeRepository.createQueryBuilder('liste')
        .leftJoinAndSelect('liste.inter_', 'user') // Effectue une jointure avec l'entité User et définit l'alias 'inter_'
        .where('liste.etat != :etatEnCours', { etatEnCours: 'en cours' })
        .andWhere('user.adresseIP = :adresseIP', { adresseIP })
        .orderBy('liste.dateCreation', 'DESC')
        .getMany();
    
      return listes;
    }
    
    
    
    
    //recuperer la liste avec tous les achats
    async getListById(id: number): Promise<Listes> {
        const liste = await this.listeRepository.findOne({
            where: {
              idListe: id,
            },
            relations: ['achats'],
          });
        if (!liste) throw new NotFoundException('Liste not found');
        return liste;
    }

    //lorsque j'achete le pdt je le crocher=true et verifier l'etat
    async acheterProduit(listeId: number, achatId: number): Promise<void> {
      const achat = await this.acheterRepository.findOneOrFail({
        where: {
          idAchete: achatId,
          liste: { idListe: listeId },
        },
      });
    
      const liste = await this.listeRepository.findOneOrFail({
        where: { idListe: listeId },
        relations: ['achats'],
      });
    
      if (!achat.acheterNonAcheter) {
        achat.acheterNonAcheter = true;
        await this.acheterRepository.save(achat);
      }
    
      const tousAchete = liste.achats.every((achat) => achat.acheterNonAcheter === true);
      const someAchete = liste.achats.some((achat) => achat.acheterNonAcheter === true);
      const aucunAchete = liste.achats.every((achat) => achat.acheterNonAcheter === false);
    
      if (tousAchete) {
        liste.etat = 'effectuer';
      } else if (someAchete || aucunAchete) {
        liste.etat = 'non effectuer';
      }
    
      await this.listeRepository.save(liste);
    }
    
    

    //supprimer une liste
    async delete(id: number): Promise<void> {
      await this.listeRepository.delete(id);
    }

    //quand en clic boutton terminer la liste en cours devienne une liste non effectuer
    async terminerListe(): Promise<void> {
      const lastList = await this.listeRepository.createQueryBuilder('liste')
        .leftJoinAndSelect('liste.achats', 'achats')
        .orderBy('liste.idListe', 'DESC')
        .getOne();
    
      if (!lastList) {
        throw new NotFoundException('No list found');
      }
      const tousAchetes = lastList.achats.every((achat) => achat.acheterNonAcheter === false);
      if (tousAchetes) {
        lastList.etat = 'non effectuer';
        await this.listeRepository.save(lastList);
      }
    }


    
    async getListesEffectuees(): Promise<string[]> {
      const listes = await this.listeRepository.createQueryBuilder('liste')
        .leftJoinAndSelect('liste.achats', 'achat')
        .leftJoinAndSelect('achat.produit', 'produit')
        .where('liste.etat = :etat', { etat: 'effectuer' })
        .getMany();
    
      const result = listes.flatMap(liste => liste.achats.map(achat => achat.produit.libelle));
    
      return result;
    }
    
    //jointure  entre les 3 tables "liste effecuer" 
    async findAllListesWithProduitsAndAchetersEffectues(): Promise<Listes[]> {
      const listes = await this.listeRepository
        .createQueryBuilder('listes')
        .leftJoinAndSelect('listes.achats', 'achats')
        .leftJoinAndSelect('achats.produit', 'produits')
        .where('listes.etat = :etat', { etat: 'effectuer' })
        .getMany();
    
      return listes;
    }
    
    
    //get les libelle  des 3 produits les plus utlises
    async getTop3Produits(adresseIP: string): Promise<Produits[]> {
      const results = await this.listeRepository.createQueryBuilder('liste')
        .leftJoinAndSelect('liste.achats', 'achat')
        .leftJoinAndSelect('achat.produit', 'produit')
        .leftJoinAndSelect('liste.inter_', 'user') 
        .where('liste.etat = :etat', { etat: 'effectuer' })
        .andWhere('user.adresseIP = :adresseIP', { adresseIP })
        .select(['produit.idP', 'produit.marque', 'produit.libelle', 'produit.grammage', 'produit.prixPdt', 'produit.nomMagasin','produit.image'])
        .addSelect('COUNT(produit.idP)', 'count')
        .groupBy('produit.idP')
        .orderBy('count', 'DESC')
        .limit(5)
        .getRawMany();
    
      const produits: Produits[] = [];
    
      for (const result of results) {
        const produit = new Produits();
        produit.idP = result.produit_idP;
        produit.marque = result.produit_marque;
        produit.libelle = result.produit_libelle;
        produit.grammage = result.produit_grammage;
        produit.prixPdt = result.produit_prixPdt;
        produit.nomMagasin = result.produit_nomMagasin;
        produit.image = result.produit_image;
        produits.push(produit);
        }
        return produits;
    }

    
    //changer etat de non effectuer a effectuer 
    async changerEtatListe(id: number): Promise<void> {
      const liste = await this.listeRepository.findOneOrFail({
        where: { idListe: id },
        relations: ['achats'],
      });
    }

    //jointure  entre les 3 tables "liste effecuer" 
    async findListesWithProduits(): Promise<Listes[]> {
      const lastListe = await this.listeRepository.find({ order: { idListe: 'DESC' } , take: 1 });
      if (!lastListe || lastListe.length === 0) throw new NotFoundException('No list found');
      const lastListeObject = lastListe[0];
      
      const listes = await this.listeRepository
        .createQueryBuilder('listes')
        .leftJoinAndSelect('listes.achats', 'achats')
        .leftJoinAndSelect('achats.produit', 'produits')
        .where(' listes.idListe = :idListe', {  idListe: lastListeObject.idListe })
        .getMany();
    
      return listes;
    }
    
    //elle m'affiche tous les pdts de la derniere  listes  (juste les libelles ) 
    async  getListeProduitsDerniereListe(): Promise<string[]> {
      const lastListe = await this.listeRepository.find({ order: { idListe: 'DESC' } });
      if (!lastListe) {
        return []; // Si la dernière liste n'existe pas, on renvoie un tableau vide.
      }
      const listes = await this.listeRepository.createQueryBuilder('liste')
      .leftJoinAndSelect('liste.achats', 'achat')
      .leftJoinAndSelect('achat.produit', 'produit')
      .orderBy('liste.idListe', 'DESC')
      .take(1)  // limit the results to the first row
      .getMany();
      const result = listes.flatMap(liste => liste.achats.map(achat => achat.produit.libelle));
      return result;
    }

    //get liste by id touts deatils liste+ pdt (maintenat les libelles pdt de id liste khw seulement.)
   async getListeDetailsById(id: number): Promise<any> {
    const list = await this.listeRepository.findOne({ 
      where: {
          idListe:id,
      },
      relations: ['achats', 'achats.produit']
    });
    if (!list) {
      throw new NotFoundException('List with id ${id} not found');
    }
     
    const produits = list.achats.map((achat) => achat.produit.libelle);
    return {
      idListe: list.idListe,
      //dateCreation: list.dateCreation,
      //etat: list.etat,
      //total: list.total,
     
      produits: produits
    };
  } 

  async getProduits_List(idListe: number): Promise<string[]> {
    const lastListe = await this.listeRepository.findOne({ where: { idListe }, order: { idListe: 'DESC' } });
    if (!lastListe) {
      return []; // Si la dernière liste n'existe pas, on renvoie un tableau vide.
    }
    const listes = await this.listeRepository.createQueryBuilder('liste')
      .leftJoinAndSelect('liste.achats', 'achat')
      .leftJoinAndSelect('achat.produit', 'produit')
      .where('liste.idListe = :idListe', { idListe })
      .orderBy('liste.idListe', 'DESC')
      .take(1)  // limit the results to the first row
      .getMany();
    const result = listes.flatMap(liste => liste.achats.map(achat => achat.produit.libelle));
    return result;
  }
  
  async findListesWithProduits_id(id: number): Promise<Listes[]> {
    const liste = await this.listeRepository.findOne({ 
      where: {
          idListe:id,
      },
      relations: ['achats', 'achats.produit']
    });
  
    if (!liste) {
      throw new NotFoundException('List not found');
    }
  
    return [liste];
  }

  //lorsque j'achete le pdt je le crocher=true et verifier l'etat
  async acheterrtousProduit(listeId: number): Promise<void> {
    const liste = await this.listeRepository.findOneOrFail({
      where: { idListe: listeId },
      relations: ['achats'],
    });
  
    let tousAchete = true;
    for (const achat of liste.achats) {
      if (!achat.acheterNonAcheter) {
        achat.acheterNonAcheter = true;
        await this.acheterRepository.save(achat);
      }
      if (!achat.acheterNonAcheter) {
        tousAchete = false;
      }
    }
  
    if (tousAchete) {
      liste.etat = 'effectuer';
    } else {
      liste.etat = 'non effectuer';
    }
  
    await this.listeRepository.save(liste);
  }
  
  //creer liste en cours liste sugg avec 5 produits les plus utliseés 
  async creerListeSugg(listeDto: CreateList): Promise<Listes | { utilisateur: User }> {
    const utilisateur = await this.userRepository.findOne({
      where: {
        adresseIP: listeDto.adresseIP,
      },
    });
    if (!utilisateur) {
      return { utilisateur: null };
    }

    const nouvelleListe = new Listes();
    nouvelleListe.idListe = listeDto.idListe;
    nouvelleListe.dateCreation = new Date();
    nouvelleListe.etat = listeDto.etat || 'en cours';
    nouvelleListe.total = parseInt(listeDto.total) || 0;
    nouvelleListe.inter_ = utilisateur;

    const listeCreee = await this.listeRepository.save(nouvelleListe);
    const topProduits = await this.getTop3Produits(utilisateur.adresseIP);
   
  for (const produit of topProduits) {
    const acheteur = new Acheters();
    acheteur.acheterNonAcheter = false; // Assuming it's always set to true
    acheteur.produit = produit;
    acheteur.liste = listeCreee;
    acheteur.quantite = 1; // Set the desired quantity
    

    await this.acheterRepository.save(acheteur);
    const price_String = produit.prixPdt;
    const price_float = parseFloat(price_String.replace(/[^0-9\.]+/g, ""));
    listeCreee.total += price_float * acheteur.quantite;
  }
  await this.listeRepository.save(listeCreee);
  return {
    produits: topProduits,
    ...listeCreee,
  };
 }

 async reutiliserListe(id :number,listeDto: CreateList ): Promise<Listes | { utilisateur: User }> {
  const utilisateur = await this.userRepository.findOne({
    where: {
      adresseIP: listeDto.adresseIP,
    },
  });
  if (!utilisateur) {
    return { utilisateur: null };
  }

  const nouvelleListe = new Listes();
  nouvelleListe.idListe = listeDto.idListe;
  nouvelleListe.dateCreation = new Date();
  nouvelleListe.etat = listeDto.etat || 'en cours';
  nouvelleListe.total = parseInt(listeDto.total) || 0;
  nouvelleListe.inter_ = utilisateur;
   const listeCreee = await this.listeRepository.save(nouvelleListe);
   const listeProduits = await this.findListesWithProduits_id(id);
   const achats = listeProduits[0].achats;
 
   for (const achat of achats) {
     const acheteur = new Acheters();
     acheteur.acheterNonAcheter = false;
     acheteur.produit = achat.produit;
     acheteur.liste = listeCreee;
     acheteur.quantite = achat.quantite;
 
     await this.acheterRepository.save(acheteur);
     const price_String = achat.produit.prixPdt;
     const price_float = parseFloat(price_String.replace(/[^0-9\.]+/g, ""));
     listeCreee.total += price_float * acheteur.quantite;
   }
   await this.listeRepository.save(listeCreee);
   return {
     produits: achats.map(achat => achat.produit),
     ...listeCreee,
   };
 }
 
 async addList(list: Listes): Promise<void> {
  await this.listeRepository.save(list);
}

async shareList(idListe: number, email: string): Promise<void> {
  const user = await this.userRepository.findOne({
    where: {
      email: email,
    },
  });

  if (!user) {
    throw new NotFoundException('Destinataire introuvable');
  }

  const liste = await this.findListesWithProduits_id(idListe);

  if (!liste || liste.length === 0) {
    throw new NotFoundException('Liste introuvable');
  }

  const nouvelleListe = new Listes();
  nouvelleListe.dateCreation = new Date();
  nouvelleListe.etat = 'partager';
  nouvelleListe.total = 0;
  nouvelleListe.inter_ = user;

  const listeCreee = await this.listeRepository.save(nouvelleListe);

  for (const achat of liste[0].achats) {
    if (!achat.produit) {
      throw new NotFoundException('Produit introuvable');
    }

    const nouvelAchat = new Acheters();
    nouvelAchat.acheterNonAcheter = false;
    nouvelAchat.produit = achat.produit;
    nouvelAchat.liste = listeCreee;
    nouvelAchat.quantite = achat.quantite;

    await this.acheterRepository.save(nouvelAchat);

    const priceString = achat.produit.prixPdt;
    const priceFloat = parseFloat(priceString.replace(/[^0-9\.]+/g, ""));
    listeCreee.total += priceFloat * nouvelAchat.quantite;
  }

  await this.listeRepository.save(listeCreee);
}


}
