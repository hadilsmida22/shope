import { Controller ,Get, Post, Body, Param, Patch, Delete, NotFoundException, BadRequestException, UploadedFile, UseInterceptors, UsePipes, ValidationPipe, UseGuards, Req} from '@nestjs/common';
import { CarteService } from './carteF.service';
import { CreateCarte } from './dto/create-carte.dto';
import { UpdateCarte } from './dto/update-carte.dto';
import { FileInterceptor } from '@nestjs/platform-express';
import jsQR from 'jsqr';
import { Cartes } from './carteF.entity';
import { Roles } from 'src/auth/enums/roles.decorator';
import { Role } from 'src/auth/enums/user-role.enum';
import { JwtAuthGuard } from 'src/auth/jwt-auth.guard';
import { RolesGuard } from 'src/auth/roles.guard';
import { Enseignes } from 'src/enseigne/enseigne.entity';
import { User } from 'src/user/user.entity';
@Controller('carte')
export class CarteController {
    constructor( private readonly carteService: CarteService){}

  //ajouter carte  
  
  //@Roles(Role.)
  //@UseGuards(JwtAuthGuard)
  @Post("/:adresseIP")
  async ajouterCarteFidelite(@Body() carteFidelite: CreateCarte, @Param('adresseIP') adresseIP: string): Promise<Cartes | { enseigne: Enseignes, user: User }> {
    carteFidelite.adresseIP = adresseIP;  
    return await this.carteService.ajouterCarteFidelite(carteFidelite);
  }


  @Delete(':id')
  supprimerCarte(@Param('id') id: number): void {
    this.carteService.supprimer(id);
  }
  @Get(':numero')
  async trouverCarteParNumero(@Param('numero') numero: string) {
    return await this.carteService.trouverParNumero(numero);
  }
  @Get('/:adresseIP/byAdresse')
  async findAll(@Param('adresseIP') adresseIP: string): Promise<Cartes[]> {
    const cartes = await this.carteService.findAll(adresseIP);
    return cartes;
  }
  
  
  @Get('/:id/affiche')
  async getCarteById(@Param('id') id: number): Promise<Cartes> {
    return await this.carteService.getCarteById(id);
  }

  @Post('/scanner-image')
  @UseInterceptors(FileInterceptor('image'))
  async scannerImage(@UploadedFile() file) {
    if (!file) {
      throw new BadRequestException('Image non fournie.');
    }

    const image = new Image();
    image.src = URL.createObjectURL(file.buffer);
    const canvas = document.createElement('canvas');
    const context = canvas.getContext('2d');
    context.drawImage(image, 0, 0, image.width, image.height);
    const imageData = context.getImageData(0, 0, image.width, image.height);
    const codeBarre = jsQR(imageData.data, imageData.width, imageData.height).data;
    
    await this.carteService.create(codeBarre);
    
    return { message: `Carte avec le numéro ${codeBarre} sauvegardée.` };
  }

  
} 
