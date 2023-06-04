import { Controller ,Get, Post, Body, Param, Patch, Delete} from '@nestjs/common';
import { TodosService } from './todos.service';
import { Todo } from './interfaces/todo.interface';
import { CreateTodoDto } from './dto/create-todo.dto';
import { UpdateTodoDto } from './dto/update-todos.dto';

@Controller('todos')
export class TodosController {
    constructor( private readonly todosService: TodosService){}
  @Get(':id')
  findOne(@Param('id') id:number){
    return this.todosService.findOne(id);
  }
  
  @Get()
  findAll():Promise<Todo[]>{
    return this.todosService.findAll();
  }

  @Post()
  createTodo(@Body() newTodo:CreateTodoDto){
    this.todosService.create(newTodo);
  }

  @Patch(':id')
  updateTodos(@Param('id') id: number,@Body() todo: UpdateTodoDto){
    return this.todosService.update(id,todo);
  }

  @Delete(':id')
  deleteTodo(@Param('id') id:number): Promise<void>{
    return this.todosService.remove(id);
  }
}
