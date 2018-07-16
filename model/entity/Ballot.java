package model.entity;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Ballot {
	@PrimaryKey
	@Persistent (valueStrategy = IdGeneratorStrategy.IDENTITY) private Long id;
	@Persistent private String dni;
	@Persistent private String direccion;
	@Persistent private String distrito;
	@Persistent private String telefono;
	@Persistent private String cliente;
	@Persistent private String NBoleta;
	@Persistent private String cantidad;
	@Persistent private String llanta;
	@Persistent private String precioUnitario;
	@Persistent private String precioFinal;
	public Ballot(String dni, String direccion, String distrito, String telefono, String cliente,
			String nBoleta, String cantidad, String llanta, String precioUnitario, String precioFinal) {
		this.dni = dni;
		this.direccion = direccion;
		this.distrito = distrito;
		this.telefono = telefono;
		this.cliente = cliente;
		NBoleta = nBoleta;
		this.cantidad = cantidad;
		this.llanta = llanta;
		this.precioUnitario = precioUnitario;
		this.precioFinal = precioFinal;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getDistrito() {
		return distrito;
	}
	public void setDistrito(String distrito) {
		this.distrito = distrito;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getCliente() {
		return cliente;
	}
	public void setCliente(String cliente) {
		this.cliente = cliente;
	}
	public String getNBoleta() {
		return NBoleta;
	}
	public void setNBoleta(String nBoleta) {
		NBoleta = nBoleta;
	}
	public String getCantidad() {
		return cantidad;
	}
	public void setCantidad(String cantidad) {
		this.cantidad = cantidad;
	}
	public String getLlanta() {
		return llanta;
	}
	public void setLlanta(String llanta) {
		this.llanta = llanta;
	}
	public String getPrecioUnitario() {
		return precioUnitario;
	}
	public void setPrecioUnitario(String precioUnitario) {
		this.precioUnitario = precioUnitario;
	}
	public String getPrecioFinal() {
		return precioFinal;
	}
	public void setPrecioFinal(String precioFinal) {
		this.precioFinal = precioFinal;
	}

}

