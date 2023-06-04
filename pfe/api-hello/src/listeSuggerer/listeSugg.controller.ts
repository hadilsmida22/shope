import { Controller ,Get, Post, Body, Param, Patch, Delete} from '@nestjs/common';
import { CreateListSugg } from './dto/create-listeSugg.dto';
import { UpdateListSugg } from './dto/update-listeSugg.dto';
import { ListSuggService } from './listeSugg.service';
import { Produits } from 'src/produit/produit.entity';
import { Listesuggs } from './listeSugg.entity';

@Controller('listeSugg')
export class ListSuggController {
    constructor( private readonly listeSuggService: ListSuggService){}
  @Get(':id')
  findOne(@Param('id') idListeSugg:number){
    return this.listeSuggService.findOne(idListeSugg);
  }
  
  @Get()
  findAll():Promise<Listesuggs[]>{
    return this.listeSuggService.findAll();
  }

  @Post()
  createTodo(@Body() newliste:CreateListSugg){
    this.listeSuggService.create(newliste);
  }

  @Patch(':id')
  updateTodos(@Param('id') idListeSugg: number,@Body() liste: UpdateListSugg){
    return this.listeSuggService.update(idListeSugg,liste);
  }

  @Delete(':id')
  deleteTodo(@Param('id') idListeSugg:number): Promise<void>{
    return this.listeSuggService.remove(idListeSugg);
  }

  /*@Get(':id/produits-effectuer')
  async getIdProduitsByListeEtatEffectuer(@Param('id') id: number) {
    const idProduits = await this.listeSuggService.getIdProduitsByListeEtatEffectuer(id);
    return { idProduits };
  }*/
  @Get('id-produits-effectue')
    async findIdProduitsWithEffectue(): Promise<number[]> {
      return this.listeSuggService.findIdProduitsWithEffectue();
    }

  
}
