package kr.ac.assemvely.vo;

public class OrderVo {
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "OrderVo [name=" + name + ", price=" + price + ", deliverycharge=" + deliverycharge + ", mileage="
				+ mileage + ", howtopay=" + howtopay + ", address=" + address + "]";
	}
	private String name;
	private int price;
	private int deliverycharge;
	private int mileage;
	private String howtopay;
	private String address;
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the price
	 */
	public int getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(int price) {
		this.price = price;
	}
	/**
	 * @return the deliveycharge
	 */
	public int getDeliverycharge() {
		return deliverycharge;
	}
	/**
	 * @param deliveycharge the deliveycharge to set
	 */
	public void setDeliverycharge(int deliveycharge) {
		this.deliverycharge = deliveycharge;
	}
	/**
	 * @return the mileage
	 */
	public int getMileage() {
		return mileage;
	}
	/**
	 * @param mileage the mileage to set
	 */
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	/**
	 * @return the howtopay
	 */
	public String getHowtopay() {
		return howtopay;
	}
	/**
	 * @param howtopay the howtopay to set
	 */
	public void setHowtopay(String howtopay) {
		this.howtopay = howtopay;
	}
	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
