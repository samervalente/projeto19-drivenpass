import { Router } from "express";
import schemaValidator from "../middlewares/schemaValidatorMiddleware";
import wifiSchema from "../schemas/wifiSchema"
import validateToken from "../middlewares/tokenValidatorMIddleware";
import { createWifi, getUserWifis, getWifiById, deleteWifi } from "../controllers/wifiController";
const routes = Router()

routes.post("/wifis", schemaValidator(wifiSchema), validateToken, createWifi)
routes.get("/wifis", validateToken, getUserWifis)
routes.get("/wifis/:id", validateToken, getWifiById)
routes.delete("/wifis/:id", validateToken, deleteWifi)

export default routes