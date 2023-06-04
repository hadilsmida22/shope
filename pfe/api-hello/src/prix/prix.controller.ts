import { Controller ,Get, Post, Body, Param, Patch, Delete} from '@nestjs/common';
import { Produits } from 'src/produit/produit.entity';
import { PrixService } from './prix.service';


@Controller('prix')
export class PrixController {
    constructor( private readonly prixService: PrixService){}
  @Get(':id')
  async findOne(@Param('id') id: number){
    return await this.prixService.findOne(id);
  }
}