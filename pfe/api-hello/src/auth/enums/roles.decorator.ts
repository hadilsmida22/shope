import { SetMetadata } from '@nestjs/common';
import { Role } from './user-role.enum';
require('dotenv').config();
export const ROLES_KEY = process.env.JWT_SECRET;
export const Roles = (...roles: Role[]) => SetMetadata(ROLES_KEY, roles);