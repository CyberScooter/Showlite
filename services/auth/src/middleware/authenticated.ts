import * as jwt from "jsonwebtoken";

export const authenticateToken = (req, res, next) => {
  const authHeader = req.headers["authorization"];
  const token = authHeader && authHeader.split(" ")[1];

  console.log(token);

  if (token == null) return res.sendStatus(401);
  //   console.log(process.env.JWT_TOKEN_SECRET);
  jwt.verify(token, process.env.JWT_TOKEN_SECRET, (err: any, user: any) => {
    if (err) return res.sendStatus(401);

    req.user = user;

    next();
  });
};
