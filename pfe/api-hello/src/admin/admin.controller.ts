import { Controller ,Get, Post, Body, Param, Patch, Delete} from '@nestjs/common';
import { CreateAdmin } from './dto/create-admin.dto';
import { UpdateAdmin } from './dto/update-admin.dto';
import { AdminService } from './admin.service';
import { Admins } from './admin.entity';
import { Rayons } from 'src/rayon/rayon.entity';
import { Categories } from 'src/categorie/categorie.entity';

@Controller('admin')
export class AdminController {
    constructor( private readonly adminService: AdminService){}
  
  @Get()
  findAll():Promise<Admins[]>{
    return this.adminService.findAll();
  }
  
  
  @Post()
  createAdmin(@Body() newAdmin:CreateAdmin){
    this.adminService.createAdmin(newAdmin);
  }

  @Post('rayon')
  createRayon(@Body() body: { nom: string }): Promise<Rayons>  {
    const rayon = this.adminService.createRayon(body.nom);
    return rayon;
  }

  @Post('categorie')
  createCategorie(@Body() body: { nom: string }):  Promise<Categories> {
    const categorie = this.adminService.createCategorie(body.nom);
    return categorie;
  }

  

  @Get(':rayonId/categories')
  async getCategoriesOfRayon(@Param('rayonId') rayonId: number): Promise<Categories[]> {
    return this.adminService.getCategoriesOfRayon(rayonId);
  }


  @Patch(':id')
  updateTodos(@Param('id') idAdm: number,@Body() admin: UpdateAdmin){
    return this.adminService.update(idAdm,admin);
  }

  @Delete(':id')
  deleteTodo(@Param('id') idAdm:number): Promise<void>{
    return this.adminService.remove(idAdm);
  }
}
