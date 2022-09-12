
import { users } from "@prisma/client";
import client from "../database/prismaClient"

export type AuthDataType = Omit<users, 'id' | 'createdAt'>

export async function getUserById(id: number){
    const user = await client.users.findFirst({where: {id}})
    return user
}

export async function getUserByEmail(email: string){
    const user = await client.users.findFirst({where: {email}})
    return user
}


export async function insertUser(userData: AuthDataType){
    
    await client.users.create({data: userData})
}