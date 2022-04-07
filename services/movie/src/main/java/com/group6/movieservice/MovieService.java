package com.group6.movieservice;

import com.group6.movieservice.serializers.ResponseMessageDTO;
import com.group6.movieservice.serializers.MovieRequestDTO;
import com.group6.movieservice.serializers.MovieResponseDTO;
import com.group6.movieservice.serializers.UpdateRatingDTO;
import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.UUID;

public interface MovieService {
    ResponseMessageDTO uploadPoster(Long movieId, MultipartFile file);
    MovieResponseDTO createMovie(MovieRequestDTO request);
    Page<MovieResponseDTO> searchMovies(int page, int size, String query);
    MovieResponseDTO updateMovie(Long movieId, MovieRequestDTO request);
    MovieResponseDTO getSingleMovie(Long movieId);
    ResponseMessageDTO deleteMovie(Long movieId);
    ResponseMessageDTO updateRating(Long movieId, UpdateRatingDTO request);
    Page<MovieResponseDTO> getAllMovies(int page, int size);
    List<MovieResponseDTO> getPopularMovies();
    List<MovieResponseDTO> topRatedMovies();
}
