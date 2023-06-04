import { Injectable, NotFoundException } from '@nestjs/common';
import { Todo } from './interfaces/todo.interface';
import { CreateTodoDto } from './dto/create-todo.dto';
import { Todos } from './todos.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { UpdateTodoDto } from './dto/update-todos.dto';

@Injectable()
export class TodosService {
    constructor(
        @InjectRepository(Todos)
        private todosRepository: Repository<Todos>,
      ) {}

    findOne(id:number):Promise<Todos | null>{
        return this.todosRepository.findOneBy({id});
    }

    findAll():Promise<Todo[]>{
        return this.todosRepository.find();
    }

    create(todo: CreateTodoDto){
        const newTodos = this.todosRepository.create({
            ...todo,

        });
        return this.todosRepository.save(newTodos);
    }

    async remove(id: number): Promise<void> {
        await this.todosRepository.delete(id);
    }
    async update(id : number, todo:UpdateTodoDto) {
        return await this.todosRepository.update({id}, {
            ...todo
        });
      }
}
