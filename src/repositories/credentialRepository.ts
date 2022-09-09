import client from "../database/prismaClient";
import { credentials } from "@prisma/client";


export type CredentialType = Omit<credentials, "id"  | "createdAt">


export async function insertCredential(credential: CredentialType){
    
    await client.credentials.create({data: credential})
}

export async function getCredentialByTitle(userId: number, title: string){
    const credential = await client.credentials.findFirst({where: {AND: [{id: userId}, {title}]}})
    return credential
}

export async function getUserCredentials(userId: number){
    const credentials = await client.credentials.findMany({where: {userId}})
    return credentials
}

export async function getCredentialById(credentialId: number){
    const credential = await client.credentials.findUnique({where: {id: credentialId}})
    return credential
}

export async function deleteCredential(credentialId: number){
    await client.credentials.delete({where: {id: credentialId}})
}
