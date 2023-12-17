import domain.Book;
import repository.*;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class Main {
    public static void main(String[] args) {
        IRepository<Book, Integer> repo = null;

        try (FileReader fr = new FileReader("settings.properties"))
        {
            Properties props = new Properties();
            props.load(fr);

            String repoType = props.getProperty("repository_type");
            String sourceName = props.getProperty("book_repository");
            switch (repoType)
            {
                case "inmemory":
                    repo = new BookMemoryRepository();
                    break;
                case "textfile":
                    repo = new BookFileRepository(sourceName);
                    break;
                case "binaryfile":
                    repo = new BookBinaryFileRepository(sourceName);
                    break;
                case "database":
                    repo = new BookDatabaseRepository(sourceName);
                    break;
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        for (Book b: repo.getAll())
            System.out.println(b);

        Book b = new Book(100, "Authors100", "Title100", 100);
        try {
            repo.add(b);
        } catch (DuplicateEntityException e) {
            throw new RuntimeException(e);
        }
    }
}