import * as express from 'express'
import { authenticateToken } from '../middleware/authenticated'
import axios from 'axios'
import {userURL} from '../env'

let app = express.Router()


app.post('/login', async (req, res) => {
  const {email, password} = req.body
  console.log(req.body);
  try{
    const {data} = await axios.post(
      `${userURL}user/login`,
      { 
          email,
          password
        }
    )
    return res.json(data)

    }catch(_){
      return res.json({error: "Internal server error"})
    }
  })

  app.post('/register', async (req, res) => {
    const {username, email, password} = req.body
    try{
      const {data} = await axios.post(
        `${userURL}user/register`,
        { 
            email,
            username,
            password
          }
      )
      return res.json(data)
  
      }catch(_){
        return res.json({error: "Internal server error"})
      }
  })
  app.get('/data', authenticateToken, async (req, res) => {
    const { data } = await axios.get(
        `${userURL}user/data?id=${(req as any).user.id}`,
      )

      return res.json(data)
  })

export default app
