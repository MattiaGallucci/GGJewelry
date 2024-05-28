package model;

import java.io.Serializable;

public class OrdineBean implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private String data;
    private double costoTotale;
    private String utenteEmail;

    public OrdineBean() {
        this.id = -1;
        this.data = "null";
        this.costoTotale = -1;
        this.utenteEmail = "null";
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

    public String getUtenteEmail() {
        return utenteEmail;
    }

    public void setUtenteEmail(String utenteEmail) {
        this.utenteEmail = utenteEmail;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
