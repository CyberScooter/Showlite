import { createPool } from "slonik";

const pool = createPool(process.env.DATABASE_URL as string);

export default pool;
