package repository;

import domain.Book;

import java.io.*;
import java.util.ArrayList;

public class BookBinaryFileRepository extends FileRepository<Book, Integer> {

    public BookBinaryFileRepository(String filename)
    {
        super(filename);
    }
    @Override
    public void readFromFile() {
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(filename))) {
            elems = (ArrayList<Book>) ois.readObject();
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void writeToFile() {
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(filename))) {
            oos.writeObject(elems);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
