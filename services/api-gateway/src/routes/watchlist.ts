import * as express from 'express'
import { authenticateToken } from '../middleware/authenticated'
import axios from 'axios'
import {watchlistURL, movieURL, userURL} from '../env'

let app = express.Router()


app.post('/add', authenticateToken, async (req, res) => {
  const {movieID} = req.body
  try{
    const {data} = await axios.post(
      `${watchlistURL}watchlist/add`,
      { 
          movieID,
          id: (req as any).user.id
        }
    )

    return res.json(data)

    }catch(_){
      return res.json({error: "Internal server error"})
    }
  })

  app.post('/delete', authenticateToken, async (req, res) => {
    const {movieID} = req.body
    try{
      const {data} = await axios.post(
        `${watchlistURL}watchlist/delete`,
        { 
            movieID,
            id: (req as any).user.id
        }
      )
      return res.json(data)
  
      }catch(_){
        return res.json({error: "Internal server error"})
      }
  })
  app.get('/get', authenticateToken, async (req, res) => {
    try{
        let movies = []
        const resp = await axios.get(
          `${userURL}user/data?id=${(req as any).user.id}`
        )

        const { data } = await axios.get(
          `${watchlistURL}watchlist/get?limit=${(req as any).query.limit}&pageNum=${(req as any).query.pageNum}&id=${resp.data.id}`
        )

        for(const i of data){
          const { data } = await axios.get(
            `${movieURL}movies/${i.movie_id}`
          )
          movies.push(data)
        }

        return res.json({movies})
    }catch(e){
      return res.json({error: "Internal server error"})
    }
  })

export default app
