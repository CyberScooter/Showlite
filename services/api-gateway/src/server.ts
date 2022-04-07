import * as cors from "cors";
import { config } from "dotenv";
import * as httpProxy from 'express-http-proxy'
import * as express from "express";
import * as jwt from "jsonwebtoken";
import axios from "axios"
import UserOperations from './routes/user'
import WatchlistOperations from './routes/watchlist'
config();

const app = express()
const PORT = 5010;

app.use(
  express.urlencoded({
    extended: true,
  })
)

app.use('/user', UserOperations)
app.use('/watchlist', WatchlistOperations)


app.listen(PORT);

console.log(`Listening on PORT: ${PORT}`);
