package kr.ac.assemvely.vo;

import java.util.List;

public class SearchVo {

	List<UserVo> uservo;
	List<ItemVo> itemvo;
	

	public List<UserVo> getUservo() {
		return uservo;
	}
	public void setUservo(List<UserVo> uservo) {
		this.uservo = uservo;
	}
	public List<ItemVo> getItemvo() {
		return itemvo;
	}
	public void setItemvo(List<ItemVo> itemvo) {
		this.itemvo = itemvo;
	}
}
