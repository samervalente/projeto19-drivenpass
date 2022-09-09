import {Request, Response} from "express"
import * as credentialService from "../services/credentialService"

export async function createCredential(req: Request, res: Response){
    const userId = res.locals.userId
    const credential = {...req.body, userId}
    await credentialService.createCredential(credential)

    return res.status(200).send("Credential created successfully")
}

export async function getUserCredentials(req: Request, res: Response){
    const userId = res.locals.userId
    const credentials = await credentialService.getUserCredentials(userId)

    return res.status(200).send(credentials)
}

export async function getCredentialById(req: Request, res: Response){
    const userId = res.locals.userId
    const credentialId = Number(req.params.id)
    const credential = await credentialService.getCredentialById(credentialId, userId) 

    return res.status(200).send(credential)
}

export async function deleteCredential(req: Request, res: Response){
    const userId = res.locals.userId
    const credentialId = Number(req.params.id)
    await credentialService.deleteCredential(credentialId, userId)

    return res.status(200).send("Credential deleted successfully")

}