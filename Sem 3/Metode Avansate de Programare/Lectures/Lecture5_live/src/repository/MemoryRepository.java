package repository;

import domain.Identifiable;

import java.util.ArrayList;

public class MemoryRepository<T extends Identifiable, U> implements IRepository<T, U> {
    protected ArrayList<T> elems = new ArrayList<>();

    @Override
    public void add(T elem) throws DuplicateEntityException {
        if (find((U) elem.getId()) != null)
            throw new DuplicateEntityException("Element already exists!");
        elems.add(elem);
    }

    @Override
    public T find(U id) {
        for (T elem: elems)
        {
            if (elem.getId().equals(id))
                return elem;
        }
        return null;
    }

    @Override
    public int size() {
        return elems.size();
    }

    @Override
    public Iterable<T> getAll() {
        return elems;
    }
}
