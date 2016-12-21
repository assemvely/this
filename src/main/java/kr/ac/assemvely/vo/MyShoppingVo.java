package kr.ac.assemvely.vo;

import java.util.List;

public class MyShoppingVo {
	UserVo uservo;
	List<ItemVo> itemvo;


	public UserVo getUservo() {
		return uservo;
	}
	public void setUservo(UserVo uservo) {
		this.uservo = uservo;
	}
	public List<ItemVo> getItemvo() {
		return itemvo;
	}
	public void setItemvo(List<ItemVo> shoppingvo) {
		this.itemvo = shoppingvo;
	}

}
