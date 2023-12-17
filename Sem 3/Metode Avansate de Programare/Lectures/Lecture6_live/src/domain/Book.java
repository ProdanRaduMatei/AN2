package domain;

import java.io.Serializable;

public class Book implements Identifiable<Integer>, Serializable
{
    private Integer id;
    private String authors;
    private String title;
    private int numberOfPages;

    public Book(Integer id, String authors, String title, int numberOfPages)
    {
        this.id = id;
        this.authors = authors;
        this.title = title;
        this.numberOfPages = numberOfPages;
    }

    @Override
    public String toString() {
        return "domain.Book{" +
                "id='" + id + '\'' +
                "authors='" + authors + '\'' +
                ", title='" + title + '\'' +
                ", numberOfPages=" + numberOfPages +
                '}';
    }

    public String getAuthors() {
        return authors;
    }

    public int getNumberOfPages() {
        return numberOfPages;
    }

    public String getTitle() {
        return title;
    }

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Integer id) {
        this.id = id;
    }

    public String getAuthor() {
        return this.authors;
    }
}