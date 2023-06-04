import { Controller ,Get, Post, Body, Param, Patch, Delete, UsePipes, ValidationPipe, Put, UseGuards} from '@nestjs/common';
import { CreateClient } from './dto/create-client.dto';
import { UpdateClient } from './dto/update-client.dto';
import { ClientService } from './client.service';
import { DeleteResult, UpdateResult } from 'typeorm';
import * as bcrypt from 'bcrypt';
import { AuthGuard } from '@nestjs/passport';

@Controller('client')
export class ClientController {
    constructor( private readonly clientService: ClientService){}

  @Post()
  @UsePipes(ValidationPipe)
  async create(@Body() user: CreateClient): Promise<CreateClient> {
    const hashedPassword = bcrypt.hashSync(
      user.password,
      parseInt(process.env.BCRYPT_SALT_ROUNDS, 10) || 10,
    );

    const isFound = await this.clientService.findByEmail(user.email);

    if (isFound) {
      throw new Error('User with the same email or username already exists');
    }
    return this.clientService.create({
      ...user,
      password: hashedPassword,
    });
  }

  @Get()
  @UseGuards(AuthGuard('jwt'))
  async getAll() {
    const users = await this.clientService.getAll();
    users.forEach(function (user) {
      delete user.password;
    });
    return { users };
  }

  @Get(':email')
  async findByEmail(@Param('email') email: string) {
    const user = await this.clientService.findByEmail(email);
    return { user };
  }

  @Put(':id')
  @UsePipes(ValidationPipe)
  update(
    @Param('id') id: number,
    @Body() user: UpdateClient,
  ): Promise<UpdateResult> {
    return this.clientService.update(id, user);
  }

  @Delete(':id')
  delete(@Param('id') id: number): Promise<DeleteResult> {
    return this.clientService.remove(id);
  }
}
