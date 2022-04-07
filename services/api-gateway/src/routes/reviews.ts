import * as express from 'express'
import { authenticateToken } from '../middleware/authenticated'
import axios from 'axios'
import {reviewsURL} from '../env'

let app = express.Router()



// TODO: finish

// app.get('/get', async (req, res) => {
//   const {page, size} = req.query
//   try{
//     const {data} = await axios.get(
//       `${reviewsURL}/?page=${page}&size=${size}`
//     )
//     return res.json(data.content)

//     }catch(_){
//       return res.json({error: "Internal server error"})
//     }
//   })

//   app.get('/delete', async (req, res) => {
//     try{
//       const {data} = await axios.get(
//         `${movieURL}movies/popular`
//     )
//       return res.json(data)
  
//       }catch(e){
//         return res.json({error: "Internal server error"})
//       }
//   })
//   app.get('/get', async (req, res) => {
//       try{
//         const { data } = await axios.get(
//             `${movieURL}movies/top-rated`,
//           )
    
//           return res.json(data)
        
//       }catch(_){
//         return res.json({error: "Internal server error"})
//       }
//     })

export default app
