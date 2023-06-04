import { Controller ,Get, Post, Body, Param, Patch, Delete} from '@nestjs/common';
import { CreateVisiteur } from './dto/create-visit.dto';
import { UpdateVisiteur } from './dto/update-visit.dto';
import { VisiteurService } from './visiteur.service';
import { visiteurs } from './visiteur.entity';

@Controller('visiteur')
export class VisiteurController {
    constructor( private readonly visiteurService: VisiteurService){}
  @Get(':id')
  findOne(@Param('id') idVisiteur:number){
    return this.visiteurService.findOne(idVisiteur);
  }
  
  @Get()
  findAll():Promise<visiteurs[]>{
    return this.visiteurService.findAll();
  }

  @Post()
  createTodo(@Body() newvisit:CreateVisiteur){
    this.visiteurService.create(newvisit);
  }

  @Patch(':id')
  updateTodos(@Param('id') idVisiteur: number,@Body() visit: UpdateVisiteur){
    return this.visiteurService.update(idVisiteur,visit);
  }

  @Delete(':id')
  deleteTodo(@Param('id') idVisiteur:number): Promise<void>{
    return this.visiteurService.remove(idVisiteur);
  }
}
