package model.entity;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import java.util.Date;


import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class User {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	@Persistent
	private String name;
	@Persistent
	private String email;
	@Persistent
	private String DNI;
	@Persistent
	private String direccion;
	@Persistent
	private String distrito;
	@Persistent
	private String telefono;
	@Persistent
	private String birth;
	@Persistent
	private boolean status;
	@Persistent
	private Date creacion;
	@Persistent
	private boolean gender;
	@Persistent
	private Long idRol;
	
	public User(String name,String dni, String direccion, String distrito, String telefono, String email, String birt, boolean status, boolean gender, Long idRol, Date creacion) {
		this.name = name;
		this.DNI = dni;
		this.direccion = direccion;
		this.distrito = distrito;
		this.telefono = telefono;
		this.email = email;
		this.birth = birt;
		this.status = status;
		this.creacion = creacion;
		this.gender = gender;
		this.idRol = idRol;
	}	
	public String getDNI() {
		return DNI;
	}
	public void setDNI(String dNI) {
		DNI = dNI;
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
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setName(String name){
		this.name = name;
	}
	public String getNombre(){
		return name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirt(String birt) {
		this.birth = birt;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public Date getCreacion() {
		return creacion;
	}
	public void setCreacion(Date creacion) {
		this.creacion = creacion;
	}
	public boolean isGender() {
		return gender;
	}
	public void setGender(boolean gender) {
		this.gender = gender;
	}
	public Long getIdRol() {
		return idRol;
	}
	public void setIdRol(Long idRol) {
		this.idRol = idRol;
	}
	
}
