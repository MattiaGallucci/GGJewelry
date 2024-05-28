package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class IndirizzoDAO extends AbstractDAO<IndirizzoBean> {

    // Nome della tabella nel database
    private static final String TABLE_NAME = "indirizzo";

    // Salva un nuovo indirizzo nel database
    public synchronized void doSave(IndirizzoBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;

        // Query SQL per inserire un nuovo indirizzo
        String query = "INSERT INTO " + IndirizzoDAO.TABLE_NAME
                + " (citta, provincia, cap, via, civico, utenteEmail) VALUES (?, ?, ?, ?, ?, ?);";

        try {
            // Ottieni una connessione dal pool
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(query);

            // Imposta i parametri della query
            statement.setString(1, bean.getCitta());
            statement.setString(2, bean.getProvincia());
            statement.setString(3, bean.getCap());
            statement.setString(4, bean.getVia());
            statement.setString(5, bean.getCivico());
            statement.setString(6, bean.getUtenteEmail());

            // Esegui l'aggiornamento
            statement.executeUpdate();

            // Conferma le modifiche
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

    // Elimina un indirizzo dal database utilizzando la chiave primaria
    public synchronized boolean doDelete(String key) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        int result = 0;

        // Query SQL per eliminare un indirizzo
        String query = "DELETE FROM " + IndirizzoDAO.TABLE_NAME + " WHERE id = ?";

        try {
            // Ottieni una connessione dal pool
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(query);
            statement.setString(1, key);

            // Esegui l'aggiornamento
            result = statement.executeUpdate();
            
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

        // Ritorna true se l'eliminazione ha avuto successo
        return result != 0;
    }

    // Recupera un indirizzo dal database utilizzando la chiave primaria
    public synchronized IndirizzoBean doRetrieveByKey(String key) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        IndirizzoBean indirizzo = new IndirizzoBean();

        // Query SQL per selezionare un indirizzo
        String query = "SELECT * FROM " + IndirizzoDAO.TABLE_NAME + " WHERE id = ?";

        try {
            // Ottieni una connessione dal pool
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(query);
            statement.setString(1, key);

            // Esegui la query
            ResultSet result = statement.executeQuery();

            // Recupera i dati dal ResultSet
            while (result.next()) {
                indirizzo.setId(result.getInt("id"));
                indirizzo.setCitta(result.getString("citta"));
                indirizzo.setProvincia(result.getString("provincia"));
                indirizzo.setCap(result.getString("cap"));
                indirizzo.setVia(result.getString("via"));
                indirizzo.setCivico(result.getString("civico"));
                indirizzo.setUtenteEmail(result.getString("utenteEmail"));
            }
        } finally {
            // Chiudi lo statement e rilascia la connessione
            try {
                if (statement != null)
                    statement.close();
            } finally {
                DriverManagerConnectionPool.releaseConnection(con);
            }
        }

        return indirizzo;
    }

    // Recupera tutti gli indirizzi dal database
    public synchronized List<IndirizzoBean> doRetrieveAll() throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        List<IndirizzoBean> indirizzi = new ArrayList<>();

        // Query SQL per selezionare tutti gli indirizzi
        String query = "SELECT * FROM " + IndirizzoDAO.TABLE_NAME;

        try {
            // Ottieni una connessione dal pool
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(query);

            // Esegui la query
            ResultSet result = statement.executeQuery();

            // Recupera i dati dal ResultSet
            while (result.next()) {
                IndirizzoBean indirizzo = new IndirizzoBean();
                indirizzo.setId(result.getInt("id"));
                indirizzo.setCitta(result.getString("citta"));
                indirizzo.setProvincia(result.getString("provincia"));
                indirizzo.setCap(result.getString("cap"));
                indirizzo.setVia(result.getString("via"));
                indirizzo.setCivico(result.getString("civico"));
                indirizzo.setUtenteEmail(result.getString("utenteEmail"));

                indirizzi.add(indirizzo);
            }
        } finally {
            // Chiudi lo statement e rilascia la connessione
            try {
                if (statement != null)
                    statement.close();
            } finally {
                DriverManagerConnectionPool.releaseConnection(con);
            }
        }

        return indirizzi;
    }

    // Aggiorna un indirizzo nel database
    public synchronized boolean doUpdate(IndirizzoBean bean) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        int result = 0;

        // Query SQL per aggiornare un indirizzo
        String query = "UPDATE " + IndirizzoDAO.TABLE_NAME
                + " SET citta = ?, provincia = ?, cap = ?, via = ?, civico = ? WHERE id = ? AND utenteEmail = ?;";

        try {
            // Ottieni una connessione dal pool
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(query);

            // Imposta i parametri della query
            statement.setString(1, bean.getCitta());
            statement.setString(2, bean.getProvincia());
            statement.setString(3, bean.getCap());
            statement.setString(4, bean.getVia());
            statement.setString(5, bean.getCivico());
            statement.setInt(6, bean.getId());
            statement.setString(7, bean.getUtenteEmail());

            // Esegui l'aggiornamento
            result = statement.executeUpdate();

            // Conferma le modifiche
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

        // Ritorna true se l'aggiornamento ha avuto successo
        return result != 0;
    }

    // Recupera tutti gli indirizzi associati a un utente specifico
    public synchronized List<IndirizzoBean> doRetrieveAllByKey(String key) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        List<IndirizzoBean> indirizzi = new ArrayList<>();

        // Query SQL per selezionare gli indirizzi di un utente specifico
        String query = "SELECT * FROM " + IndirizzoDAO.TABLE_NAME + " WHERE utenteEmail = ?;";

        try {
            // Ottieni una connessione dal pool
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(query);
            statement.setString(1, key);

            // Esegui la query
            ResultSet result = statement.executeQuery();

            // Recupera i dati dal ResultSet
            while (result.next()) {
                IndirizzoBean indirizzo = new IndirizzoBean();
                indirizzo.setId(result.getInt("id"));
                indirizzo.setCitta(result.getString("citta"));
                indirizzo.setProvincia(result.getString("provincia"));
                indirizzo.setCap(result.getString("cap"));
                indirizzo.setVia(result.getString("via"));
                indirizzo.setCivico(result.getString("civico"));
                indirizzo.setUtenteEmail(result.getString("utenteEmail"));

                indirizzi.add(indirizzo);
            }
        } finally {
            // Chiudi lo statement e rilascia la connessione
            try {
                if (statement != null)
                    statement.close();
            } finally {
                DriverManagerConnectionPool.releaseConnection(con);
            }
        }

        return indirizzi;
    }
}
