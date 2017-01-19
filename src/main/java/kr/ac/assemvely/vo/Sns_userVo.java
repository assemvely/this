package kr.ac.assemvely.vo;

import java.util.List;

public class Sns_userVo {
	private List<Sns_codiVo> snscodivo;
	private Integer followercounter;
	private Integer followingcounter;
	private List<UserVo> relationvo;
	
	
	
	/**
	 * @return the relationvo
	 */
	public List<UserVo> getRelationvo() {
		return relationvo;
	}
	/**
	 * @param relationvo the relationvo to set
	 */
	public void setRelationvo(List<UserVo> relationvo) {
		this.relationvo = relationvo;
	}
	/**
	 * @return the snscodivo
	 */
	public List<Sns_codiVo> getSnscodivo() {
		return snscodivo;
	}
	/**
	 * @param snscodivo the snscodivo to set
	 */
	public void setSnscodivo(List<Sns_codiVo> snscodivo) {
		this.snscodivo = snscodivo;
	}
	/**
	 * @return the followercounter
	 */
	public Integer getFollowercounter() {
		return followercounter;
	}
	/**
	 * @param followercounter the followercounter to set
	 */
	public void setFollowercounter(Integer followercounter) {
		this.followercounter = followercounter;
	}
	/**
	 * @return the followingcounter
	 */
	public Integer getFollowingcounter() {
		return followingcounter;
	}
	/**
	 * @param followingcounter the followingcounter to set
	 */
	public void setFollowingcounter(Integer followingcounter) {
		this.followingcounter = followingcounter;
	}
	
	
	
}
