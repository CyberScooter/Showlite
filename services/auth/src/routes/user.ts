import * as express from "express";
import pool from "../db/db";
import * as jwt from "jsonwebtoken";
import { genSaltSync, hashSync, compare } from "bcrypt";
import { authenticateToken } from "../middleware/authenticated";

let app = express.Router();

app.post("/login", async (req, res) => {
  try {
    const { username, password } = req.body;
    let userFound: any = await pool.query(
      "select * from users where username=$1",
      [username]
    );

    if (userFound.rows[0].rowCount > 0) return { error: "User does not exist" };

    const match = await compare(password, userFound.rows[0].hash);
    delete userFound.rows[0].hash;

    if (match) {
      return res.json({
        user: userFound.rows[0],
        token: jwt.sign(
          { id: userFound.rows[0].id },
          process.env.JWT_TOKEN_SECRET,
          { expiresIn: "7d" }
        ),
      });
    }

    return res.json({ error: "Password does not match" });
  } catch (_) {
    return res.json({ error: "Internal server error" });
  }
});

app.post("/register", async (req, res) => {
  try {
    const { username, email, password } = req.body;
    let userFound = await pool.query(
      "SELECT id from users where username=$1 OR email=$2",
      [username, email]
    );

    if (userFound.rowCount > 0)
      return res.json({
        error: "User already registered under this email or username",
      });

    const salt = genSaltSync(10);
    const hash = hashSync(password, salt);

    let inserted = await pool.query(
      "insert into users(username, email, hash, created_at, updated_at) values ($1, $2, $3, now(), now()) returning *",
      [username, email, hash]
    );
    delete inserted.rows[0].hash;

    return res.json({
      user: inserted.rows[0],
      token: jwt.sign(
        { id: inserted.rows[0].id },
        process.env.JWT_TOKEN_SECRET,
        { expiresIn: "7d" }
      ),
    });
  } catch (e) {
    return res.json({ error: "Internal server error" });
  }
});

app.get("/data", authenticateToken, async (req, res) => {
  try {
    let userFound = await pool.query("SELECT * from users where id=$1", [
      (req as any).user.id,
    ]);

    delete userFound.rows[0].hash;
    delete userFound.rows[0].email;

    return res.json(userFound.rows[0]);
  } catch (e) {
    return res.json({ error: "Internal server error" });
  }
});

export default app;
