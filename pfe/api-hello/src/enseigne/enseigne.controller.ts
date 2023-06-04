import { Controller ,Get, Post, Body, Param, Patch, Delete} from '@nestjs/common';
import { CreateEnseigne } from './dto/create-ensg.dto';
import { UpdateEnseigne } from './dto/update-ensg.dto';
import { EnseigneService } from './enseigne.service';
import { Enseignes } from './enseigne.entity';

@Controller('enseigne')
export class EnseigneController {
    constructor( private readonly enseigneService: EnseigneService){}
  @Get(':id')
  findOne(@Param('id') idE:number){
    return this.enseigneService.findOne(idE);
  }
  
  @Get()
  findAll():Promise<Enseignes[]>{
    return this.enseigneService.findAll();
  }

  /*@Post()
  createEnseigne(@Body() newensg:CreateEnseigne){
    this.enseigneService.create(newensg);
  }

  @Patch(':id')
  updateEnseigne(@Param('id') idE: number,@Body() ensg: UpdateEnseigne){
    return this.enseigneService.update(idE,ensg);
  }
*/
  @Delete(':id')
  deleteEnseigne(@Param('id') idE:number): Promise<void>{
    return this.enseigneService.remove(idE);
  }

  
}
