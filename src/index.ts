import express from "express"
import "express-async-errors"
import cors from "cors"
import dotenv from "dotenv"
import routes from "./routes"
import ErrorHandler from "./middlewares/errorHandlerMiddleware"

dotenv.config()
const app = express()
const PORT = 5000

app.use([cors(), express.json()])

app.use(routes)
app.use(ErrorHandler)

app.listen(PORT, () => console.log(`Servidor rodando corretamente na porta ${PORT}`))
