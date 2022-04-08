import * as cors from "cors";
import { config } from "dotenv";
config();

import * as express from "express";
import WatchlistOperations from "./routes/watchlist";

const app = express();
const PORT = 5001;
app.use(cors({ origin: "*" }));

app.use(
  express.urlencoded({
    extended: true,
  })
);
app.use(express.json());

app.use("/watchlist", WatchlistOperations);

app.listen(PORT);

console.log(`Listening on PORT: ${PORT}`);
