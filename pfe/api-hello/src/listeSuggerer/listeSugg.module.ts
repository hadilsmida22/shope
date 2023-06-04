import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ListSuggService } from './listeSugg.service';
import { ListSuggController } from './listeSugg.controller';
import { Listesuggs } from './listeSugg.entity';
import { Produits } from 'src/produit/produit.entity';
import { Listes } from 'src/liste/liste.entity';
import { Acheters } from 'src/acheter/acheter.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Listesuggs,Produits,Listes,Acheters])],
  controllers: [ListSuggController],
  providers: [ListSuggService]
})
export class listesSuggModule {}