package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrdineDao extends AbstractDAO<OrdineBean> {

	private static final String TABLE_NAME = "ordine";

	@Override
	public synchronized void doSave(OrdineBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;

		String query = "INSERT INTO " + OrdineDao.TABLE_NAME + " (data, costoTotale, utenteEmail) VALUES (?, ?, ?)";

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);

			statement.setString(1, bean.getData());
			statement.setDouble(2, bean.getCostoTotale());
			statement.setString(3, bean.getUtenteEmail());

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

	@Override
	public synchronized boolean doDelete(String key) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;

		String query = "DELETE FROM " + OrdineDao.TABLE_NAME + " WHERE id = ?";

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);

			statement.setInt(1, Integer.parseInt(key));
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
	public synchronized OrdineBean doRetrieveByKey(String key) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		OrdineBean ordine = new OrdineBean();

		String query = "SELECT * FROM " + OrdineDao.TABLE_NAME + " WHERE id = ?";

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setInt(1, Integer.parseInt(key));

			ResultSet result = statement.executeQuery();

			while (result.next()) {
				ordine.setId(result.getInt("id"));
				ordine.setData(result.getString("data"));
				ordine.setCostoTotale(result.getDouble("costoTotale"));
				ordine.setUtenteEmail(result.getString("utenteEmail"));
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

		return ordine;
	}

	@Override
	public synchronized List<OrdineBean> doRetrieveAll(String order) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;

		List<OrdineBean> ordini = new ArrayList<>();

		String query = "SELECT * FROM " + OrdineDao.TABLE_NAME;

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);

			ResultSet result = statement.executeQuery();

			while (result.next()) {
				OrdineBean ordine = new OrdineBean();

				ordine.setId(result.getInt("id"));
				ordine.setData(result.getString("data"));
				ordine.setCostoTotale(result.getDouble("costoTotale"));
				ordine.setUtenteEmail(result.getString("utenteEmail"));

				ordini.add(ordine);
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

		return ordini;

	}
	
	@Override
	public synchronized boolean doUpdate(OrdineBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		
		String query = "UPDATE " + OrdineDao.TABLE_NAME + " SET data = ?, costoTotale = ?, utenteEmail = ? WHERE id = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			statement.setString(1, bean.getData());
			statement.setDouble(2, bean.getCostoTotale());
			statement.setString(3, bean.getUtenteEmail());
			statement.setInt(4, bean.getId());
			
			result = statement.executeUpdate();
			
			con.commit();
		} finally {
			try {
				if(statement != null) {
					statement.close();
				}
			} finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
		return result != 0;
	}
	
	public synchronized List<OrdineBean> doRetrieveByEmail(String key) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		List<OrdineBean> ordini = new ArrayList<>();
		
		String query = "SELECT * FROM " + OrdineDao.TABLE_NAME + " WHERE utenteEmail = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				OrdineBean ordine = new OrdineBean();
				
				ordine.setId(result.getInt("id"));
				ordine.setData(result.getString("data"));
				ordine.setCostoTotale(result.getDouble("costoTotale"));
				ordine.setUtenteEmail(result.getString("utenteEmail"));

				ordini.add(ordine);
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
		
		return ordini;
	}
	
	public synchronized List<OrdineBean> doRetrieveByDateRange(String dataInizio, String dataFine) throws SQLException {
	    Connection con = null;
	    PreparedStatement statement = null;
	    List<OrdineBean> ordini = new ArrayList<>();
	    String query = "SELECT * FROM " + OrdineDao.TABLE_NAME + " WHERE data BETWEEN ? AND ?";
	    try {
	        con = DriverManagerConnectionPool.getConnection();
	        statement = con.prepareStatement(query);
	        statement.setString(1, dataInizio);
	        statement.setString(2, dataFine);
	        ResultSet result = statement.executeQuery();
	        while (result.next()) {
	            OrdineBean ordine = new OrdineBean();
	            ordine.setId(result.getInt("id"));
	            ordine.setData(result.getString("data"));
	            ordine.setCostoTotale(result.getDouble("costoTotale"));
	            ordine.setUtenteEmail(result.getString("utenteEmail"));
	            ordini.add(ordine);
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
	    return ordini;
	}

}
