import * as cors from "cors";
import { config } from "dotenv";
config();

import * as express from "express";
import UserOperations from "./routes/user";

const app = express();
const PORT = 5000;
app.use(cors({ origin: "*" }));

app.use(
  express.urlencoded({
    extended: true,
  })
);
app.use(express.json());

app.use("/user", UserOperations);

app.listen(PORT);

console.log(`Listening on PORT: ${PORT}`);
