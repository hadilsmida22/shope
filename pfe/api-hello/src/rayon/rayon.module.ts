import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { RayonService } from './rayon.service';
import { RayonController } from './rayon.controller';
import { Rayons } from './rayon.entity';
import { Categories } from 'src/categorie/categorie.entity';
import { Admins } from 'src/admin/admin.entity';
import { AdminService } from 'src/admin/admin.service';

@Module({
  imports: [TypeOrmModule.forFeature([Rayons,Categories])],
  controllers: [RayonController],
  providers: [RayonService]
})
export class rayonsModule {}