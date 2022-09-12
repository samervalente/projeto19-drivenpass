import client from "../database/prismaClient";
import { cards } from "@prisma/client";

export type CardType = Omit<cards, "id" | "createdAt">

export async function insertCard(card: CardType){
    await client.cards.create({data: card})
}

export async function getUserCards(userId: number){
    const cards = await client.cards.findMany({where: {userId}})
    return cards
}

export async function getCardById(cardId: number){
    const card = await client.cards.findUnique({where: {id: cardId}})
    return card
}

export async function deleteCard(cardId: number){
    await client.cards.delete({where: {id: cardId}})
}