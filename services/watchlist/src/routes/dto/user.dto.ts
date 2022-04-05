import { Request, Response, NextFunction } from "express";

export interface CustomRequest extends Request {
  user?: {
    id: number;
  };
  query?: {
    pageNum?: number;
    limit?: string;
  }
}
