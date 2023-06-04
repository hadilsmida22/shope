import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { EnseigneService } from './enseigne.service';
import { EnseigneController } from './enseigne.controller';
import { Enseignes } from './enseigne.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Enseignes])],
  controllers: [EnseigneController],
  providers: [EnseigneService]
})
export class EnseignesModule {}