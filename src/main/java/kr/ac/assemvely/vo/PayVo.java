package kr.ac.assemvely.vo;

import java.sql.Date;

public class PayVo 
{
	
	private String id;
	private Integer clothcode;
	private Date orderdate;
	private String brandid;
	private int cnt;
 
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getClothcode() {
		return clothcode;
	}
	public void setClothcode(Integer clothcode) {
		this.clothcode = clothcode;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public String getBrandid() {
		return brandid;
	}
	public void setBrandid(String brandid) {
		this.brandid = brandid;
	}
	public int getCnt(){
		return cnt;
	}
	public void setCnt(int cnt){
		this.cnt=cnt;
	}
	
	
}
