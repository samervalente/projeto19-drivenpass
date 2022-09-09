import dotenv from "dotenv"
import Cryptr from "cryptr"
import * as credentialRepository from "../repositories/credentialRepository"

dotenv.config()
const cryptr = new Cryptr(String(process.env.SECRET_KEY))

export async function createCredential(credential: credentialRepository.CredentialType){
    
    const credentialDB = await credentialRepository.getCredentialByTitle(credential.userId, credential.title)
    if(credentialDB){
        throw {code: "P2002", message:"Credential with this title already exist"}
    }
   
    credential.password = cryptr.encrypt(credential.password)
    await credentialRepository.insertCredential(credential)
}

export async function getUserCredentials(userId: number){
    const credentials =  await credentialRepository.getUserCredentials(userId)
    
    credentials.map(item => item.password = cryptr.decrypt(item.password))
    return credentials
}

export async function getCredentialById(credentialId: number, userId: number){
   const credential = await validateCredential(credentialId, userId)
    credential.password = cryptr.decrypt(credential.password)

    return credential
}


export async function deleteCredential(credentialId: number, userId: number){
    const {id} = await validateCredential(credentialId, userId)
    await credentialRepository.deleteCredential(id)
}

async function validateCredential(credentialId: number, userId: number){
    const credential = await credentialRepository.getCredentialById(credentialId)

    if(!credential){
        throw {type: "not_found", message:"Credential not found"}
    }
    if(credential.userId !== userId){
        throw {type: "unauthorized", message:"Unauthorized to access this credential"}
    }

    return credential
}