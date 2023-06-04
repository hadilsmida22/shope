import { Controller ,Get, Post, Body, Param, Patch, Delete, Put, Query} from '@nestjs/common';
import { CreateProduit } from './dto/create-pdt.dto';
import { UpdateProduit } from './dto/update-pdt.dto';
import { ProduitService } from './produit.service';
import { Produits } from './produit.entity';
import { Listes } from 'src/liste/liste.entity';
import { ListSuggService } from 'src/listeSuggerer/listeSugg.service';

@Controller('produit')
export class ProduitController {
    constructor( private readonly produitService: ProduitService ,){}
  @Get(':id')
  findOne(@Param('id') idP:number){
    return this.produitService.findOne(idP);
  }

  @Get(':libelle/nomP')
  getByLibelle(@Param('libelle') libelle:string){
    return this.produitService.getByLibelle(libelle);
  }
  
  @Get()
  findAll():Promise<Produits[]>{
    return this.produitService.findAll();
  }

  @Post()
  createProduit(@Body() newpdt:CreateProduit){
    this.produitService.create(newpdt);
  }


  /*@Patch(':id')
  updateProduit(@Param('id') idP: number,@Body() pdt: UpdateProduit){
    return this.produitService.update(idP,pdt);
  }*/

  @Delete(':id')
  deleteProduit(@Param('id') idP:number): Promise<void>{
    return this.produitService.remove(idP);
  }

  //tous les marques et les grammages du pdt avec un libelle specifique
  @Get(':libelle/marques')
  async getMarques(@Param('libelle') libelle: string) {
    const marques = await this.produitService.findByLibelle(libelle);
    return { marques };
  }

  @Get(':libelle/grammages')
  async getGrammages(@Param('libelle') libelle: string) {
    const grammages = await this.produitService.findByLibelle(libelle);
    return { grammages };
  }
  
  //bas prix entre les pdt qui ont le meme libelle
  @Get(':libelle/bas-prix')
  async getProduct(@Param('libelle') libelle: string): Promise<Produits> {
    return this.produitService.getProduct(libelle);
  }
  
  //Autre prix 
  // produit sans de
  @Get(':libelle/autre')
  async getProductsByLibelle(@Param('libelle') libelle: string): Promise<any[]> {
    const produits = await this.produitService.getProductsByLibelle(libelle);
    if (produits.length === 0) {
      throw new Error('Aucun produit trouvé avec ce libellé');
    }
    return produits;
  }

  //produit avec de
  @Get(':libelle/de')
  async getProductsByLibelle_de(@Param('libelle') libelle: string): Promise<any[]> {
    const produits = await this.produitService.getProductsByLibelle_de(libelle);
    if (produits.length === 0) {
      throw new Error('Aucun produit trouvé avec ce libellé');
    }
    return produits;
  }

  @Put(':id')
  async updateProduit ( @Param('id') oldProductId: number, @Body('idP') newProductId: number,): Promise<void> {
    await this.produitService.updateProduit(oldProductId, newProductId);
  }

  @Get('/search/produits')
  async searchByLibelle(@Query('libelle') libelle: string): Promise<Produits[]> {
    const produits = await this.produitService.searchByLibelle(libelle);
    return produits;
  }

  @Post(':produitId/images')
    async addImageToProduit(
      @Param('produitId') produitId: number,
      @Body('imageUrl') imageUrl: string,
    ): Promise<Produits> {
      return this.produitService.addImageToProduit(produitId, imageUrl);
    }

}
