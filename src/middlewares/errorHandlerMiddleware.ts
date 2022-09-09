import { Prisma, PrismaClient } from "@prisma/client";
import {Request, Response, NextFunction} from "express"

interface IError {
    type: string;
    message: string;
    code: string;
    meta:any;
}


export default function errorHandler(error: IError, req: Request, res: Response, next: NextFunction){
    let {type, message} = error
    switch(type){
        case "unauthorized": return res.status(401).send(message)
        case "not_found": return res.status(404).send(message)
        case "conflict": return res.status(409).send(message)
        case "invalid_body": return res.status(422).send(message)
    }

    //Handler exceptions and errors in prisma models constraints
   console.log(error)
    if(error instanceof Prisma.PrismaClientKnownRequestError){
        const errorEntity: string = error.meta.target[1]
        let messageError: string = "";
     

        switch(errorEntity){
            case "title": messageError = "There is a unique constraint violation. You canno't create with this title."
        }

        return res.status(409).send(messageError)
    }
   

    return res.sendStatus(500)
}


