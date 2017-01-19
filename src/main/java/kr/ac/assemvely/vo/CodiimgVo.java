package kr.ac.assemvely.vo;

import java.util.Date;

public class CodiimgVo 
{
	private String id;
	private String codicomment;
	private String codicapture;
	private Date writedate;

	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCodicomment() {
		return codicomment;
	}
	public void setCodicomment(String codicomment) {
		this.codicomment = codicomment;
	}
	public String getCodicapture() {
		return codicapture;
	}
	public void setCodicapture(String codicapture) {
		this.codicapture = codicapture;
	}

	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	@Override
	public String toString() {
		return "CodiimgVo [id=" + id + ", codicomment=" + codicomment + ", codicapture=" + codicapture + ", writedate="
				+ writedate + ", getId()=" + getId() + ", getCodicomment()=" + getCodicomment() + ", getCodicapture()="
				+ getCodicapture() + ", getWritedate()=" + getWritedate() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
	
}
