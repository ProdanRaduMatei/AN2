package repository;

import domain.Book;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BookDatabaseRepository extends DatabaseRepository<Book, Integer> {
    public BookDatabaseRepository(String tableName) {
        super(tableName);
        getData();
    }

    @Override
    public void getData() {
        try
        {
            openConnection();
            String selectString = "SELECT * FROM " + tableName + ";";
            try (PreparedStatement ps = conn.prepareStatement(selectString))
            {
                ResultSet resultSet = ps.executeQuery();
                while (resultSet.next())
                {
                    int id = resultSet.getInt("id");
                    String authors = resultSet.getString("authors");
                    String title = resultSet.getString("title");
                    int pages = resultSet.getInt("pages");
                    Book book = new Book(id, authors, title, pages);
                    elems.add(book);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        finally {
            try {
                closeConnection();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public void add(Book elem) throws DuplicateEntityException
    {
        try
        {
            openConnection();
            String insertString = "INSERT INTO " + tableName + " VALUES (?, ?, ?, ?);";
            try (PreparedStatement ps = conn.prepareStatement(insertString)) {
                ps.setInt(1, elem.getId());
                ps.setString(2, elem.getAuthor());
                ps.setString(3, elem.getTitle());
                ps.setString(4, elem.getTitle());
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                closeConnection();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
