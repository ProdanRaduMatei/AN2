import domain.Book;
import repository.*;

public class Main {
    public static void main(String[] args) {
        IRepository<Book, Integer> repo = new BookBinaryFileRepository("books.bin");

//        Book b1 = new Book(4, "Author1", "Book1", 120);
//        Book b2 = new Book(5, "Author2", "Book2", 200);
//
//        try
//        {
//            repo.add(b1);
//            repo.add(b2);
//        }
//        catch (DuplicateEntityException e)
//        {
//            System.out.println(e.getMessage());
//        }

        for (Book b: repo.getAll())
            System.out.println(b);
    }
}