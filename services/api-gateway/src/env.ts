export const userURL = process.env.NODE_ENV === "development" ? "http://localhost:5000/" : "http://userservice:5000/"
export const watchlistURL = process.env.NODE_ENV === "development" ? "http://localhost:5001/" : "http://watchlistservice:5001/"
export const reviewsURL = process.env.NODE_ENV === "development" ? "http://localhost:5002/" : "http://reviewservice:5002/"
export const movieURL = process.env.NODE_ENV === "development" ? "http://localhost:9001/" : "http://movieservice:9001/"
