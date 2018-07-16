 package model.entity;
import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Access {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	@Persistent
	private Long idRol;
	@Persistent
	private Long idUrl;

	@Persistent
	private boolean status;
	@Persistent
	private Date fecha;
	
	
	public Access(Long idRol, Long idUrl, boolean status, Date fecha) {
		super();
		this.idRol = idRol;
		this.idUrl = idUrl;
		this.status = status;
		this.fecha = fecha;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long idRol) {
		this.id = idRol;
	}
	public Long getIdRol() {
		return idRol;
	}
	public void setIdRol(Long idRol) {
		this.idRol = idRol;
	}
	public Long getIdUrl() {
		return idUrl;
	}
	public void setIdUrl(Long idUrl) {
		this.idUrl = idUrl;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	
}
