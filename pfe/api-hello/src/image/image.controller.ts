import { Controller ,Get, Post, Body, Param, Patch, Delete} from '@nestjs/common';
import { Image } from './interfaces/image.interface';
import { CreateImage } from './dto/create-image.dto';
import { UpdateImage } from './dto/update-image.dto';
import { ImageService } from './image.service';

@Controller('image')
export class ImageController {
    constructor( private readonly imageService: ImageService){}
  @Get(':id')
  findOne(@Param('id') idImage:number){
    return this.imageService.findOne(idImage);
  }
  
  @Get()
  findAll():Promise<Image[]>{
    return this.imageService.findAll();
  }

  @Post()
  createTodo(@Body() newimg:CreateImage){
    this.imageService.create(newimg);
  }

  @Patch(':id')
  updateTodos(@Param('id') idImage: number,@Body() img: UpdateImage){
    return this.imageService.update(idImage,img);
  }

  @Delete(':id')
  deleteTodo(@Param('id') idImage:number): Promise<void>{
    return this.imageService.remove(idImage);
  }
}
