package test;

import domain.Book;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import repository.BookMemoryRepository;
import repository.DuplicateEntityException;

public class RepositoryTest {
    private BookMemoryRepository repo;

    @BeforeEach
    public void setUp()
    {
        repo = new BookMemoryRepository();
        Book b1 = new Book(4, "Author1", "Book1", 120);
        try {
            repo.add(b1);
        } catch (DuplicateEntityException e) {
            throw new RuntimeException(e);
        }
    }

    @Test
    void testAdd()
    {
        Book b2 = new Book(5, "Author1", "Book1", 120);
        try {
            repo.add(b2);
            Assertions.assertEquals(repo.size(), 2);
        } catch (DuplicateEntityException e) {
            throw new RuntimeException(e);
        }
    }
}
