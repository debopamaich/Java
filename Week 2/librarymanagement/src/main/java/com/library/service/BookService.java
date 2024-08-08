package com.library.service;

import com.library.repository.BookRepository;

public class BookService {

    private BookRepository bookRepository;

    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public void manageBooks() {
        if (bookRepository != null) {
            bookRepository.saveBook();
            System.out.println("Managing books...");
        } else {
            System.out.println("BookRepository is not initialized.");
        }
    }
}
