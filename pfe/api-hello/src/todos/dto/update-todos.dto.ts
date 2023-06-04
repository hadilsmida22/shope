export class UpdateTodoDto{
    readonly id: number;
    readonly title: string;
    readonly description?:string;
}