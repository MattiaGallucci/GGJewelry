package model;

import java.io.Serializable;

public class ProdottoBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private int id;
	    private String nome;
	    private String descrizione;
	    private int quantita;
	    private int costo;
	    private String sesso;
	    private String immagine;
	    private String categoriaImmagine;

	    public ProdottoBean() {
	        this.id = -1;
	        this.nome = "null";
	        this.descrizione = "null";
	        this.quantita = -1;
	        this.costo = -1;
	        this.sesso = "null";
	        this.immagine = "null";
	        this.categoriaImmagine = "null";
	    }

	    public int getId() {
	        return id;
	    }

	    public void setId(int id) {
	        this.id = id;
	    }

	    public String getNome() {
	        return nome;
	    }

	    public void setNome(String nome) {
	        this.nome = nome;
	    }

	    public String getDescrizione() {
	        return descrizione;
	    }

	    public void setDescrizione(String descrizione) {
	        this.descrizione = descrizione;
	    }

	    public int getQuantita() {
	        return quantita;
	    }

	    public void setQuantita(int quantita) {
	        this.quantita = quantita;
	    }

	    public int getCosto() {
	        return costo;
	    }

	    public void setCosto(int costo) {
	        this.costo = costo;
	    }

	    public String getSesso() {
	        return sesso;
	    }

	    public void setSesso(String sesso) {
	        this.sesso = sesso;
	    }

	    public String getImmagine() {
	        return immagine;
	    }

	    public void setImmagine(String immagine) {
	        this.immagine = immagine;
	    }

	    public String getCategoriaImmagine() {
	        return categoriaImmagine;
	    }

	    public void setCategoriaImmagine(String categoriaImmagine) {
	        this.categoriaImmagine = categoriaImmagine;
	    }

	    public static long getSerialversionuid() {
	        return serialVersionUID;
	    }
}
