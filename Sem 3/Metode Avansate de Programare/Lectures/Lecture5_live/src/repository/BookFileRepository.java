package repository;

import domain.Book;

import java.io.*;

public class BookFileRepository extends FileRepository<Book, Integer> {

    public BookFileRepository(String filename)
    {
        super(filename);
    }

    @Override
    public void readFromFile() {
        try (BufferedReader br = new BufferedReader(new FileReader(filename))) {
            String line = null;
            while ((line = br.readLine()) != null)
            {
                String[] tokens = line.split("[|]");
                if (tokens.length != 4)
                    continue;
                Integer id = Integer.parseInt(tokens[0].trim());
                String authors = tokens[1].trim();
                String title = tokens[2].trim();
                Integer pages = Integer.parseInt(tokens[3].trim());
                Book b = new Book(id, authors, title, pages);
                elems.add(b);
            }
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void writeToFile() {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filename))) {
            for (Book b: elems)
            {
                bw.write(b.getId() + "|" + b.getAuthors() + "|" + b.getTitle() +
                        "|" + b.getNumberOfPages() + "\n");
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
