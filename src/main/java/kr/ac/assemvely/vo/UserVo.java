package kr.ac.assemvely.vo;

public class UserVo 
{
	  
	  private String id;
	  private String pw;
	  private String email;
	  private String bsm;
	  
	  private String imgname;
	 
	  
	  private String filename;
	 
	  
	  private String address;
	  private Integer mileage;
	  
	  
	  
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

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBsm() {
		return bsm;
	}

	public void setBsm(String bsm) {
		this.bsm = bsm;
	}

	public String getImgname() {
		return imgname;
	}

	public void setImgname(String imgname) {
		this.imgname = imgname;
	}

 

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	 

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "UserVo [id=" + id + ", pw=" + pw + ", email=" + email + ", bsm=" + bsm + ", imgname=" + imgname
				+ ", filename=" + filename + ", address=" + address
				+ "]";
	}
	  


	
}
