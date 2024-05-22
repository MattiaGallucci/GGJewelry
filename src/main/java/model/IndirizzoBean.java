package model;

import java.io.Serializable;

public class IndirizzoBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private int id;
	private String citta;
	private String provincia;
	private String cap;
	private String via;
	private String civico;
	private String utenteUsername;
	
	public IndirizzoBean() {
		this.id = -1;
		this.citta = "null";
		this.provincia = "null";
		this.cap = "null";
		this.via = "null";
		this.civico = "null";
		this.utenteUsername = "null";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCitta() {
		return citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getCap() {
		return cap;
	}

	public void setCap(String cap) {
		this.cap = cap;
	}

	public String getVia() {
		return via;
	}

	public void setVia(String via) {
		this.via = via;
	}

	public String getCivico() {
		return civico;
	}

	public void setCivico(String civico) {
		this.civico = civico;
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
