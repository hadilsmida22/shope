import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import {DeleteResult, Repository, UpdateResult } from 'typeorm';
import { Clients } from './client.entity';
import { CreateClient } from './dto/create-client.dto';
import { UpdateClient } from './dto/update-client.dto';

@Injectable()
export class ClientService {
    constructor(
        @InjectRepository(Clients)
        private clientRepository: Repository<Clients>,
      ) {}


    getAll(): Promise<Clients[]> {
         return this.clientRepository.find();
    }

    async findByEmail(email: string): Promise<Clients> {
        const response = await this.clientRepository.findOneBy({ email: email });
        if (response) {
            delete response.password;
            return response;
        }
    }

    async create(user: CreateClient): Promise<Clients> {
        const response = await this.clientRepository.save(user);
        delete response.password;
        return response;
    }

    update(id: number, user: UpdateClient): Promise<UpdateResult> {
        return this.clientRepository.update(id, user);
    }

    remove(id: number): Promise<DeleteResult> {
        return this.clientRepository.delete(id);
    }
    async findOne(username: string): Promise<Clients | undefined> {
        const user = await this.clientRepository.findOneBy({ email: username });
        return user;
    } 
}
