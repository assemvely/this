package kr.ac.assemvely.vo;

import java.util.Date;

public class LikeVo {
	
	private int likebno;
	private String id;
	private String board;
	private int bno;
	private String likedate;
	
	public LikeVo(){
		
	}
	public LikeVo(String id, String board, int bno,int likebno){
		this.id=id;
		this.board=board;
		this.bno=bno;
		this.likebno=likebno;
	
	}
	

	/**
	 * @return the likedate
	 */
	public String getLikedate() {
		return likedate;
	}
	/**
	 * @param likedate the likedate to set
	 */
	public void setLikedate(String likedate) {
		this.likedate = likedate;
	}
	/**
	 * @return the id
	 */
	
	public String getId() {
		return id;
	}
	/**
	 * @return the likebno
	 */
	public int getLikebno() {
		return likebno;
	}
	/**
	 * @param likebno the likebno to set
	 */
	public void setLikebno(int likebno) {
		this.likebno = likebno;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the board
	 */
	public String getBoard() {
		return board;
	}
	/**
	 * @param board the board to set
	 */
	public void setBoard(String board) {
		this.board = board;
	}
	/**
	 * @return the bno
	 */
	public int getBno() {
		return bno;
	}
	/**
	 * @param bno the bno to set
	 */
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	
}
