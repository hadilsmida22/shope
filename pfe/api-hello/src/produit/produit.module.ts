import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ProduitService } from './produit.service';
import { ProduitController } from './produit.controller';
import { Produits } from './produit.entity';
import { Acheters } from 'src/acheter/acheter.entity';
import { Listes } from 'src/liste/liste.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Produits,Acheters,Listes])],
  controllers: [ProduitController],
  providers: [ProduitService]
})
export class produitsModule {}