package com.example.wap.daos;

import com.example.wap.models.Movie;
import com.example.wap.repositories.MovieRepository;
import java.util.Objects;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

/**
 * Contains implementations of various CRUD operations for the {@code movies} table.
 */
@RestController
public class MovieDao {

  private final MovieRepository movieRepository;

  @Autowired
  public MovieDao(MovieRepository movieRepository) {
    this.movieRepository = movieRepository;
  }

  /**
   * Finds all entries in the {@code movies} table.
   *
   * @return collection of all movies
   */
  @GetMapping("/findAllMovies")
  public Iterable<Movie> findAllMovies() {
    return movieRepository.findAll();
  }

  /**
   * Finds the specified entry in the {@code movies} table.
   *
   * @param id movie id
   * @return the desired movie, or {@code null} if not found
   */
  @GetMapping("/findMovieById/{id}")
  public Movie findMovieById(@PathVariable("id") Integer id) {
    return movieRepository.findById(id).orElse(null);
  }

  /**
   * Deletes the specified entry from the {@code movies} table.
   *
   * @param id movie id
   */
  @GetMapping("/deleteMovie/{id}")
  public void deleteMovie(@PathVariable("id") Integer id) {
    movieRepository.deleteById(id);
  }

  /**
   * Creates a new default entry in the {@code movies} table.
   *
   * @return the new movie
   */
  @GetMapping("/createMovie")
  public Movie createMovie() {
    Movie movie = new Movie();
    movie.setTitle("New Movie");
    return movieRepository.save(movie);
  }

  /**
   * Renames the specified entry in the {@code movies} table.
   *
   * @param id       movie id
   * @param newTitle new movie title
   * @return the modified movie, or {@code null} if not found
   */
  @GetMapping("/renameMovie/{id}/{newTitle}")
  public Movie renameMovie(@PathVariable("id") Integer id,
      @PathVariable("newTitle") String newTitle) {
    Movie movie = movieRepository.findById(id).orElse(null);
    if (Objects.nonNull(movie)) {
      movie.setTitle(newTitle);
      return movieRepository.save(movie);
    } else {
      return null;
    }
  }
}
