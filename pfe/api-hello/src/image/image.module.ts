import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ImageService } from './image.service';
import { ImageController } from './image.controller';
import { images } from './image.entity';

@Module({
  imports: [TypeOrmModule.forFeature([images])],
  controllers: [ImageController],
  providers: [ImageService]
})
export class imagesModule {}