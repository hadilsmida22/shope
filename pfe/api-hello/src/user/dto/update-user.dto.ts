import { PartialType } from "@nestjs/mapped-types";
import { CreateUser } from "./create-user.dto";
import { Role } from 'src/auth/enums/user-role.enum';
export class UpdateUser extends PartialType(CreateUser){
    role? : Role; 
}