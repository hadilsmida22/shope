import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ListService } from './liste.service';
import { ListController } from './liste.controller';
import { Listes } from './liste.entity';
import { Produits } from 'src/produit/produit.entity';
import { Acheters } from 'src/acheter/acheter.entity';
import { User } from 'src/user/user.entity';
import { MailerService } from 'src/mail/mail.service';
import { UserService } from 'src/user/user.service';
import { RayonService } from 'src/rayon/rayon.service';
import { Rayons } from 'src/rayon/rayon.entity';
import { CategorieService } from 'src/categorie/categorie.service';
import { Categories } from 'src/categorie/categorie.entity';
import { AchetersService } from 'src/acheter/acheter.service';


@Module({
  imports: [TypeOrmModule.forFeature([Listes,Produits,Acheters,User,Rayons,Categories])],
  controllers: [ListController],
  providers: [ListService,MailerService,UserService,RayonService,CategorieService,AchetersService]
})
export class listesModule {}