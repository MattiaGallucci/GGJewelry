package model;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UtenteDAO extends AbstractDAO<UtenteBean>{
	private static final String TABLE_NAME = "utente";
	
	@Override
	public synchronized void doSave(UtenteBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		String query = "INSERT INTO " + UtenteDAO.TABLE_NAME + " (email, username, password, nome, cognome, admin) VALUES (?, ?, ?, ?, ?, ?)";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			statement.setString(1, bean.getEmail());
			statement.setString(2, bean.getUsername());
			statement.setString(3, hashPassword(bean.getPassword()));
			statement.setString(4, bean.getNome());
			statement.setString(5, bean.getCognome());
			statement.setBoolean(6, bean.isAdmin());
			
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
		
		String query = "DELETE FROM " + UtenteDAO.TABLE_NAME + " WHERE email = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key);
			
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
	
	@Override
	public synchronized UtenteBean doRetrieveByKey(String key) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		UtenteBean utente = new UtenteBean();
		
		String query = "SELECT * FROM " + UtenteDAO.TABLE_NAME + " WHERE email = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				utente.setEmail(result.getString("email"));
				utente.setUsername(result.getString("username"));
				utente.setPassword(result.getString("password"));
				utente.setNome(result.getString("nome"));
				utente.setCognome(result.getString("cognome"));
				utente.setAdmin(result.getBoolean("admin"));
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
		
		return utente;
	
	}
	
	@Override
	public synchronized List<UtenteBean> doRetrieveAll(String order) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		List<UtenteBean> utenti = new ArrayList<>();
		
		String query = "SELECT * FROM " + UtenteDAO.TABLE_NAME;
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				UtenteBean utente = new UtenteBean();
				
				utente.setEmail(result.getString("email"));
				utente.setUsername(result.getString("username"));
				utente.setPassword(result.getString("password"));
				utente.setNome(result.getString("nome"));
				utente.setCognome(result.getString("cognome"));
				utente.setAdmin(result.getBoolean("admin"));
				
				utenti.add(utente);
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
		
		return utenti;
	}
	
	public synchronized boolean doUpdate(UtenteBean bean, String key) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		
		String query = "UPDATE " + UtenteDAO.TABLE_NAME + " SET email = ?, username = ?, password = ?, nome = ?, cognome = ?, admin = ? WHERE email = ?;";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			statement.setString(1, bean.getEmail());
			statement.setString(2, bean.getUsername());
			statement.setString(3, bean.getPassword());
			statement.setString(5, bean.getNome());
			statement.setString(6, bean.getCognome());
			statement.setBoolean(7, bean.isAdmin());
			statement.setString(8, key);
			
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
	
	public synchronized boolean checkEmail(String email) throws SQLException{
		boolean alreadyUsed = false;
		Connection con = null;
		PreparedStatement statement = null;
		
		String query = "SELECT * FROM " + UtenteDAO.TABLE_NAME + " WHERE email = ?";

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);

			statement.setString(1, email);
			ResultSet result = statement.executeQuery();
			
			if(result.next()) {
				alreadyUsed = true;
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

		return alreadyUsed;

	}
	
	public synchronized boolean checkUsername(String username) throws SQLException{
		boolean alreadyUsed = false;
		Connection con = null;
		PreparedStatement statement = null;

		String query = "SELECT * FROM " + UtenteDAO.TABLE_NAME + " WHERE username = ?";

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);

			statement.setString(1, username);
			ResultSet result = statement.executeQuery();
			
			if(result.next()) {
				alreadyUsed = true;
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

		return alreadyUsed;
	}
	
	public String hashPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(password.getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1)
                    hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            // In caso di errore, restituisci la password in chiaro
            return password;
        }
    }
	
	public synchronized String retrieveEncryptedPassword(String username) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;
        String encryptedPassword = null;

        String selectSQL = "SELECT password FROM " + UtenteDAO.TABLE_NAME + " WHERE username = ?";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            statement = connection.prepareStatement(selectSQL);
            statement.setString(1, username);

            ResultSet result = statement.executeQuery();

            if (result.next()) {
                encryptedPassword = result.getString("password");
            }
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }

        return encryptedPassword;
    }
}
