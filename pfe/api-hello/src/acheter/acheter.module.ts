import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Acheters } from './acheter.entity';
import { AchetersController } from './acheter.controller';
import { AchetersService } from './acheter.service';
import { Produits } from 'src/produit/produit.entity';
import { ProduitService } from 'src/produit/produit.service';
import { Listes } from 'src/liste/liste.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Acheters,Produits,Listes])],
  controllers: [AchetersController],
  providers: [AchetersService,ProduitService]
})
export class AchetersModule {}