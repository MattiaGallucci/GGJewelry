package model;

import java.io.Serializable;

public class InserimentoBean implements Serializable {
    private static final long serialVersionUID = 1L;
    private String prodottoId;
    private int ordineId;
    private int quantita;

    public InserimentoBean() {
        this.prodottoId = "null";
        this.ordineId = -1;
        this.quantita = -1;
    }

    public String getProdottoId() {
        return prodottoId;
    }

    public void setProdottoId(String prodottoId) {
        this.prodottoId = prodottoId;
    }

    public int getOrdineId() {
        return ordineId;
    }

    public void setOrdineId(int ordineId) {
        this.ordineId = ordineId;
    }

    public int getQuantita() {
        return quantita;
    }

    public void setQuantita(int quantita) {
        this.quantita = quantita;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
