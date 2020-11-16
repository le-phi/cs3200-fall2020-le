package com.example.wap.repositories;

import com.example.wap.models.Movie;
import org.springframework.data.repository.CrudRepository;

/**
 * Contains various CRUD operations for the {@code movies} table.
 */
public interface MovieRepository
    extends CrudRepository<Movie, Integer> {
}
