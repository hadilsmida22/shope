import { Module } from '@nestjs/common';
import { AuthService } from './auth.service';
import { PassportModule } from '@nestjs/passport';
import { JwtModule } from '@nestjs/jwt';
import { LocalStrategy } from './local.strategy';
import { JwtStrategy } from './jwt.strategy';

import { config } from '../config/jwt.config';
import { UsersModule } from 'src/user/user.module';
import { RolesGuard } from './roles.guard';
import { JwtAuthGuard } from './jwt-auth.guard';

@Module({
  imports: [UsersModule, PassportModule, JwtModule.register(config)],
  providers: [AuthService, LocalStrategy, JwtStrategy,RolesGuard,JwtAuthGuard],
  exports: [AuthService, LocalStrategy, JwtStrategy],
})
export class AuthModule {}
