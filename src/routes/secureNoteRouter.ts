import { Router } from "express";
import schemaValidator from "../middlewares/schemaValidatorMiddleware";
import secureNoteSchema from "../schemas/secureNoteSchema";
import validateToken from "../middlewares/tokenValidatorMIddleware";
import { createSecureNotes, getUserSecureNotes, getSecureNoteById, deleteSecureNote } from "../controllers/secureNoteController";
const routes = Router()

routes.post("/securenotes", schemaValidator(secureNoteSchema), validateToken, createSecureNotes)
routes.get("/securenotes", validateToken, getUserSecureNotes)
routes.get("/securenotes/:id", validateToken, getSecureNoteById)
routes.delete("/securenotes/:id", validateToken, deleteSecureNote)

export default routes