package kr.ac.assemvely.vo;

public class CartVo 
{
	private int cartbno;
	private String id;
	private int clothcode;
	private String color;
	private int amount;
	private String imgname;
	private String name;
	private int price;
	
	public int getCartbno(){
		return cartbno;
	}
	public void setCartbno(int cartbno){
		this.cartbno=cartbno;
	}
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	 
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getClothcode() {
		return clothcode;
	}
	public void setClothcode(int clothcode) {
		this.clothcode = clothcode;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "CartVo [id=" + id + ", clothcode=" + clothcode + ", color=" + color + ", amount=" + amount
				+ ", imgname=" + imgname + ", name=" + name + ", price=" + price + "]";
	}
	
	
	
}
