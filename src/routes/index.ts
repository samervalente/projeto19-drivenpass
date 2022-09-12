import { Router } from "express";
import authRouter from "./authRouter"
import credentialRouter from "./credentialRouter"
import secureNoteRouter from "./secureNoteRouter"
import cardRouter from "./cardRouter"
import wifiRouter from "./wifiRouter"
const routes = Router()

routes.use(authRouter)
routes.use(credentialRouter)
routes.use(secureNoteRouter)
routes.use(cardRouter)
routes.use(wifiRouter)

export default routes