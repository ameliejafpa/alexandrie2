package dao;

import java.util.ArrayList;

public interface IDao<T> {
	public boolean create(T object);
	public ArrayList<T> read();
	public boolean update(T object, int id);
	public boolean delete(int id);
	public T findById(int id);
}