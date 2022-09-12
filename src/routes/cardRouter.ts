import { Router } from "express";
import schemaValidator from "../middlewares/schemaValidatorMiddleware";
import cardSchema from "../schemas/cardSchema"
import validateToken from "../middlewares/tokenValidatorMIddleware";
import {createCard, getUserCards, getCardById, deleteCard} from "../controllers/cardController"
const routes = Router()

routes.post("/cards", schemaValidator(cardSchema), validateToken, createCard)
routes.get("/cards", validateToken, getUserCards)
routes.get("/cards/:id", validateToken, getCardById)
routes.delete("/cards/:id", validateToken, deleteCard)

export default routes