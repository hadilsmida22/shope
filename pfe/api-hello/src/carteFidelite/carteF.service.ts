import { ConflictException, Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Cartes } from './carteF.entity';
import { CreateCarte } from './dto/create-carte.dto';
import { UpdateCarte } from './dto/update-carte.dto';
import { Enseignes } from 'src/enseigne/enseigne.entity';
import { CreateEnseigne } from 'src/enseigne/dto/create-ensg.dto';
import { User } from 'src/user/user.entity';
import { v4 as uuidv4 } from 'uuid';
@Injectable()
export class CarteService {
    constructor(
        @InjectRepository(Cartes)
        private carteRepository: Repository<Cartes>,
        @InjectRepository(Enseignes)
        private ensgRepository: Repository<Enseignes>,
        @InjectRepository(User)
        private userRepository: Repository<User>,
      ) {}

    //get carte by id 
    async getCarteById(id: number): Promise<Cartes> {
      const carte = await this.carteRepository.findOne({ 
        where: {
          idCart:id,
        },
        relations: ['enseigne']
      });
      
      if (!carte) {
        throw new NotFoundException('La carte ne existe pas.');
      }
      return carte;
    }
    
    trouverParNumero(numero: string):Promise<Cartes> {
        return this.carteRepository.findOneBy({numero});
    }

    async findAll(adresseIP: string): Promise<Cartes[]> {
      const cartes = await this.carteRepository.createQueryBuilder('cartes')
        .leftJoinAndSelect('cartes.inter_', 'inter')
        .leftJoinAndSelect('cartes.enseigne', 'enseigne') // Ajoutez cette ligne pour la jointure avec Enseignes
        .where('inter.adresseIP = :adresseIP', { adresseIP })
        .getMany();
    
      return cartes;
    }
    
    
    async supprimer(idCart: number): Promise<void> {
        await this.carteRepository.delete(idCart);
    }

    async create(numero: string): Promise<Cartes> {
        const carte = new Cartes();
        carte.numero = numero;
        return this.carteRepository.save(carte);
    }

    // post genat geant 2 fois non 
    async ajouterCarteFidelite(carteFidelite: CreateCarte): Promise<Cartes> {
      // Vérifier si l'utilisateur existe
      const utilisateur = await this.userRepository.findOne({
        where: {
          adresseIP: carteFidelite.adresseIP,
        },
      });
      if (!utilisateur) {
        throw new NotFoundException(`L'utilisateur avec l'ID ${carteFidelite.adresseIP} n'existe pas`);
      }
      // Vérifier si l'utilisateur a déjà une carte de fidélité avec le même nom de magasin
      const carteExistante = await this.carteRepository.findOne({
        where: {
          inter_: { idUser: utilisateur.idUser },
          nom: carteFidelite.nom,
        },
      });
      if (carteExistante) {
        throw new ConflictException(`L'utilisateur avec l'ID ${carteFidelite.adresseIP} a déjà une carte de fidélité pour le magasin ${carteFidelite.nom}`);
      }
    
      // Vérifier si une enseigne avec le nom de la carte de fidélité existe déjà
      const nomEnseigne = carteFidelite.nom;
      const enseigneExistante = await this.ensgRepository.findOne({
        where: { nomCommercial: nomEnseigne },
      });
    
      // Si l'enseigne n'existe pas encore, la créer avec le catalogue par défaut
      let enseigne: Enseignes;
      if (!enseigneExistante) {
        const nouvelleEnseigne = new CreateEnseigne();
        nouvelleEnseigne.nomCommercial = nomEnseigne;
        let catalogue = '';
        let image ='';
        if (nomEnseigne.includes('carrefour')) {
          catalogue = 'https://www.carrefour.tn/default/catalogslider/catalogpagedetails/catalogdetails?catalogueId=145';
          image ='https://www.hostblog.fr/wp-content/uploads/2020/03/carte-carrefour-code-pin-perdu.jpg'
        } else if (nomEnseigne.includes('geant')) {
          catalogue = 'https://www.geant.tn/catalogue_geant_tunisie-52.htm#book5/page1';
          image ='https://maxi.cdnartwhere.eu/wp-content/uploads/article/2016-01/casino-963x542-c-default.jpg?ck=37a6259cc0c1dae299a7866489dff0bd'
        } else if (nomEnseigne.includes('monoprix')){
          catalogue = 'https://www.monoprix.tn/bonnes-affaires';
          image='https://www.cartesdefidelite.fr/wp-content/uploads/2011/05/monoprix-fidelite-smiles.jpg'
        }
        nouvelleEnseigne.catalogue = catalogue;
        nouvelleEnseigne.image = image;
        const enseigneCreee = await this.ensgRepository.save(nouvelleEnseigne);
        enseigne = enseigneCreee;
      } else {
        enseigne = enseigneExistante;
      }
    
      // Generate a new unique ID for inter_ field
      const newUserId = uuidv4();
    
      // Créer une nouvelle carte de fidélité et l'associer à l'utilisateur et à l'enseigne correspondants
      const nouvelleCarteFidelite = new Cartes();
      nouvelleCarteFidelite.nom = carteFidelite.nom;
      nouvelleCarteFidelite.numero = carteFidelite.numero;
      nouvelleCarteFidelite.enseigne = enseigne;
      nouvelleCarteFidelite.inter_ = utilisateur;
      const carteFideliteCreee = await this.carteRepository.save(nouvelleCarteFidelite);
      return carteFideliteCreee;
    }
    
}
