import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { internautesModule } from './internaute/internaute.module';
import { listesModule } from './liste/liste.module';
import { produitsModule } from './produit/produit.module';
import { ClientsModule } from './client/client.module';
import { ConfigModule } from '@nestjs/config';
import { PassportModule } from '@nestjs/passport';
import { config } from './config/orm.config';
import { APP_INTERCEPTOR } from '@nestjs/core';
import { ResponseInterceptor } from './interceptors/response/response.interceptor';
import { LocalStrategy } from './auth/local.strategy';
import { JwtStrategy } from './auth/jwt.strategy';
import { AuthModule } from './auth/auth.module';
import { AchetersModule } from './acheter/acheter.module';
import { CartesModule } from './carteFidelite/carteF.module';
import { EnseignesModule } from './enseigne/enseigne.module';
import { AdminsModule } from './admin/admin.module';
import { categoriesModule } from './categorie/categorie.module';
import { imagesModule } from './image/image.module';
import { listesSuggModule } from './listeSuggerer/listeSugg.module';
import { rayonsModule } from './rayon/rayon.module';
import { visiteursModule } from './visiteur/visiteur.module';
import { UsersModule } from './user/user.module';
import { AccessControlModule } from 'nest-access-control';
//import { roles } from './auth/enums/user-role.enum';
@Module({
  imports: [
    //internautesModule,
    listesModule,
    produitsModule,
    //ClientsModule,
    AchetersModule,
    CartesModule,
    UsersModule,
    EnseignesModule,
    //AdminsModule,
    categoriesModule,
    imagesModule,
    listesSuggModule,
    rayonsModule,
    //visiteursModule,
    ConfigModule.forRoot({ isGlobal: true }),
    TypeOrmModule.forRoot(config),
    AuthModule,
    //AccessControlModule.forRoles(roles),
    PassportModule.register({
      defaultStrategy: 'local',
    }),
],
  controllers: [AppController],
  providers: [AppService,
    {
      provide: APP_INTERCEPTOR,
      useClass: ResponseInterceptor,
    },
    LocalStrategy,
    JwtStrategy,],
})
export class AppModule {}
