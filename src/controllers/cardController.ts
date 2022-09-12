import {Request, Response} from "express"
import * as cardService from "../services/cardService"

export async function createCard(req: Request, res: Response){
    const userId = res.locals.userId
    const card = {...req.body, userId}
    await cardService.createCard(card)

    return res.status(201).send("Card created successfully")
}

export async function getUserCards(req: Request, res: Response){
    const userId = res.locals.userId
    const cards = await cardService.getUserCards(userId)

    return res.status(200).send(cards)
}

export async function getCardById(req: Request, res: Response){
    const userId = res.locals.userId
    const cardId = Number(req.params.id)
    const card = await cardService.getCardById(cardId, userId) 

    return res.status(200).send(card)
}

export async function deleteCard(req: Request, res: Response){
    const userId = res.locals.userId
    const cardId = Number(req.params.id)
    await cardService.deleteCard(cardId, userId)

    return res.status(200).send("Card deleted successfully")

}