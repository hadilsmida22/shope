import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import {DeleteResult, Repository, UpdateResult } from 'typeorm';
import { User } from './user.entity';
import { CreateUser } from './dto/create-user.dto';
import { UpdateUser } from './dto/update-user.dto';
import { Role } from 'src/auth/enums/user-role.enum';
import { Rayons } from 'src/rayon/rayon.entity';
import { Categories } from 'src/categorie/categorie.entity';
import { v4 as uuidv4 } from 'uuid';
import * as bcrypt from 'bcrypt';
@Injectable()
export class UserService {
    constructor(
        @InjectRepository(User)
        private userRepository: Repository<User>,
        @InjectRepository(Rayons)
        private rayonRepository: Repository<Rayons>,
        @InjectRepository(Categories)
        private categorieRepository: Repository<Categories>,
      ) {}
    findById(idUser:string):Promise<User>{
        return this.userRepository.findOneBy({idUser});
    }
    

    getAll(): Promise<User[]> {
         return this.userRepository.find();
    }

    async findByEmail(email: string): Promise<User> {
        const response = await this.userRepository.findOneBy({ email: email });
        if (response) {
            delete response.password;
            return response;
        }
    }
    
    /*async updateRole(userId: number, newRole: string): Promise<void> {
        const userToUpdate = await this.userRepository.findOneOrFail({where:{idUser: userId} });
        userToUpdate.role = newRole;
        await this.userRepository.save(userToUpdate);
    }*/

    async create(user: CreateUser): Promise<User> {
        const response = await this.userRepository.save({
          ...user,
          //idUser: uuidv4(), // Ajoute l'UUID à l'utilisateur
        });
        console.log('Fin de la création de l\'utilisateur.');
        console.log('Utilisateur enregistré dans la base de données :', response);
        delete response.password;
        return response;
    }

    async updateUser(adrIp: string, email: string, password: string): Promise<User> {
      try {
        console.log('Updating user: adresseIp=', adrIp, ' email=', email);
    
        // Recherche de l'utilisateur dans la base de données
        const user = await this.userRepository.findOne({ where: { adresseIP: adrIp } });
        if (!user) {
          throw new Error('User not found');
        }
    
        // Mettre à jour les informations de l'utilisateur
        user.email = email;
        user.password = bcrypt.hashSync(password, parseInt(process.env.BCRYPT_SALT_ROUNDS, 10) || 10);
        user.role = Role.CLIENT;
    
        // Enregistrer les modifications dans la base de données
        const updatedUser = await this.userRepository.save(user);
        console.log('User updated: adresseIp=', adrIp);
    
        return updatedUser;
      } catch (error) {
        console.error('Failed to update user: userId=', adrIp, ' error=', error);
        throw error;
      }
    }
    

    update(id: string, user: UpdateUser): Promise<UpdateResult> {
        return this.userRepository.update(id, user);
    }

    remove(id: string): Promise<DeleteResult> {
        return this.userRepository.delete(id);
    }
    async findOne(username: string): Promise<User | undefined> {
        const user = await this.userRepository.findOneBy({ email: username });
        return user;
    } 
    
    async addCategorieToRayon(rayonId: number, categorieId: number): Promise<Rayons> {
        const rayon = await this.rayonRepository.findOne({
            where: {
              idR: rayonId,
            },
            relations: ['cat'],
          });
        const categorie = await this.categorieRepository.findOneBy({idCat: categorieId});
        rayon.cat.push(categorie);
        return this.rayonRepository.save(rayon);
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
    
    async  _checkUserExistsInDatabase(ipAddress: string): Promise<boolean> {
      // Importez votre modèle d'utilisateur (UserModel) et utilisez-le pour effectuer la vérification dans la base de données
    
      // Exemple d'utilisation d'un modèle d'utilisateur fictif
      const user = await this.userRepository.findOne({  where: {
        adresseIP: ipAddress,
      }, });
      if (user) {
        return true; // L'utilisateur existe dans la base de données
      } else {
        return false; // L'utilisateur n'existe pas dans la base de données
      }
    }
    
    async getUserByIpAddress(ipAddress: string): Promise<User> {
      const user = await this.userRepository.findOne({ where: { adresseIP: ipAddress } });
      if (!user) {
        throw new NotFoundException('User not found');
      }
      return user;
    }
    
    async getUserRoleByIpAddress(ipAddress: string): Promise<string> {
      try {
        const user = await this.getUserByIpAddress(ipAddress);
        return user.role;
      } catch (error) {
        // Gérer l'erreur NotFoundException ici
        if (error instanceof NotFoundException) {
          throw new NotFoundException('User not found');
        }
        throw error;
      }
    }
    
    async getUserByEmail(email: string): Promise<User> {
      return this.userRepository.findOne({ where: { email} });
    }
    
}
