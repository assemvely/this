package kr.ac.assemvely.vo;

public class CodiandwritedateVo 
{
	private String id;
	private String writedate;
	@Override
	public String toString() {
		return "CodiandwritedateVo [id=" + id + ", writedate=" + writedate + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	
	
}
