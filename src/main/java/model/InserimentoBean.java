package model;

import java.io.Serializable;

public class InserimentoBean implements Serializable {
    private static final long serialVersionUID = 1L;
    private String prodottoId;
    private int ordineId;
    private int quantita;
    private String immagine;
    private String nome;
    private int costo;

    public InserimentoBean() {
        this.prodottoId = "null";
        this.ordineId = -1;
        this.quantita = -1;
        this.immagine = "null";
        this.nome = "null";
        this.costo = -1;
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

    public String getImmagine() {
        return immagine;
    }

    public void setImmagine(String immagine) {
        this.immagine = immagine;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getCosto() {
        return costo;
    }

    public void setCosto(int costo) {
        this.costo = costo;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
