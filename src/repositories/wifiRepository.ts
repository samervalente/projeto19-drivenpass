import client from "../database/prismaClient";
import { wifi } from "@prisma/client";

export type WifiType = Omit<wifi, "id" | "createdAt">

export async function insertWifi(wifi: WifiType){
    await client.wifi.create({data: wifi})
}

export async function getUserWifis(userId: number){
    const wifis = await client.wifi.findMany({where: {userId}})
    return wifis
}

export async function getWifiById(wifiId: number){
    const wifi = await client.wifi.findUnique({where: {id: wifiId}})
    return wifi
}

export async function deleteWifi(wifiId: number){
    await client.wifi.delete({where: {id: wifiId}})
}