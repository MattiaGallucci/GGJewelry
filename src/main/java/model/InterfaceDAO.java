package model;

import java.sql.SQLException;
import java.util.List;

public interface InterfaceDAO<T> {
	public void doSave(T bean) throws SQLException;

	public boolean doDelete(String key) throws SQLException;

	public boolean doDelete(String key1, String key2) throws SQLException;

	public abstract T doRetrieveByKey(String key) throws SQLException;

	public abstract T doRetrieveByKey(String key1, String key2) throws SQLException;

	public List<T> doRetrieveAll(String order) throws SQLException;

	public boolean doUpdate(T bean) throws SQLException;

	public List<T> doRetrieveAllByKey(String key) throws SQLException;

}
