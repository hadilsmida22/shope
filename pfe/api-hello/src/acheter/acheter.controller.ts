import { Body, Controller, Delete, Get, Param, Put } from "@nestjs/common";
import { AchetersService } from "./acheter.service";
import { ProduitService } from "src/produit/produit.service";

@Controller('acheter')
export class AchetersController {
    constructor( private readonly acheterService: AchetersService,
      private readonly productService: ProduitService){}
  @Get(':id')
  findOne(@Param('id') idP:number){
    return this.acheterService.findOne(idP);
  }

  @Put(':id/acheter')
  async updateAcheter(@Param('id') idAchete: number) {
    return this.acheterService.updateAcheter(idAchete);
  }

  @Delete(':id')
  async delete(@Param('id') id: number) {
    return await this.acheterService.delete(id);
  }

  @Get(':idListe/:idAchats/etat')
  async getEtatAchat(
    @Param('idListe') idListe: number,
    @Param('idAchats') idAchats: number,
  ): Promise<boolean> {
    return this.acheterService.getEtatAchat(idListe, idAchats);
  }

  @Put(':idAchat/quantite')
  async updateAchatQuantite(
    @Param('idAchat') idAchat: number,
    @Body('quantite') quantite: number,
  ): Promise<void> {
    await this.acheterService.updateAchatQuantite(idAchat, quantite);
  }
}