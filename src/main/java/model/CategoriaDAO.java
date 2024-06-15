package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAO extends AbstractDAO<CategoriaBean> {

	// Nome della tabella nel database
	private static final String TABLE_NAME = "categoria";

	@Override
	public synchronized void doSave(CategoriaBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;

		String query = "INSERT INTO " + CategoriaDAO.TABLE_NAME + " (nome) VALUES (?)";

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);

			statement.setString(1, bean.getNome());

			statement.executeUpdate();

			con.commit();
		} finally {
			// Chiudi lo statement e rilascia la connessione
			try {
				if (statement != null)
					statement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
	}

	@Override
	public synchronized boolean doDelete(String key) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		String query = "DELETE FROM " + CategoriaDAO.TABLE_NAME + " WHERE nome = ?";

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key);

			result = statement.executeUpdate();
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}

		return result != 0;
	}

	@Override
	public synchronized CategoriaBean doRetrieveByKey(String key) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		CategoriaBean categoria = new CategoriaBean();

		String query = "SELECT * FROM " + CategoriaDAO.TABLE_NAME + " WHERE nome = ?";

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key);

			ResultSet result = statement.executeQuery();

			while (result.next()) {
				categoria.setNome(result.getString("nome"));
			}
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}

		return categoria;
	}

	@Override
	public synchronized List<CategoriaBean> doRetrieveAll(String order) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;

		List<CategoriaBean> categorie = new ArrayList<>();

		String query = "SELECT * FROM " + CategoriaDAO.TABLE_NAME;

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);

			ResultSet result = statement.executeQuery();

			while (result.next()) {
				CategoriaBean categoria = new CategoriaBean();

				categoria.setNome(result.getString("nome"));

				categorie.add(categoria);
			}
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}

		return categorie;
	}

	public synchronized List<CategoriaBean> searchBy(String search) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		List<CategoriaBean> categorie = new ArrayList<>();
		CategoriaBean categoria = new CategoriaBean();

		String query = "SELECT * FROM " + CategoriaDAO.TABLE_NAME + " WHERE nome LIKE ?";

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, "%" + search + "%");

			ResultSet result = statement.executeQuery();

			while (result.next()) {
				categoria = new CategoriaBean();

				categoria.setNome(result.getString("nome"));

				categorie.add(categoria);
			}
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		return categorie;
	}

}
