import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { JwtStrategy } from 'src/auth/jwt.strategy';
import { User } from './user.entity';
import { UserController } from './user.controller';
import { UserService } from './user.service';
import { Rayons } from 'src/rayon/rayon.entity';
import { Categories } from 'src/categorie/categorie.entity';
import { RolesGuard } from 'src/auth/roles.guard';
import { APP_GUARD } from '@nestjs/core';

@Module({
  imports: [TypeOrmModule.forFeature([User,Rayons,Categories])],
  controllers: [UserController],
  providers: [UserService,JwtStrategy,RolesGuard],
  exports: [UserService],
})
export class UsersModule {}