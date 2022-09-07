import {Request, Response, NextFunction} from "express"
import * as authService from "../services/authService"

export async function registerUser(req: Request, res: Response, next: NextFunction){
    const userData = req.body
    
    await authService.registerUser(userData)
    res.status(201).send("User registered successfully")
    
}

export async function loginUser(req: Request, res: Response, next: NextFunction){
    const userId = res.locals.userId
    const token = await authService.loginUser(userId)

    return res.status(200).send(`Session token: ${token}`)
}

