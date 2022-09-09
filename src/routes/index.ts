import { Router } from "express";
import authRouter from "./authRouter"
import credentialRouter from "./credentialRouter"
const routes = Router()

routes.use(authRouter)
routes.use(credentialRouter)

export default routes