import * as express from 'express'
import { authenticateToken } from '../middleware/authenticated'
import axios from 'axios'
import {watchlistURL, movieURL} from '../env'

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

  app.post('/remove', authenticateToken, async (req, res) => {
    const {movieID} = req.body
    try{
      const {data} = await axios.post(
        `${watchlistURL}watchlist/remove`,
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
        const { data } = await axios.get(
          `${watchlistURL}watchlist/get?limit=${(req as any).query.limit}&pageNum=${(req as any).query.pageNum}&id=${(req as any).user.id}`,
        )


        for(const i of data){
          const { data } = await axios.get(
            `${movieURL}get`,
          )
  
        }
        console.log(data[0]);

        return res.json(data)
    }catch(_){
      return res.json({error: "Internal server error"})
    }
  })

export default app
