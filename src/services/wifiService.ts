import dotenv from "dotenv"
import Cryptr from "cryptr"
import * as wifiRepository from "../repositories/wifiRepository"
import formatISODate from "../utils/formatIsoDate"

dotenv.config()

export async function createWifi(wifi: wifiRepository.WifiType){
    const cryptr = new Cryptr(String(process.env.SECRET_KEY))

    wifi.networkPassword = cryptr.encrypt(wifi.networkPassword)
    await wifiRepository.insertWifi(wifi)
}

export async function getUserWifis(userId: number){
    let wifis =  await wifiRepository.getUserWifis(userId)
    wifis.map(wifi => formatISODate(wifi.createdAt))

   return wifis
}

export async function getWifiById(wifiId: number, userId: number){
    const wifi = await wifiRepository.getWifiById(wifiId)
    if(!wifi){
        throw {type: "not_found", message:"Wifi  not found"}
    }

    if(wifi.userId !== userId){
        throw {type: "unauthorized", message:"Unauthorized to access this wifi"}
    }

    wifi.createdAt = formatISODate(wifi.createdAt)

    return wifi
}

export async function deleteWifi(wifiId: number, userId: number){
    const {id} = await getWifiById(wifiId, userId)
    await wifiRepository.deleteWifi(id)
}





