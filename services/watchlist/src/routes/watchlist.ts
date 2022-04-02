import * as express from "express";
import pool from "../db/db";
import { sql } from "slonik";
import { authenticateToken } from "../middleware/authenticated";
import { CustomRequest } from "./dto/user.dto";

let app = express.Router();

app.post(
  "/addToWatchlist",
  authenticateToken,
  async (req: CustomRequest, res) => {
    try {
      const { movieID } = req.body;

      let found = await pool.maybeOne(
        sql`
          select * from watchlist where movie_id=${movieID} and user_id=${req.user.id}
        `
      )

      if(found) return res.json({error: "Already in watchlist"})

      await pool.query(
        sql`insert into watchlist(user_id, movie_id, created_at, updated_at) VALUES (${req.user.id},${movieID},now(),now())`
      );

      res.json({ success: true });
    } catch (_) {
      return res.json({ error: "Internal server error" });
    }
  }
);

app.post(
  "/removeFromWatchlist",
  authenticateToken,
  async (req: CustomRequest, res) => {
    try {
      const { movieID } = req.body;
      await pool.query(
        sql`delete from watchlist where user_id=${req.user.id} and movie_id=${movieID}`
      );

      return res.json({ success: true });
    } catch (_) {
      return res.json({ error: "Internal server error" });
    }
  }
);

app.get("/getWatchlist", authenticateToken, async (req: CustomRequest, res) => {
  try {
    let watchlist: any = await pool.any(sql`
      select 
        movies.*,
        ARRAY_AGG(type) genre
      from 
        users inner join watchlist on users.id=watchlist.user_id 
        inner join movies on watchlist.movie_id = movies.id 
        left join movie_genre on movies.id = movie_genre.movie_id
        left join genre on movie_genre.genre_id = genre.id
      where 
        users.id=${req.user.id}
      group by
        movies.id
      order by 
        movies.created_at desc
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
