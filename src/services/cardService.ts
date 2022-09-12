import dotenv from "dotenv"
import Cryptr from "cryptr"
import * as cardRepository from "../repositories/cardRepository"
import formatISODate from "../utils/formatIsoDate"

dotenv.config()
const cryptr = new Cryptr(String(process.env.SECRET_KEY))

export async function createCard(card: cardRepository.CardType){
  
    const encryptedSecutiryCode = cryptr.encrypt(card.securityCode)
    const encryptedPassword = cryptr.encrypt(card.password)
    
    card = {...card, securityCode: encryptedSecutiryCode, password: encryptedPassword}

    await cardRepository.insertCard(card)
}

export async function getUserCards(userId: number){
    let cards =  await cardRepository.getUserCards(userId)
    cards.map(card => {
        card.createdAt = formatISODate(card.createdAt)
        card.securityCode = cryptr.decrypt(card.securityCode)
        card.password = cryptr.decrypt(card.password)
    })

   return cards
}

export async function getCardById(cardId: number, userId: number){
    const card = await cardRepository.getCardById(cardId)
    if(!card){
        throw {type: "not_found", message:"Card not found"}
    }

    if(card.userId !== userId){
        throw {type: "unauthorized", message:"Unauthorized to access this card"}
    }

    card.createdAt = formatISODate(card.createdAt)
    card.securityCode = cryptr.decrypt(card.securityCode)
    card.password = cryptr.decrypt(card.password)
    return card
}

export async function deleteCard(cardId: number, userId: number){
    const {id} = await getCardById(cardId, userId)
    await cardRepository.deleteCard(id)
}





