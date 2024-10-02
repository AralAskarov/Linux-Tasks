package com.aral.devopsforapitesting.repository;

import com.aral.devopsforapitesting.Model.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book, Long> {
}
