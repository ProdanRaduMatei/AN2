package repository;

import domain.Identifiable;

public abstract class FileRepository<T extends Identifiable, U>
        extends MemoryRepository<T, U> {
    protected String filename;

    public FileRepository(String filename) {
        this.filename = filename;
        this.readFromFile();
    }

    public abstract void readFromFile();
    public abstract void writeToFile();

    @Override
    public void add(T elem) throws DuplicateEntityException
    {
        super.add(elem);
        this.writeToFile();
    }
}
