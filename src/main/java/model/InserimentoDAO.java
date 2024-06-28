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
        String query = "INSERT INTO " + TABLE_NAME
                + " (prodottoId, ordineId, quantita, immagine, nome, costo) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection con = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = con.prepareStatement(query)) {
            
            statement.setInt(1, bean.getProdottoId());
            statement.setInt(2, bean.getOrdineId());
            statement.setInt(3, bean.getQuantita());
            statement.setString(4, bean.getImmagine());
            statement.setString(5, bean.getNome());
            statement.setInt(6, bean.getCosto());

            statement.executeUpdate();
            con.commit();
        }
    }

    public synchronized boolean doDelete(int prodottoId, int ordineId) throws SQLException {
        String query = "DELETE FROM " + TABLE_NAME + " WHERE prodottoId = ? AND ordineId = ?";
        int result;

        try (Connection con = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = con.prepareStatement(query)) {

            statement.setInt(1, prodottoId);
            statement.setInt(2, ordineId);

            result = statement.executeUpdate();
            con.commit();
        }

        return result != 0;
    }

    public synchronized InserimentoBean doRetrieveByKey(int prodottoId, int ordineId) throws SQLException {
        String query = "SELECT * FROM " + TABLE_NAME + " WHERE prodottoId = ? AND ordineId = ?";
        InserimentoBean inserimento = null;

        try (Connection con = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = con.prepareStatement(query)) {

            statement.setInt(1, prodottoId);
            statement.setInt(2, ordineId);

            ResultSet result = statement.executeQuery();

            if (result.next()) {
                inserimento = new InserimentoBean();
                inserimento.setProdottoId(result.getInt("prodottoId"));
                inserimento.setOrdineId(result.getInt("ordineId"));
                inserimento.setQuantita(result.getInt("quantita"));
                inserimento.setImmagine(result.getString("immagine"));
                inserimento.setNome(result.getString("nome"));
                inserimento.setCosto(result.getInt("costo"));
            }
        }

        return inserimento;
    }
    
    public synchronized List<InserimentoBean> doRetrieveByOrdine(String key) throws SQLException {
        Connection con = null;
        PreparedStatement statement = null;
        List<InserimentoBean> inserimenti = new ArrayList<>();

        String query = "SELECT * FROM " + InserimentoDAO.TABLE_NAME + " WHERE ordineId = ?";

        try {
            con = DriverManagerConnectionPool.getConnection();
            statement = con.prepareStatement(query);
            statement.setInt(1, Integer.parseInt(key));

            ResultSet result = statement.executeQuery();

            while (result.next()) {
                InserimentoBean inserimento = new InserimentoBean();

                inserimento.setProdottoId(result.getInt("prodottoId"));
                inserimento.setOrdineId(result.getInt("ordineId"));
                inserimento.setQuantita(result.getInt("quantita"));
                inserimento.setImmagine(result.getString("immagine"));
                inserimento.setNome(result.getString("nome"));
                inserimento.setCosto(result.getInt("costo"));

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
    public synchronized List<InserimentoBean> doRetrieveAll(String order) throws SQLException {
        List<InserimentoBean> inserimenti = new ArrayList<>();
        String query = "SELECT * FROM " + TABLE_NAME;

        if (order != null && !order.isEmpty()) {
            query += " ORDER BY " + order;
        }

        try (Connection con = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = con.prepareStatement(query);
             ResultSet result = statement.executeQuery()) {

            while (result.next()) {
                InserimentoBean inserimento = new InserimentoBean();
                inserimento.setProdottoId(result.getInt("prodottoId"));
                inserimento.setOrdineId(result.getInt("ordineId"));
                inserimento.setQuantita(result.getInt("quantita"));
                inserimento.setImmagine(result.getString("immagine"));
                inserimento.setNome(result.getString("nome"));
                inserimento.setCosto(result.getInt("costo"));

                inserimenti.add(inserimento);
            }
        }

        return inserimenti;
    }

    @Override
    public synchronized boolean doUpdate(InserimentoBean bean) throws SQLException {
        String query = "UPDATE " + TABLE_NAME
                + " SET quantita = ?, immagine = ?, nome = ?, costo = ? WHERE prodottoId = ? AND ordineId = ?";
        int result;

        try (Connection con = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = con.prepareStatement(query)) {

            statement.setInt(1, bean.getQuantita());
            statement.setString(2, bean.getImmagine());
            statement.setString(3, bean.getNome());
            statement.setInt(4, bean.getCosto());
            statement.setInt(5, bean.getProdottoId());
            statement.setInt(6, bean.getOrdineId());

            result = statement.executeUpdate();
            con.commit();
        }

        return result != 0;
    }
}
