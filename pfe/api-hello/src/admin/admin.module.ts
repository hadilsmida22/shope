import { Module } from '@nestjs/common';
import { AdminController } from './admin.controller';
import { Admins } from './admin.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AdminService } from './admin.service';
import { Rayons } from 'src/rayon/rayon.entity';
import { Categories } from 'src/categorie/categorie.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Admins,Rayons,Categories])],
  controllers: [AdminController],
  providers: [AdminService]
})
export class AdminsModule {}