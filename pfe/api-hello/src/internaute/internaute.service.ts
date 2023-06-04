import { Injectable, NotFoundException, Post, Req } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { internautes } from './internaute.entity';
//import { CreateInter } from './dto/create-inter.dto';
//import { UpdateInter } from './dto/update-inter.dto';
import * as useragent from 'useragent'; 
import * as UAParser from 'ua-parser-js';
import { request } from 'express';
@Injectable()
export class InternauteService {
    constructor(
        @InjectRepository(internautes)
        private interRepository: Repository<internautes>,
      ) {}

    async createInternaute(internaute: internautes): Promise<internautes> {
      return await this.interRepository.save(internaute);
    }  
  
  async getAllInternautes(): Promise<internautes[]> {
    return await this.interRepository.find();
  } 
    findOne(idInternaute:number):Promise<internautes | null>{
        return this.interRepository.findOneBy({idInternaute});
    }

    findAll():Promise<internautes[]>{
        return this.interRepository.find();
    }

    /*creatte(inter: CreateInter){
        const newinter = this.interRepository.create({
            ...inter,

        });
        return this.interRepository.save(newinter);
    }
    async create(inter: CreateInter): Promise<internautes> {
        return await this.interRepository.save(inter);
      }

    async remove(idInternaute: number): Promise<void> {
        await this.interRepository.delete(idInternaute);
    }
    async update(idInternaute : number, inter:UpdateInter) {
        return await this.interRepository.update({idInternaute}, {
            ...inter
        });
      }
      */
    }