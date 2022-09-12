import * as secureNoteRepository from "../repositories/secureNoteRepository"
import formatISODate from "../utils/formatIsoDate"

export async function createSecureNote(secureNote: secureNoteRepository.SecureNoteType){
    await secureNoteRepository.insertSecureNote(secureNote)
}

export async function getUserSecureNotes(userId: number){
    let secureNotes = await secureNoteRepository.getUserSecureNotes(userId)

    secureNotes.map(item => {
        item.createdAt = formatISODate(item.createdAt)
    })
    return secureNotes
}

export async function getSecureNoteById(secureNoteId: number, userId: number){
    const secureNote = await secureNoteRepository.getSecureNoteById(secureNoteId)
    if(!secureNote){
        throw {type: "not_found", message:"Secure note not found"}
    }

    if(secureNote.userId !== userId){
        throw {type: "unauthorized", message:"Unauthorized to access this secure note"}
    }

    secureNote.createdAt = formatISODate(secureNote.createdAt)
    return secureNote
}

export async function deleteSecureNote(secureNoteId: number, userId: number){
    const {id} = await getSecureNoteById(secureNoteId, userId)
    await secureNoteRepository.deleteSecureNote(id)
}



