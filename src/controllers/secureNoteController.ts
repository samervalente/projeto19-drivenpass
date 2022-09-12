import {Request, Response} from "express"
import * as secureNoteService from "../services/secureNoteService"

export async function createSecureNotes(req: Request, res: Response){
    const userId = res.locals.userId
    const secureNote = {...req.body, userId}
    await secureNoteService.createSecureNote(secureNote)

    return res.status(201).send("Secure note created successfully")
}

export async function getUserSecureNotes(req: Request, res: Response){
    const userId = res.locals.userId
    const secureNotes = await secureNoteService.getUserSecureNotes(userId)

    return res.status(200).send(secureNotes)
}

export async function getSecureNoteById(req: Request, res: Response){
    const userId = res.locals.userId
    const secureNoteId = Number(req.params.id)
    const secureNote = await secureNoteService.getSecureNoteById(secureNoteId, userId) 

    return res.status(200).send(secureNote)
}

export async function deleteSecureNote(req: Request, res: Response){
    const userId = res.locals.userId
    const secureNoteId = Number(req.params.id)
    await secureNoteService.deleteSecureNote(secureNoteId, userId)

    return res.status(200).send("Secure note deleted successfully")

}