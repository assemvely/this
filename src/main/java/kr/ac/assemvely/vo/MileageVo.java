package kr.ac.assemvely.vo;

public class MileageVo 
{
	private Integer mileage;
	private String id;
	public Integer getMileage() {
		return mileage;
	}
	public void setMileage(Integer mileage) {
		this.mileage = mileage;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "MileageVo [mileage=" + mileage + ", id=" + id + "]";
	}

	
	
	
}
