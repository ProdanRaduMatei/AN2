package test;

import domain.Book;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class BookTest {
    private Book b;

    @BeforeEach
    public void setUp()
    {
        b = new Book(1, "Author1", "Title1", 120);
    }

    @Test
    public void testGetAuthor()
    {
        Assertions.assertTrue(b.getAuthor().equals("Author1"));
    }

    @Test
    public void getId()
    {
        Assertions.assertEquals(b.getId(), 1);
    }
}
