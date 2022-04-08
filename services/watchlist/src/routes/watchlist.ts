import * as express from "express";
import pool from "../db/db";
import { sql } from "slonik";
import { authenticateToken } from "../middleware/authenticated";
import { CustomRequest } from "./dto/user.dto";

let app = express.Router();

app.post(
  "/add",
  async (req: CustomRequest, res) => {
    try {
      const { movieID, id } = req.body;

      let found = await pool.maybeOne(
        sql`
          select * from watchlist where movie_id=${movieID} and user_id=${id}
        `
      )

      if(found) return res.json({error: "Already in watchlist"})

      await pool.query(
        sql`insert into watchlist(user_id, movie_id, created_at, updated_at) VALUES (${id},${movieID},now(),now())`
      );

      res.json({ success: true });
    } catch (_) {
      return res.json({ error: "Internal server error" });
    }
  }
);

app.post(
  "/delete",
  async (req: CustomRequest, res) => {
    try {
      const { movieID, id } = req.body;
      await pool.query(
        sql`delete from watchlist where user_id=${id} and movie_id=${movieID}`
      );

      return res.json({ success: true });
    } catch (_) {
      return res.json({ error: "Internal server error" });
    }
  }
);

app.get("/get", async (req: CustomRequest, res) => {
  try {
    let watchlist: any = await pool.any(sql`
      select 
        watchlist.movie_id
      from 
        watchlist
      where 
        watchlist.user_id=${(req as any).query.id}
      order by 
        watchlist.created_at desc
      limit
        ${req.query.limit} offset ${(req.query.pageNum - 1) * Number(req.query.limit)}
    `);

    return res.json(watchlist);
  } catch (e) {
    console.log(e);
    return res.json({ error: "Internal server error" });
  }
});

export default app;
