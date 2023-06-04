import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Prix } from './prix.entity';

@Injectable()
export class PrixService {
    constructor(
        @InjectRepository(Prix)
        private listeRepository: Repository<Prix>,
   ) {}

   async findOne(id: number): Promise<Prix> {
    return await this.listeRepository.findOneBy({ idPrix : id});
}
}