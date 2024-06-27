package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InserimentoDAO extends AbstractDAO<InserimentoBean> {
	private static final String TABLE_NAME = "inserimento";

	@Override
	public synchronized void doSave(InserimentoBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;

		String query = "INSERT INTO " + InserimentoDAO.TABLE_NAME
				+ " (prodottoId, ordineId, quantita) VALUES (?, ?, ?)";

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);

			statement.setString(1, bean.getProdottoId());
			statement.setInt(2, bean.getOrdineId());
			statement.setInt(3, bean.getQuantita());

			con.commit();
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
	}

	public synchronized boolean doDelete(String key1, String key2) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		String query = "DELETE FROM " + InserimentoDAO.TABLE_NAME + " WHERE prodottoId = ? AND ordineId = ?";

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);

			statement.setString(1, key1);
			statement.setString(2, key2);

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

	public synchronized InserimentoBean doRetrieveByKey(String key1, String key2) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		InserimentoBean inserimento = new InserimentoBean();

		String query = "SELECT * FROM " + InserimentoDAO.TABLE_NAME + " WHERE prodottoId = ? AND ordineId = ?";

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key1);
			statement.setString(2, key2);

			ResultSet result = statement.executeQuery();

			while (result.next()) {
				inserimento.setProdottoId(result.getString("prodottoId"));
				inserimento.setOrdineId(result.getInt("ordineId"));
				inserimento.setQuantita(result.getInt("quantita"));
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

		return inserimento;
	}

	@Override
	public synchronized List<InserimentoBean> doRetrieveAll(String order) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;

		List<InserimentoBean> inserimenti = new ArrayList<>();

		String query = "SELECT * FROM " + InserimentoDAO.TABLE_NAME;

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);

			ResultSet result = statement.executeQuery();

			while (result.next()) {
				InserimentoBean inserimento = new InserimentoBean();

				inserimento.setProdottoId(result.getString("prodottoId"));
				inserimento.setOrdineId(result.getInt("ordineId"));
				inserimento.setQuantita(result.getInt("quantita"));

				inserimenti.add(inserimento);
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

		return inserimenti;
	}

	public synchronized List<InserimentoBean> doRetrieveByOrdine(String key) throws SQLException {
	    Connection con = null;
	    PreparedStatement statement = null;
	    List<InserimentoBean> inserimenti = new ArrayList<>();
	    InserimentoBean inserimento = null;

	    String query = "SELECT * FROM " + InserimentoDAO.TABLE_NAME + " WHERE ordineId = ?";

	    try {
	        con = DriverManagerConnectionPool.getConnection();
	        statement = con.prepareStatement(query);
	        statement.setString(1, key); // Set the key parameter

	        ResultSet result = statement.executeQuery();

	        while (result.next()) {
	            inserimento = new InserimentoBean();

	            inserimento.setProdottoId(result.getString("prodottoId"));
	            inserimento.setOrdineId(result.getInt("ordineId"));
	            inserimento.setQuantita(result.getInt("quantita"));

	            inserimenti.add(inserimento);
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

	    return inserimenti;
	}


	@Override
	public synchronized boolean doUpdate(InserimentoBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;

		String query = "UPDATE " + InserimentoDAO.TABLE_NAME
				+ " SET prodottoId = ?, ordineId = ?, quantita = ? WHERE prodottoId = ? AND ordineId = ?";

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);

			statement.setString(1, bean.getProdottoId());
			statement.setInt(2, bean.getOrdineId());
			statement.setInt(3, bean.getQuantita());

			result = statement.executeUpdate();

			con.commit();
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
}
