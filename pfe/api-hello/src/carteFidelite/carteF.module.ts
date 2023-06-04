import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CarteController } from './carteF.controller';
import { Cartes } from './carteF.entity';
import { CarteService } from './carteF.service';
import { Enseignes } from 'src/enseigne/enseigne.entity';
import { User } from 'src/user/user.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Cartes,Enseignes,User])],
  controllers: [CarteController],
  providers: [CarteService]
})
export class CartesModule {}