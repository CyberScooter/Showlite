const Pool = require('pg').Pool
const url = require('url')
const params = url.parse(process.env.DATABASE_URL);
const auth = params.auth.split(':');

const config = {
  user: auth[0],
  password: auth[1],
  host: params.hostname,
  port: params.port,
  database: params.pathname.split('/')[1]
};


const pool = new Pool(config);


const get_review = (request, response) => {
  const movieID = request.query.movieID
  const pagenumber = request.query.page

  pool.query(
      `SELECT 
      *
      FROM review
      WHERE movie_id=$1
      ORDER BY review.created_at DESC
      LIMIT 5
      OFFSET ($2 - 1) * 5;`,
      [movieID, pagenumber],  
      (error, results) => {
          if (error) {
            return response.json({error: "Internal server error"})
          }
        return response.status(200).json(results.rows)
      }
  )


}

// Insert movie review in database
const insert_review = (request, response) => {
    const { user_id, movie_id, rating, comment, title } = request.body
     pool.query(
        `INSERT INTO review
            (user_id, title, movie_id, rating, comment, created_at, updated_at)
         VALUES
            ($1, $2, $3, $4, $5, now(), now()) returning id;`,[user_id, title, movie_id, rating, comment], (error, results) => {
      if (error) {
        return response.json({error: "Internal server error"})
      }
      return response.status(200).json(results.rows)
    })
  }

// delete movie review in database

const delete_review = (request, response) => {
    const { review_id } = request.body

    pool.query(
        `DELETE FROM review
          WHERE id = $1;`,
        [review_id],
        (error, results) => {
            if (error) {
              return response.json({error: "Internal server error"})
            }
            return response.status(200).json({success: true})
        }
    )
}

const count_review = (request, response) => {
  const { movie_id } = request.query

  pool.query(
      `SELECT SUM(rating) as rating_sum, COUNT(id) as total_reviews FROM review WHERE movie_id=$1;`,
      [movie_id],
      (error, results) => {
          if (error) {
            return response.json({error: "Internal server error"})
          }
          return response.status(200).json(results.rows[0])
      }
  )
}

const check_review = (request, response) => {
  const { review_id } = request.query

  pool.query(
      `SELECT user_id from review where id=$1`,
      [review_id],
      (error, results) => {
          if (error) {
            return response.json({error: "Internal server error"})
          }
          return response.status(200).json(results.rows[0])
      }
  )
}

module.exports = {
    get_review,
    insert_review,
    delete_review,
    count_review,
    check_review
}

 