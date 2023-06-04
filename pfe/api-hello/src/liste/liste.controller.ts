import { Controller ,Get, Post, Body, Param, Put, Delete, UseGuards, HttpException, HttpStatus, NotFoundException} from '@nestjs/common';
import { CreateList } from './dto/create-liste.dto';
import { UpdateList } from './dto/update-liste.dto';
import { ListService } from './liste.service';
import { Produits } from 'src/produit/produit.entity';
import { Listes } from './liste.entity';
import { Prix } from 'src/prix/prix.entity';
import { Acheters } from 'src/acheter/acheter.entity';
import { Roles } from 'src/auth/enums/roles.decorator';
import { Role } from 'src/auth/enums/user-role.enum';
import { JwtAuthGuard } from 'src/auth/jwt-auth.guard';
import { RolesGuard } from 'src/auth/roles.guard';
import { User } from 'src/user/user.entity';
import { MailerService } from 'src/mail/mail.service';
import { UserService } from 'src/user/user.service';
import { AchetersService } from 'src/acheter/acheter.service';

@Controller('liste')
export class ListController {
  
  constructor( private readonly listeService: ListService,
    private readonly mailService: MailerService,
    private readonly userService: UserService,
    private readonly achetersRepository : AchetersService){}

  //creer liste 
//creer liste 
  @Post("/:adresseIP")
  async ajouterListe(@Body() listeDto: CreateList, @Param('adresseIP') adresseIP: string): Promise<Listes | { utilisateur: User }> {
  // Ajoutez le paramètre adresseIP à la méthode de votre service
  listeDto.adresseIP = adresseIP;
  return await this.listeService.ajouterListe(listeDto);
  }

  //ajouter un produit dans une liste
  @Post('produit/:idProduit')
  async addProduitToListe(
    @Param('idProduit') idProduit: number,
    @Body('quantite') quantite: number,
  ): Promise<void> {
    return await this.listeService.addProduitToListe( idProduit, quantite);
  }
  


  //supprimer un produit d'une liste
  @Delete('/produit/:idProduit')
  async removeProduitFromListe(
    @Param('idProduit') idProduit: number,
  ): Promise<void> {
    return await this.listeService.removeProduitFromListe( idProduit);
  }
  
  //liste terminer
  @Put('terminer')
  async terminerListe(): Promise<void> {
    try {
      await this.listeService.terminerListe();
      // Liste terminée avec succès
    } catch (error) {
      console.error('Une erreur s\'est produite lors de la terminaison de la liste :', error);
      throw new HttpException('Failed to terminate list', HttpStatus.INTERNAL_SERVER_ERROR);
    }
  }

  //produit c bon achetée ==true
  @Put(':listeId/achats/:achatId/acheter')
  async acheterProduit(@Param('listeId') listeId: number, @Param('achatId') achatId: number): Promise<void> {
    await this.listeService.acheterProduit(listeId, achatId);
  }

  @Get('/:adresseIP/meslistes/desc')
  async getLists(@Param('adresseIP') adresseIP: string): Promise<Listes[]> {
    const listes = await this.listeService.getLists(adresseIP);
    return listes;
  }

  @Get(':id')
  async getListById(@Param('id') id: number): Promise<Listes> {
    return await this.listeService.getListById(id);
  }
  
  @Delete(':id')
  async delete(@Param('id') id: number) {
    return await this.listeService.delete(id);
  }

  //jointure
  @Get('/join/list_achat')
  async findAllListesWithProduitsAndAchetersEffectues(): Promise<Listes[]> {
    return this.listeService.findAllListesWithProduitsAndAchetersEffectues();
  }

  //get liste effectuer
  @Get()
  async getListesEffectuees(): Promise<string[]> {
    const result = await this.listeService.getListesEffectuees();
    return result;
  }

  //get les libelles de 3 produits plus utlises 
  @Get('/effectuer/top3Produits/:adresseIP')
  async getTop3Produits(@Param('adresseIP') adresseIP: string) {
    const top3Produits = await this.listeService.getTop3Produits(adresseIP);
    return {
      code: 200,
      message: 'Success',
      data: top3Produits,
      error: null,
    };
  }

  @Post(':id/effectuer')
  async changerEtatListe(@Param('id') id: number): Promise<void> {
    await this.listeService.changerEtatListe(id);
  }

  @Get('/produits/tous')
  async findListesWithProduits(): Promise<Listes[]> {
    return this.listeService.findListesWithProduits();
  }

  @Get('/lastListe/produits')
  async getListeProduitsDerniereListe(): Promise<string[]> {
    const result = await this.listeService.getListeProduitsDerniereListe();
    return result;
  }

  @Get(':id/details')
  async getListeDetailsById(@Param('id') id: number): Promise<any>{
    const listDetails = await this.listeService.getListeDetailsById(id);
    return listDetails;
  }

  @Get(':idListe/produits')
  async getProduits_List(@Param('idListe') idListe: number): Promise<string[]> {
    return this.listeService.getProduits_List(idListe);
  }

  @Get(':id/idListe/details')
  async findListesWithProduits_id(@Param('id') id: number): Promise<any>{
    const listDetails = await this.listeService.findListesWithProduits_id(id);
    return listDetails;
  }

  //tous les pdts ==true
  @Put(':listeId/achats/acheter')
  async acheterrtousProduit(@Param('listeId') listeId: number): Promise<void> {
    await this.listeService.acheterrtousProduit(listeId);
  }

  //creer liste 
  @Post('/new/listeSugge/:adresseIP')
  async creerListeSugg(@Body() listeDto: CreateList, @Param('adresseIP') adresseIP: string): Promise<Listes | { utilisateur: User }> {
    listeDto.adresseIP = adresseIP;
    return await this.listeService.creerListeSugg(listeDto); 
  }

  /*@Roles(Role.CLIENT)
  @UseGuards(JwtAuthGuard,RolesGuard)
  @Post('/:sendUser/:mdp/share')
  async shareListByEmail(@Param('sendUser') sendUser : string,@Param('mdp') mdp: string, @Body() requestBody: { recipientEmail: string; listName: string, products: string[]}): Promise<void> {
    const { recipientEmail, listName , products} = requestBody;

    await this.mailService.sendShareEmail(sendUser,mdp,recipientEmail, listName, products);
  }*/

  @Post('/:listeId/reutliser/:adresseIP')
  async reutiliserListe(@Param('listeId') listeId: number,@Body() listeDto: CreateList, @Param('adresseIP') adresseIP: string): Promise<Listes | { utilisateur: User }> {
    try {
      listeDto.adresseIP = adresseIP;
      const resultat = await this.listeService.reutiliserListe(listeId,listeDto);
      return resultat;
    } catch (error) {
      if (error instanceof NotFoundException) {
        throw new NotFoundException(error.message);
      }
      throw error;
    }
  }
  
  @Post('/partager/:idListe')
  async shareList(@Param('idListe') idListe: number, @Body('email') email: string): Promise<void> {
    await this.listeService.shareList(idListe, email);
  }

}
