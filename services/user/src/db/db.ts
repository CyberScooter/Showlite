import { createPool } from "slonik";

const pool = createPool(process.env.DATABASE_URL as string);

// const pool = createPool({
//   user: process.env.DB_USER,
//   host: process.env.DB_HOST,
//   database: process.env.DB_NAME,
//   password: process.env.DB_PASSWORD,
//   port: process.env.DB_PORT,
// } as any);

export default pool;
