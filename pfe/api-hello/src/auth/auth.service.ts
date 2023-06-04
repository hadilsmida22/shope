import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { UserService } from 'src/user/user.service';
import { Role } from './enums/user-role.enum';

@Injectable()
export class AuthService {
  constructor(
    private userService: UserService,
    private jwtService: JwtService,
  ) {}
  async validateUserByEmailAndPassword(
    email: string,
    password: string,
  ): Promise<any> {
    const user = await this.userService.findByEmail(email);
    if (user && (await user.checkPassword(password))) {
      const { password, ...rest } = user;
      return rest;
    }
    return null;
  }

  

  async login(user: any) {
    
  if (user && user.email) {
    const userFound = await this.userService.findByEmail(
      user.email,
    );
    const payload = {
      email: user.email,
      sub: user.userId,
      role: Role.CLIENT,
      adresseIP:user.adresseIP,
    };
    return {
      ...userFound,
      access_token: this.jwtService.sign(payload),
    };
  }
  throw new UnauthorizedException('Invalid credentials');
}


  async validateUser(email: string, pass: string): Promise<any> {
    const user = await this.userService.findOne(email);
    const isValid = await user.checkPassword(pass);
    if (isValid) {
      const { password, ...result } = user;
      result.role = Role.CLIENT;
      return result;
    }
    return null;
  }
}
