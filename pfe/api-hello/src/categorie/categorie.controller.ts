import { Controller ,Get, Post, Body, Param, Patch, Delete, NotFoundException, UseGuards, UsePipes, ValidationPipe} from '@nestjs/common';
import { CreateCategorie } from './dto/create-categorie.dto';
import { UpdateCategorie } from './dto/update-categorie.dto';
import { CategorieService } from './categorie.service';
import { Produits } from 'src/produit/produit.entity';
import { Categories } from './categorie.entity';
import { Roles } from 'src/auth/enums/roles.decorator';
import { Role } from 'src/auth/enums/user-role.enum';
import { JwtAuthGuard } from 'src/auth/jwt-auth.guard';
import { RolesGuard } from 'src/auth/roles.guard';

@Controller('categorie')
export class CategorieController {
    constructor( private readonly categorieService: CategorieService){}

  @Post(':categorieId/produits/:produitId')
  //@Roles(Role.ADMIN)
  //@UseGuards(JwtAuthGuard,RolesGuard)
  async addProduitToCategorie(
    @Param('categorieId') categorieId: number,
    @Param('produitId') produitId: number,
  ): Promise<Categories> {
    const categorie = await this.categorieService.addProduitToCategorie(categorieId, produitId);
    if (!categorie) {
      throw new NotFoundException(`La catégorie d'id ${categorieId} n'existe pas`);
    }
    return categorie;
  }

  @Delete(':produitId/:categorieId')
      async removeCategorieFromProduit(
        @Param('produitId') produitId: number,
        @Param('categorieId') categorieId: number
      ): Promise<Produits> {
        return this.categorieService.removeCategorieFromProduit(produitId, categorieId);
      }


  @Get(':id')
  findOne(@Param('id') idCat:number){
    return this.categorieService.findOne(idCat);
  }
  
  @Get()
  findAll():Promise<Categories[]>{
    return this.categorieService.findAll();
  }
  
  @Post('/newcategorie')
 // @Roles(Role.ADMIN)
 // @UseGuards(JwtAuthGuard,RolesGuard)
  @UsePipes(ValidationPipe)
  createCategorie(@Body() newcat:CreateCategorie){
    this.categorieService.create(newcat);
  }

  @Patch(':id')
  //@Roles(Role.ADMIN)
  //@UseGuards(JwtAuthGuard,RolesGuard)
  @UsePipes(ValidationPipe)
  updateCategorie(@Param('id') idCat: number,@Body() cat: UpdateCategorie){
    return this.categorieService.update(idCat,cat);
  }

  @Delete(':id')
  //@Roles(Role.ADMIN)
 // @UseGuards(JwtAuthGuard,RolesGuard)
  deleteCategorie(@Param('id') idCat:number): Promise<void>{
    return this.categorieService.remove(idCat);
  }

  @Get('/:id/produits')
  async getProduitsByCategorie(@Param('id') categorieId: number): Promise<Produits[]> {
    return this.categorieService.getProduitsByCategorie(categorieId);
}
}
