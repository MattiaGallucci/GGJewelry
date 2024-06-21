package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ComposizioneOrdineDAO extends AbstractDAO<ComposizioneOrdineBean> {

	private static final String TABLE_NAME = "composizioneordine";
	
	@Override
	public synchronized void doSave(ComposizioneOrdineBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		String query = "INSERT INTO " + ComposizioneOrdineDAO.TABLE_NAME + 
					" (ordine,cliente,prodotto,quantitaProdotto,costoUnitario) VALUES (?,?,?,?,?);";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			statement.setInt(1, bean.getOrdine());
			statement.setString(2, bean.getCliente());
			statement.setString(3, bean.getProdotto());
			statement.setInt(4, bean.getQuantitaProdotto());
			statement.setBigDecimal(5, bean.getCostoUnitario());
			
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

	public synchronized boolean doDelete(String key1,String key2,String key3) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		String query = "DELETE FROM " + ComposizioneOrdineDAO.TABLE_NAME + " WHERE ordine = ? AND cliente = ? AND prodotto = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key1);
			statement.setString(2, key2);
			statement.setString(3, key3);
			
			result = statement.executeUpdate();
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

	public synchronized ComposizioneOrdineBean doRetrieveByKey(String key1, String key2, String key3) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		ComposizioneOrdineBean composizione = new ComposizioneOrdineBean();
		
		String query = "SELECT * FROM " + ComposizioneOrdineDAO.TABLE_NAME + " WHERE ordine = ? AND cliente = ? AND prodotto = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key1);
			statement.setString(2, key2);
			statement.setString(3, key3);
			
			ResultSet result = statement.executeQuery();
				
			while(result.next()) {
				composizione.setOrdine(result.getInt("ordine"));
				composizione.setCliente(result.getString("cliente"));
				composizione.setProdotto(result.getString("prodotto"));
				composizione.setQuantitaProdotto(result.getInt("quantitaProdotto"));
				composizione.setCostoUnitario(result.getBigDecimal("costoUnitario"));
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
		
		return composizione;
	}

	@Override
	public synchronized List<ComposizioneOrdineBean> doRetrieveAll(String order) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		List<ComposizioneOrdineBean> composizioniOrdini = new ArrayList<>();
		
		String query = "SELECT * FROM " + ComposizioneOrdineDAO.TABLE_NAME;
		
//		if(checkOrder(order)) {
//			query += " ORDER BY" + order;
//		}
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				ComposizioneOrdineBean composizione = new ComposizioneOrdineBean();
				
				composizione.setOrdine(result.getInt("ordine"));
				composizione.setCliente(result.getString("cliente"));
				composizione.setProdotto(result.getString("prodotto"));
				composizione.setQuantitaProdotto(result.getInt("quantitaProdotto"));
				composizione.setCostoUnitario(result.getBigDecimal("costoUnitario"));
				
				composizioniOrdini.add(composizione);
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
		
		return composizioniOrdini;
	}
	
	

	@Override
	public synchronized List<ComposizioneOrdineBean> doRetrieveAllByKey(String key) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		List<ComposizioneOrdineBean> composizioni = new ArrayList<>();
		ComposizioneOrdineBean composizione = null;
		
		String query = "SELECT * FROM " + ComposizioneOrdineDAO.TABLE_NAME + " WHERE ordine = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key);
			
			ResultSet result = statement.executeQuery();
				
			while(result.next()) {
				composizione = new ComposizioneOrdineBean();
				composizione.setOrdine(result.getInt("ordine"));
				composizione.setCliente(result.getString("cliente"));
				composizione.setProdotto(result.getString("prodotto"));
				composizione.setQuantitaProdotto(result.getInt("quantitaProdotto"));
				composizione.setCostoUnitario(result.getBigDecimal("costoUnitario"));
				
				composizioni.add(composizione);
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
		
		return composizioni;
	}

	@Override
	public synchronized boolean doUpdate(ComposizioneOrdineBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		
		String query = "UPDATE " + ComposizioneOrdineDAO.TABLE_NAME + " SET "
				+ "ordine = ?, cliente = ?, prodotto = ?, quantitaProdotto = ?, costoUnitario = ? WHERE ordine = ? AND prodotto = ?;";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			statement.setInt(1, bean.getOrdine());
			statement.setString(2, bean.getCliente());
			statement.setString(3, bean.getProdotto());
			statement.setInt(4, bean.getQuantitaProdotto());
			statement.setBigDecimal(5, bean.getCostoUnitario());
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
	
	public synchronized List<ComposizioneOrdineBean> filterByCliente(String cliente) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		List<ComposizioneOrdineBean> composizioniOrdini = new ArrayList<>();
		ComposizioneOrdineBean composizione = new ComposizioneOrdineBean();
		
		String query = "SELECT * FROM " + ComposizioneOrdineDAO.TABLE_NAME + " WHERE cliente = ?" ;

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, cliente);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				composizione = new ComposizioneOrdineBean();
				composizione.setOrdine(result.getInt("ordine"));
				composizione.setCliente(result.getString("cliente"));
				composizione.setProdotto(result.getString("prodotto"));
				composizione.setQuantitaProdotto(result.getInt("quantitaProdotto"));
				composizione.setCostoUnitario(result.getBigDecimal("costoUnitario"));
				
				composizioniOrdini.add(composizione);
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
		
		return composizioniOrdini;
	}
}
