import { Controller ,Get, Post, Body, Param, Patch, Delete, UsePipes, UseGuards, ValidationPipe} from '@nestjs/common';
import { RayonService } from './rayon.service';
import { CreateRayon } from './dto/create-rayon.dto';
import { UpdateRayon } from './dto/update-rayon.dto';
import { Rayons } from './rayon.entity';
import { AdminService } from 'src/admin/admin.service';
import { Categories } from 'src/categorie/categorie.entity';
import { Roles } from 'src/auth/enums/roles.decorator';
import { Role } from 'src/auth/enums/user-role.enum';
import { JwtAuthGuard } from 'src/auth/jwt-auth.guard';
import { RolesGuard } from 'src/auth/roles.guard';
import { AuthGuard } from '@nestjs/passport';

@Controller('rayon')
export class RayonController {
    constructor( private readonly rayonService: RayonService){}
  @Get(':id')
  findOne(@Param('id') idR:number){
    return this.rayonService.findOne(idR);
  }
  
  @Get()
  findAll():Promise<Rayons[]>{
    return this.rayonService.findAll();
  }


  @Post('/newrayon')
  //@Roles(Role.)
 // @UseGuards(JwtAuthGuard,RolesGuard)
  @UsePipes(ValidationPipe)
  createRayon(@Body() newrayon:CreateRayon){
    this.rayonService.create(newrayon);
  }

  
  //@Roles(Role.ADMIN)
  //@UseGuards(JwtAuthGuard,RolesGuard)
  @Patch(':id')
  @UsePipes(ValidationPipe)
  updateRayon(@Param('id') idR: number,@Body() rayon: UpdateRayon){
    return this.rayonService.update(idR,rayon);
  }

  
  //@Roles(Role.ADMIN)
  //@UseGuards(JwtAuthGuard,RolesGuard)
  @Delete(':id')
  deleteRayon(@Param('id') idR:number): Promise<void>{
    return this.rayonService.remove(idR);
  }

  @Post(':rayonId/categorie/:categorieId')
  async addCategorieToRayon(
    @Param('rayonId') rayonId: number,
    @Param('categorieId') categorieId: number,
  ): Promise<Rayons> {
    return this.rayonService.addCategorieToRayon(rayonId, categorieId);
  }
}
