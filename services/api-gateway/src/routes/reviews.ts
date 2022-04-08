import * as express from 'express'
import { authenticateToken } from '../middleware/authenticated'
import axios from 'axios'
import {movieURL, reviewsURL, userURL} from '../env'
import { calculateNewRating } from '../helper/functions'

let app = express.Router()

app.get('/get', async (req, res) => {
  try{
    let comments = []
    const {page, movieID } = req.query
    const {data} = await axios.get(
      `${reviewsURL}getreviews?page=${page}&movieID=${movieID}`
    )
    let temp = data

    for(let i of temp){
      const user = await axios.get(
        `${userURL}user/data?id=${i.user_id}`
      )
      let username = user.data.username

      i.username = username
      
    }
    
    return res.json(temp)

    }catch(e){
      // console.log(e);
      return res.json({error: "Internal server error"})
    }
  })

  app.post('/add', authenticateToken, async (req, res) => {
    try{
      const {movie_id, rating, comment, title} = req.body
      const {data} = await axios.post(
        `${reviewsURL}addreview`, 
            {
                user_id: (req as any).user.id,
                movie_id,
                rating: Number(rating),
                comment,
                title
            }
        )

      const getCount  = await axios.get(
        `${reviewsURL}countreview?movie_id=${movie_id}`, 
      )

      const { rating_sum, total_reviews } = getCount.data;

      let newRating = calculateNewRating(rating_sum, total_reviews)

      await axios.patch(
        `${movieURL}movies/${movie_id}/rate`, 
            {
                rating: newRating
            }
      )

      return res.json({newRating, id: data[0].id})
  
      }catch(e){
        return res.json({error: "Internal server error"})
      }
  })
  app.post('/delete', authenticateToken, async (req, res) => {
      try{
        const {movie_id, review_id} = req.body

        const check = await axios.get(
          `${reviewsURL}checkreview?review_id=${review_id}`
        )

        if(check.data.user_id != (req as any).user.id) return res.json({error: "Post does not belong to you"})

        const { data } = await axios.post(
            `${reviewsURL}deletereview`,
            {
                review_id
            }
        )

        const getCount  = await axios.get(
          `${reviewsURL}countreview?movie_id=${movie_id}`, 
        )
  
        const { rating_sum, total_reviews } = getCount.data;

        let newRating = calculateNewRating(rating_sum, total_reviews)
  
        await axios.patch(
          `${movieURL}movies/${movie_id}/rate`, 
            {
                rating: newRating
            }
        )

        return res.json({newRating})
        
      }catch(_){
        return res.json({error: "Internal server error"})
      }
    })

export default app
