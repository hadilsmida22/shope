import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CategorieService } from './categorie.service';
import { CategorieController } from './categorie.controller';
import { Categories } from './categorie.entity';
import { Produits } from 'src/produit/produit.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Categories,Produits])],
  controllers: [CategorieController],
  providers: [CategorieService]
})
export class categoriesModule {}