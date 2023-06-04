import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { InternauteController } from './internaute.controller';
import { InternauteService } from './internaute.service';
import { internautes } from './internaute.entity';

@Module({
  imports: [TypeOrmModule.forFeature([internautes])],
  controllers: [InternauteController],
  providers: [InternauteService]
})
export class internautesModule {}