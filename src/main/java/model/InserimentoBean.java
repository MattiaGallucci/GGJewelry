package model;

import java.io.Serializable;

public class InserimentoBean implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private int prodottoId;
    private int ordineId;
    private int quantita;
    private String immagine;
    private String nome;
    private int costo;

    public InserimentoBean() {
    	this.id = -1;
        this.prodottoId = -1;
        this.ordineId = -1;
        this.quantita = -1;
        this.immagine = "null";
        this.nome = "null";
        this.costo = -1;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProdottoId() {
        return prodottoId;
    }

    public void setProdottoId(int prodottoId) {
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
