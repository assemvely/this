package kr.ac.assemvely.vo;

public class CodicommentVo 
{
	private String id;
	private String codicomment;
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
	
	
	@Override
	public String toString() {
		return "CodicommentVo [id=" + id + ", codicomment=" + codicomment + "]";
	}
	
	
	
	
	
}
