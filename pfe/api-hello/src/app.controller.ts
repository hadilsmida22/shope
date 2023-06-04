import { Controller, Get, Post, UseGuards,Request } from '@nestjs/common';
import { AppService } from './app.service';
import { AuthService } from './auth/auth.service';
import { AuthGuard } from '@nestjs/passport';
@Controller()
export class AppController {
  constructor(private authService: AuthService) {}

  @Get('health-check')
  checkHealth(): string {
    return 'Application is running';
  }

  @Post('auth/login')
  @UseGuards(AuthGuard('local'))
  async login(@Request() req) {
    return await this.authService.login(req.user);
  }
}
