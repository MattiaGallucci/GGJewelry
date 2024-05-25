package model;

import java.io.Serializable;

public class MetodoDiPagamentoBean implements Serializable {
	private static final long serialVersionUID = 1L;

	private int id;
	private String tipo; // enum
	private String iban;
	private String numeroCarta;
	private String utenteUsername;

	public MetodoDiPagamentoBean() {
		this.id = -1;
		this.tipo = "null";
		this.numeroCarta = "null";
		this.utenteUsername = "null";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getIban() {
		return iban;
	}

	public void setIban(String iban) {
		this.iban = iban;
	}

	public String getNumeroCarta() {
		return numeroCarta;
	}

	public void setNumeroCarta(String numeroCarta) {
		this.numeroCarta = numeroCarta;
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
