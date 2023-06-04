import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { JwtPayload } from './jwt-auth.strategy';

@Injectable()
export class JwtAuthService {
  constructor(private jwtService: JwtService) {}

  login(user) {
    const payload: JwtPayload = {
      username: user.username,
      sub: user.id,
      role: user.role,
      adresseIP: user.adresseIP,
    };
    return {
      accessToken: this.jwtService.sign(payload),
    };
  }
}