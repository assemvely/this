package kr.ac.assemvely.vo;

public class AddressVo 
{
	private String id;
	private String address;
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "AddressVo [address=" + address + ", id=" + id + "]";
	}
	
	
}
