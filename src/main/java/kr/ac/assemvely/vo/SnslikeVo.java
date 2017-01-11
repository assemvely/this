package kr.ac.assemvely.vo;

import java.util.List;

public class SnslikeVo {
	private List<SnsVo> realsnsvo;
	private List<Sns_codiVo> snsvo;
	private List<LikeVo> likevo;
	private SnsVo snsvoone;
	private LikeVo likevoone;
	
	
	/**
	 * @return the realsnsvo
	 */
	public List<SnsVo> getRealsnsvo() {
		return realsnsvo;
	}
	/**
	 * @param realsnsvo the realsnsvo to set
	 */
	public void setRealsnsvo(List<SnsVo> realsnsvo) {
		this.realsnsvo = realsnsvo;
	}
	/**
	 * @return the snsvoone
	 */
	public SnsVo getSnsvoone() {
		return snsvoone;
	}
	/**
	 * @param snsvoone the snsvoone to set
	 */
	public void setSnsvoone(SnsVo snsvoone) {
		this.snsvoone = snsvoone;
	}
	/**
	 * @return the likevoone
	 */
	public LikeVo getLikevoone() {
		return likevoone;
	}
	/**
	 * @param likevoone the likevoone to set
	 */
	public void setLikevoone(LikeVo likevoone) {
		this.likevoone = likevoone;
	}
	public SnslikeVo(){
		
	}
	/**
	 * @return the snsvo
	 */
	public List<Sns_codiVo> getSnsvo() {
		return snsvo;
	}
	/**
	 * @param snsvo the snsvo to set
	 */
	public void setSnsvo(List<Sns_codiVo> snsvo) {
		this.snsvo = snsvo;
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
	
}