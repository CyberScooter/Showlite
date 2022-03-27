const Pool = require('pg').Pool
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'AWT',
  password: '1234',
  port: 5432,
})


//    display movie review in database

const get_review = (request, response) => {
    const { movie_id } = request.body

    pool.query(
        `SELECT * FROM public.reviews
          WHERE movie_id = $1
          ORDER BY created_at DESC;`,
        [ movie_id],
        (error, results) => {
            if (error) {
                throw error
            }
          response.status(200).json(results.rows)
        }
    )
}

  // Insert movie review in database
const insert_review = (request, response) => {
    const { user_id, movie_id, rating, comment } = request.body
     pool.query(
        `INSERT INTO public.reviews
            (user_id, movie_id, rating, comment, created_at, updated_at)
         VALUES
            ( $1, $2, $3, $4, now(), now());`,[user_id, movie_id, rating, comment], (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
  }


//    update movie review in database

const update_review = (request, response) => {
    const { user_id, movie_id, rating, comment } = request.body

    pool.query(
        `UPDATE public.reviews
            SET rating = $1, comment = $2, updated_at = now()
          WHERE user_id = $3 AND movie_id = $4;`,
        [rating, comment, user_id, movie_id],
        (error, results) => {
            if (error) {
                throw error
            }
            response.status(200).json(results.rows)
        }
    )
}

// delete movie review in database

const delete_review = (request, response) => {
    const { user_id, movie_id } = request.body

    pool.query(
        `DELETE FROM public.reviews
          WHERE user_id = $1 AND movie_id = $2;`,
        [user_id, movie_id],
        (error, results) => {
            if (error) {
                throw error
            }
            response.status(200).send(`Review deleted from User:${user_id} for Moview: ${movie_id}`)
        }
    )
}

module.exports = {
    get_review,
    insert_review,
    update_review,
    delete_review
}

 