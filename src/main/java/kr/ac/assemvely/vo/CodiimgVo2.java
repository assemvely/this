package kr.ac.assemvely.vo;

import java.util.Date;

public class CodiimgVo2 
{
	private String id;
	private String codicomment;
	private String codicapture;
	private String writedate;
	
	
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
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	@Override
	public String toString() {
		return "CodiimgVo2 [id=" + id + ", codicomment=" + codicomment + ", codicapture=" + codicapture + ", writedate="
				+ writedate + "]";
	}
	
	
	
	
}
