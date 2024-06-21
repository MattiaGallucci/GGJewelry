package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MetodoDiPagamentoDAO extends AbstractDAO<MetodoDiPagamentoBean> {
	private static final String TABLE_NAME = "metodoDiPagamento";

	@Override
	public synchronized void doSave(MetodoDiPagamentoBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;

		String query = "INSERT INTO " + MetodoDiPagamentoDAO.TABLE_NAME
				+ " (tipo, iban, numeroCarta, utenteEmail) VALUES (?, ?, ?, ?)";

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);

			statement.setString(1, bean.getTipo());
			statement.setString(2, bean.getIban());
			statement.setString(3, bean.getNumeroCarta());
			statement.setString(4, bean.getUtenteEmail());

			statement.executeUpdate();

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

	public synchronized boolean doDelete(String key) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		String query = "DELETE FROM " + MetodoDiPagamentoDAO.TABLE_NAME + " WHERE id = ?";

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key);

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

	@Override
	public synchronized MetodoDiPagamentoBean doRetrieveByKey(String key) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		MetodoDiPagamentoBean pagamento = new MetodoDiPagamentoBean();

		String query = "SELECT * FROM " + MetodoDiPagamentoDAO.TABLE_NAME + " WHERE id = ?";

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key);

			ResultSet result = statement.executeQuery();

			while (result.next()) {
				pagamento.setId(result.getInt("id"));
				pagamento.setTipo(result.getString("tipo"));
				pagamento.setIban(result.getString("iban"));
				pagamento.setNumeroCarta(result.getString("numeroCarta"));
				pagamento.setUtenteEmail(result.getString("utenteEmail"));
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

		return pagamento;
	}

	@Override
	public synchronized List<MetodoDiPagamentoBean> doRetrieveAll(String order) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;

		List<MetodoDiPagamentoBean> metodiPagamento = new ArrayList<>();

		String query = "SELECT * FROM " + MetodoDiPagamentoDAO.TABLE_NAME;

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);

			ResultSet result = statement.executeQuery();

			while (result.next()) {
				MetodoDiPagamentoBean pagamento = new MetodoDiPagamentoBean();

				pagamento.setId(result.getInt("id"));
				pagamento.setTipo(result.getString("tipo"));
				pagamento.setIban(result.getString("iban"));
				pagamento.setNumeroCarta(result.getString("numeroCarta"));
				pagamento.setUtenteEmail(result.getString("utenteEmail"));

				metodiPagamento.add(pagamento);
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

		return metodiPagamento;
	}

	@Override
	public synchronized boolean doUpdate(MetodoDiPagamentoBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;

		String query = "UPDATE " + MetodoDiPagamentoDAO.TABLE_NAME
				+ " SET tipo = ?, iban = ?, numeroCarta = ? WHERE id = ?";

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);

			statement.setString(1, bean.getTipo());
			if (bean.getTipo().equalsIgnoreCase("iban")) {
				statement.setString(2, bean.getIban());
				statement.setNull(3, java.sql.Types.NULL);
			} else {
				statement.setNull(2, java.sql.Types.NULL);
				statement.setString(3, bean.getNumeroCarta());
			}
			statement.setInt(4, bean.getId());

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
	
	public synchronized List<MetodoDiPagamentoBean> doRetrieveByEmail(String key) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		List<MetodoDiPagamentoBean> metodiPagamento = new ArrayList<>();
		
		String query = "SELECT * FROM " + MetodoDiPagamentoDAO.TABLE_NAME + " WHERE utenteEmail = ?;";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			statement.setString(1, key);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				MetodoDiPagamentoBean pagamento = new MetodoDiPagamentoBean();
				
				pagamento.setId(result.getInt("id"));
				pagamento.setTipo(result.getString("tipo"));
				pagamento.setIban(result.getString("iban"));
				pagamento.setNumeroCarta(result.getString("numeroCarta"));
				pagamento.setUtenteEmail(result.getString("utenteEmail"));

				metodiPagamento.add(pagamento);
			}
		} finally {
			try {
				if(statement != null) {
					statement.close();
				}
			} finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
		return metodiPagamento;
	}
}
