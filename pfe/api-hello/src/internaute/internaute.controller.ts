import { Controller ,Get, Post, Body, Param, Patch, Delete, UsePipes, ValidationPipe, Req,Headers} from '@nestjs/common';
//import { CreateInter } from './dto/create-inter.dto';
//import { UpdateInter } from './dto/update-inter.dto';
import { InternauteService } from './internaute.service';
import * as useragent from 'useragent';
import { internautes } from './internaute.entity';
import * as UAParser from 'ua-parser-js';
@Controller('inter')
export class InternauteController {
    constructor( private readonly internauteService: InternauteService){}
  @Get(':id')
  findOne(@Param('id') idInternaute:number){
    return this.internauteService.findOne(idInternaute);
  }
  
  /*@Get()
  findAll():Promise<Internaute[]>{
    return this.internauteService.findAll();
  }*/




 /* @Patch(':id')
  @UsePipes(ValidationPipe)
  updateTodos(@Param('id') idInternaute: number,@Body() inter: UpdateInter){
    return this.internauteService.update(idInternaute,inter);
  }

  @Delete(':id')
  deleteTodo(@Param('id') idInternaute:number): Promise<void>{
    return this.internauteService.remove(idInternaute);
  }*/

  @Post('user-info')
  async postUserInfo(@Req() request): Promise<string> {
    const parser = new UAParser();
    const ua = request.headers['user-agent'];
    const result = parser.setUA(ua).getResult();

    const internaute = new internautes();
    internaute.browser = result.browser.name;
    internaute.browserVersion = result.browser.version;
    internaute.os = result.os.name;
    internaute.osVersion = result.os.version;
    internaute.device = result.device.model;
    internaute.source = ua;

    await this.internauteService.createInternaute(internaute);

    return "Internaute enregistré avec succès!";
  }
  
  //c'est la méthode get 
  @Get()
  async getAllInternautes(): Promise<internautes[]> {
    return await this.internauteService.getAllInternautes();
  }
}