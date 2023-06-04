import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { images } from './image.entity';
import { CreateImage } from './dto/create-image.dto';
import { UpdateImage } from './dto/update-image.dto';
import { Image } from './interfaces/image.interface';
@Injectable()
export class ImageService {
    constructor(
        @InjectRepository(images)
        private imgRepository: Repository<images>,
      ) {}

    findOne(idImage:number):Promise<images | null>{
        return this.imgRepository.findOneBy({idImage});
    }

    findAll():Promise<Image[]>{
        return this.imgRepository.find();
    }

    create(img: CreateImage){
        const newimg = this.imgRepository.create({
            ...img,

        });
        return this.imgRepository.save(newimg);
    }

    async remove(idImage: number): Promise<void> {
        await this.imgRepository.delete(idImage);
    }
    async update(idImage : number, img:UpdateImage) {
        return await this.imgRepository.update({idImage}, {
            ...img
        });
      }
}
