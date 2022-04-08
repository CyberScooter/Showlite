import * as cors from "cors";
import { config } from "dotenv";
import * as httpProxy from 'express-http-proxy'
import * as express from "express";
import * as jwt from "jsonwebtoken";
import axios from "axios"
config();
import UserOperations from './routes/user'
import WatchlistOperations from './routes/watchlist'
import MoviesOperations from './routes/movies'
import ReviewsOperations from './routes/reviews'

const app = express()
const PORT = 5010;
app.use(cors({ origin: "*" }));

app.use(
  express.urlencoded({
    extended: true,
  })
)
app.use(express.json());

app.use('/user', UserOperations)
app.use('/watchlist', WatchlistOperations)
app.use("/movies", MoviesOperations)
app.use("/reviews", ReviewsOperations)


app.listen(PORT);

console.log(`Listening on PORT: ${PORT}`);
