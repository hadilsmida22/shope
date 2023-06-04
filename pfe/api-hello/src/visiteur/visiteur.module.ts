import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { VisiteurController } from './visiteur.controller';
import { visiteurs } from './visiteur.entity';
import { VisiteurService } from './visiteur.service';

@Module({
  imports: [TypeOrmModule.forFeature([visiteurs])],
  controllers: [VisiteurController],
  providers: [VisiteurService]
})
export class visiteursModule {}