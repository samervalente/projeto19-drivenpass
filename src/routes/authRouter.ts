import { Router } from "express";
import schemaValidator from "../middlewares/schemaValidatorMiddleware";
import userSchema from "../schemas/authSchema";

import * as authMiddleware from "../middlewares/authMiddleware"
import * as authController from "../controllers/authController"

const routes = Router()

routes.post("/signup", 
schemaValidator(userSchema), authMiddleware.validateEmailExistence, authController.registerUser )

routes.post("/signin", schemaValidator(userSchema), authMiddleware.ValidateUserLoginData, authController.loginUser)

export default routes