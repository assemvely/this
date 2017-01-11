package kr.ac.assemvely.vo;

import java.util.List;

public class CodiAll {
	
	public UserVo getUservo() {
		return uservo;
	}
	public void setUservo(UserVo uservo) {
		this.uservo = uservo;
	}
	public String getCodicapture() {
		return codicapture;
	}
	public void setCodicapture(String codicapture) {
		this.codicapture = codicapture;
	}
	public List<ItemVo> getItemvo() {
		return itemvo;
	}
	public void setItemvo(List<ItemVo> itemvo) {
		this.itemvo = itemvo;
	}
	
	/**
	 * @return the codilike
	 */
	public int getCodilike() {
		return codilike;
	}
	/**
	 * @param codilike the codilike to set
	 */
	public void setCodilike(int codilike) {
		this.codilike = codilike;
	}

	/**
	 * @return the likevo
	 */
	public List<LikeVo> getLikevo() {
		return likevo;
	}
	/**
	 * @param likevo the likevo to set
	 */
	public void setLikevo(List<LikeVo> likevo) {
		this.likevo = likevo;
	}

	private UserVo uservo;
	private String codicapture;
	private List<ItemVo> itemvo;
	private int codilike;
	private List<LikeVo> likevo;
	private  CodiVo2 codivo;
	/**
	 * @return the codivo
	 */
	public CodiVo2 getCodivo() {
		return codivo;
	}
	/**
	 * @param codivo the codivo to set
	 */
	public void setCodivo( CodiVo2 codivo) {
		this.codivo = codivo;
	}
	
	
}
