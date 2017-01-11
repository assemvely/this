package kr.ac.assemvely.vo;

import java.util.Date;

public class Sns_codiVo {
	


	
	
	
	
	

	public String getSnscontent() {
		return snscontent;
	}
	public void setSnscontent(String snscontent) {
		this.snscontent = snscontent;
	}
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	public String getBoardcode() {
		return boardcode;
	}
	public void setBoardcode(String boardcode) {
		this.boardcode = boardcode;
	}
	public Integer getSnsbno() {
		return snsbno;
	}
	public void setSnsbno(Integer snsbno) {
		this.snsbno = snsbno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public Integer getLikecnt() {
		return likecnt;
	}
	public void setLikecnt(Integer likecnt) {
		this.likecnt = likecnt;
	}
	public String getSnsimg() {
		return snsimg;
	}
	public void setSnsimg(String snsimg) {
		this.snsimg = snsimg;
	}
	public Integer getLikecount() {
		return likecount;
	}
	public void setLikecount(Integer likecount) {
		this.likecount = likecount;
	}
	public String getCodicomment() {
		return codicomment;
	}
	public void setCodicomment(String codicomment) {
		this.codicomment = codicomment;
	}
	public String getCodicapture() {
		return codicapture;
	}
	public void setCodicapture(String codicapture) {
		this.codicapture = codicapture;
	}
	private Integer snsbno;
	private String id;
	
	private String writedate;
	
	
	private Integer likecnt;
	private String snsimg;
	private String imgname;
	private Integer likecount;
	private String codicomment;
	private String codicapture;
	private String boardcode;
	private String snscontent;
	private Integer codilike;
	private Integer codibno;
	
	/**
	 * @return the codibno
	 */
	public Integer getCodibno() {
		return codibno;
	}
	/**
	 * @param codibno the codibno to set
	 */
	public void setCodibno(Integer codibno) {
		this.codibno = codibno;
	}
	/**
	 * @return the codilike
	 */
	public Integer getCodilike() {
		return codilike;
	}
	/**
	 * @param codilike the codilike to set
	 */
	public void setCodilike(Integer codilike) {
		this.codilike = codilike;
	}
	
	



}
