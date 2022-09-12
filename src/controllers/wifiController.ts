import {Request, Response} from "express"
import * as wifiService from "../services/wifiService"

export async function createWifi(req: Request, res: Response){
    const userId = res.locals.userId
    const wifi = {...req.body, userId}
    await wifiService.createWifi(wifi)

    return res.status(201).send("Wifi created successfully")
}

export async function getUserWifis(req: Request, res: Response){
    const userId = res.locals.userId
    const wifis = await wifiService.getUserWifis(userId)

    return res.status(200).send(wifis)
}

export async function getWifiById(req: Request, res: Response){
    const userId = res.locals.userId
    const wifiId = Number(req.params.id)
    const wifi = await wifiService.getWifiById(wifiId, userId) 

    return res.status(200).send(wifi)
}

export async function deleteWifi(req: Request, res: Response){
    const userId = res.locals.userId
    const wifiId = Number(req.params.id)
    await wifiService.deleteWifi(wifiId, userId)

    return res.status(200).send("Wifi deleted successfully")

}