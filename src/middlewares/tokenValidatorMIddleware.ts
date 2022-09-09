import jwt from "jsonwebtoken"
import * as authRepository from "../repositories/authRepository"
import {Request, Response, NextFunction} from "express"
import dotenv from "dotenv"

dotenv.config()

export default async function validateToken(req: Request, res: Response, next: NextFunction){
    
    const secret_key = String(process.env.SECRET_KEY)
    const token: string | undefined = req.headers.authorization?.replace("Bearer ", "")
    
    if(!token || token.length !== 115 ){
        throw {type: "unauthorized", message:"Invalid Token"}
    }
   
    const result: any = jwt.verify(String(token), secret_key)
 
    const user = authRepository.getUserById(result.id)
    if(!user){
       throw {type: "not_found", message:"User not found"}
    }

    res.locals.userId = result.id

    next()
}   