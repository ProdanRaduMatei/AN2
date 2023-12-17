package repository;

import domain.Identifiable;

public interface IRepository<T extends Identifiable, U> {
    void add(T elem) throws DuplicateEntityException;
    T find(U id);
    int size();
    Iterable<T> getAll();
}
