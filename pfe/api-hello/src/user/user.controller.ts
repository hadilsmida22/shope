import { Controller ,Get, Post, Body, Param, Patch, Delete, UsePipes, ValidationPipe, Put, UseGuards} from '@nestjs/common';
import { DeleteResult, UpdateResult } from 'typeorm';
import * as bcrypt from 'bcrypt';
import { AuthGuard } from '@nestjs/passport';
import { CreateUser } from './dto/create-user.dto';
import { UpdateUser } from './dto/update-user.dto';
import { UserService } from './user.service';
import { Rayons } from 'src/rayon/rayon.entity';
import { Categories } from 'src/categorie/categorie.entity';
import { Roles } from 'src/auth/enums/roles.decorator';
import { Role } from 'src/auth/enums/user-role.enum';
import { RolesGuard } from 'src/auth/roles.guard';
import { JwtAuthGuard } from 'src/auth/jwt-auth.guard';
import { v4 as uuidv4 } from 'uuid';
import { User } from './user.entity';

@Controller('user')
export class UserController {
    constructor( private readonly userService: UserService){}
    

  @Post('/signup')
  //@UsePipes(ValidationPipe)
  async create(@Body() user: CreateUser): Promise<CreateUser> {
   
    if (!user.password) {
      user.password = '';
    } else {
      user.password = bcrypt.hashSync(
        user.password,
        parseInt(process.env.BCRYPT_SALT_ROUNDS, 10) || 10,
      );
    }
  
    const isFound = await this.userService.findByEmail(user.email);
    
    if (isFound && user.email !='' && user.password !='') {
      throw new Error('User with the same email or username already exists');
    }else if(isFound && user.email =='' && user.password==''){
      console.log('Fin de la création de l\'utilisateur.');
    return this.userService.create({
      ...user,
      
    });
    }else if(!isFound)
    console.log('Fin de la création de l\'utilisateur.');
    return this.userService.create({
      ...user,
      
    });
  }

  @Put('/updateRole/:adresseIP')
  async updateUser(
    @Param('adresseIP') adresseIp: string,
    @Body() updateUserDto: UpdateUser,
  ): Promise<User> {
    const { email, password } = updateUserDto;

    return await this.userService.updateUser(adresseIp, email, password);
  }
  

  @Get()
  @UseGuards(AuthGuard('jwt'))
  async getAll() {
    const users = await this.userService.getAll();
    users.forEach(function (user) {
      delete user.password;
    });
    return { users };
  }

  @Get('/byid/:id')
  async getUserById(@Param('id') id: string): Promise<User> {
    return this.userService.findById(id);
  }

  @Get(':email')
  async findByEmail(@Param('email') email: string) {
    const user = await this.userService.findByEmail(email);
    return { user };
  }

  @Put(':id')
  @UsePipes(ValidationPipe)
  update(
    @Param('id') id: string,
    @Body() user: UpdateUser,
  ): Promise<UpdateResult> {
    return this.userService.update(id, user);
  }

  @Delete(':id')
  delete(@Param('id') id: string): Promise<DeleteResult> {
    return this.userService.remove(id);
  }

  @Post(':rayonId/categorie/:categorieId')
  //@Roles(Role.ADMIN)
  //@UseGuards(JwtAuthGuard,RolesGuard)
  async addCategorieToRayon(
    @Param('rayonId') rayonId: number,
    @Param('categorieId') categorieId: number,
  ): Promise<Rayons> {
    return this.userService.addCategorieToRayon(rayonId, categorieId);
  }

  @Get(':rayonId/categories')
  //@Roles(Role.ADMIN)
  //@UseGuards(JwtAuthGuard,RolesGuard)
  async getCategoriesOfRayon(@Param('rayonId') rayonId: number): Promise<Categories[]> {
    return this.userService.getCategoriesOfRayon(rayonId);
  }

  @Get('/checkDevice/:deviceId')
  async _checkUserExistsInDatabase(@Param('deviceId') deviceId: string): Promise<boolean> {
    return this.userService._checkUserExistsInDatabase(deviceId);
  }

  @Get('/ip/:ipAddress')
  async getUserByIpAddress(@Param('ipAddress') ipAddress: string) {
    return this.userService.getUserByIpAddress(ipAddress);
  }
  @Get('/:ipAddress/role')
  async getUserRoleByIpAddress(@Param('ipAddress') ipAddress: string): Promise<string> {
    return this.userService.getUserRoleByIpAddress(ipAddress);
  }
  @Get('/email/:email')
  async getUserByEmail(@Param('email') email: string): Promise<User> {
    return this.userService.getUserByEmail(email);
  }
}
