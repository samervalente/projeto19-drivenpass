import { Router } from "express";
import schemaValidator from "../middlewares/schemaValidatorMiddleware";
import credentialSchema from "../schemas/credentialSchema";
import validateToken from "../middlewares/tokenValidatorMIddleware";
import {createCredential, getUserCredentials, getCredentialById} from "../controllers/credentialController"

const routes = Router()
routes.post("/credentials", schemaValidator(credentialSchema), validateToken, createCredential)
routes.get("/credentials", validateToken, getUserCredentials)
routes.get("/credentials/:id", validateToken, getCredentialById)

export default routes