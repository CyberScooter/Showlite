import * as express from 'express'
import { authenticateToken } from '../middleware/authenticated'
import axios from 'axios'
import {movieURL} from '../env'

let app = express.Router()


app.get('/get', async (req, res) => {
  const {page, size} = req.query
  try{
    const {data} = await axios.get(
      `${movieURL}movies/?page=${page}&size=${size}`
    )
    return res.json(data.content)

    }catch(_){
      return res.json({error: "Internal server error"})
    }
  })

  app.get('/popular', async (req, res) => {
    try{
      const {data} = await axios.get(
        `${movieURL}movies/popular`
    )
      return res.json(data)
  
      }catch(e){
        return res.json({error: "Internal server error"})
      }
  })
  app.get('/top-rated', async (req, res) => {
      try{
        const { data } = await axios.get(
            `${movieURL}movies/top-rated`,
          )
    
          return res.json(data)
        
      }catch(_){
        return res.json({error: "Internal server error"})
      }
    })


    app.get("/search", async (req, res) => {
        try{
            const {page, size, query} = req.query
            const { data } = await axios.get(
                `${movieURL}movies/search?page=${page}&size=${size}&query=${query}`,
              )
        
              return res.json(data.content)
            
          }catch(_){
            return res.json({error: "Internal server error"})
          }
    })

    app.get("/:id", async (req, res) => {
        try{
            const {id} = req.params
            const { data } = await axios.get(
                `${movieURL}movies/${id}`,
              )
        
              return res.json(data)
            
          }catch(_){
            return res.json({error: "Internal server error"})
          }
    })


export default app
