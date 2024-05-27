package model;

import java.io.Serializable;

public class OrdineBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private int id;
	    private String data;
	    private double costoTotale;
	    private String utenteUsername;

	    public OrdineBean() {
	        this.id = -1;
	        this.data = "null";
	        this.costoTotale = -1;
	        this.utenteUsername = "null";
	    }

	    public int getId() {
	        return id;
	    }

	    public void setId(int id) {
	        this.id = id;
	    }

	    public String getData() {
	        return data;
	    }

	    public void setData(String data) {
	        this.data = data;
	    }

	    public double getCostoTotale() {
	        return costoTotale;
	    }

	    public void setCostoTotale(double costoTotale) {
	        this.costoTotale = costoTotale;
	    }

	    public String getUtenteUsername() {
	        return utenteUsername;
	    }

	    public void setUtenteUsername(String utenteUsername) {
	        this.utenteUsername = utenteUsername;
	    }

	    public static long getSerialversionuid() {
	        return serialVersionUID;
	    }
}
