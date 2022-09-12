import client from "../database/prismaClient";
import { secure_notes } from "@prisma/client";

export type SecureNoteType = Omit<secure_notes, "id" | "createdAt">

export async function insertSecureNote(secureNote: SecureNoteType){
    await client.secure_notes.create({data: secureNote})
}

export async function getUserSecureNotes(userId: number){
    const secureNotes = await client.secure_notes.findMany({where: {userId}})
    return secureNotes
}

export async function getSecureNoteById(secureNoteId: number){
    const secureNote = await client.secure_notes.findUnique({where: {id: secureNoteId}})
    return secureNote
}

export async function deleteSecureNote(secureNoteId: number){
    await client.secure_notes.delete({where: {id: secureNoteId}})
}