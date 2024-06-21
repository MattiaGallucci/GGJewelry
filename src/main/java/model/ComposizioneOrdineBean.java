package model;

import java.io.Serializable;
import java.math.BigDecimal;

public class ComposizioneOrdineBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int ordine;
	private String cliente;
	private String prodotto;
	private int quantitaProdotto;
	private BigDecimal costoUnitario;
	
	public ComposizioneOrdineBean() {
		this.prodotto = "null";
		this.setCliente("null");
		this.ordine = -1;
		this.quantitaProdotto = -1;
	}
	
	public String getProdotto() {
		return prodotto;
	}
	
	
	public int getOrdine() {
		return ordine;
	}


	public void setOrdine(int ordine) {
		this.ordine = ordine;
	}


	public void setProdotto(String prodotto) {
		this.prodotto = prodotto;
	}
	
	public int getQuantitaProdotto() {
		return quantitaProdotto;
	}
	
	public void setQuantitaProdotto(int quantitaProdotto) {
		this.quantitaProdotto = quantitaProdotto;
	}
	
	public BigDecimal getCostoUnitario() {
		return costoUnitario;
	}
	
	public void setCostoUnitario(BigDecimal costoUnitario) {
		this.costoUnitario = costoUnitario;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getCliente() {
		return cliente;
	}

	public void setCliente(String cliente) {
		this.cliente = cliente;
	}
	
	
}
