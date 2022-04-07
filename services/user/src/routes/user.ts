import * as express from "express";
import pool from "../db/db";
import { sql } from "slonik";
import * as jwt from "jsonwebtoken";
import { genSaltSync, hashSync, compare } from "bcrypt";
import { authenticateToken } from "../middleware/authenticated";
import { json } from "body-parser";

let app = express.Router();

app.post("/login", async (req, res) => {
  try {
    const { email, password } = req.body;
    let userFound: any = await pool.maybeOne(
      sql`select * from users where email=${email}`
    );

    if (!userFound) return res.json({ error: "User does not exist" });

    const match = await compare(password, userFound.hash);
    delete userFound.hash;

    if (match) {
      return res.json({
        user: userFound,
        token: jwt.sign({ id: userFound.id }, process.env.JWT_TOKEN_SECRET, {
          expiresIn: "7d",
        }),
      });
    }

    return res.json({ error: "Password does not match" });
  } catch (e) {
    return res.json({ error: "Internal server error" });
  }
});

app.post("/register", async (req, res) => {
  try {
    const { username, email, password } = req.body;

    let userFound = await pool.maybeOne(
      sql`SELECT id from users where username=${username} OR email=${email}`
    );

    if (userFound)
      return res.json({
        error: "User already registered under this email or username",
      });

    const salt = genSaltSync(10);
    const hash = hashSync(password, salt);

    let inserted = await pool.one(
      sql`insert into users(username, email, hash, created_at, updated_at) values (${username}, ${email}, ${hash}, now(), now()) returning *`
    );
    delete inserted.hash;

    return res.json({
      user: inserted,
      token: jwt.sign({ id: inserted.id }, process.env.JWT_TOKEN_SECRET, {
        expiresIn: "7d",
      }),
    });
  } catch (e) {
    return res.json({ error: "Internal server error" });
  }
});

app.get("/data", async (req, res) => {
  try {
    let userFound = await pool.one(
      sql`SELECT * from users where id=${(req as any).query.id}`
    );

    delete userFound.hash;
    delete userFound.email;

    return res.json(userFound);
  } catch (e) {
    return res.json({ error: "Internal server error" });
  }
});

export default app;
