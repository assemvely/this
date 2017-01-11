package kr.ac.assemvely.vo;

import java.util.Date;


public class CodiVo2 {

	
	
	
	public CodiVo2(){}
	
	public CodiVo2(Date writedate, String codicomment, String id, String codicapture) {
		super();
		this.writedate = writedate;
		this.codicomment = codicomment;
		this.id = id;
		this.codicapture = codicapture;
		
	}
	

	public CodiVo2(Date writedate, String codicomment, String id, String codicapture, String boardcode) {
		super();
		this.writedate = writedate;
		this.codicomment = codicomment;
		this.id = id;
		this.codicapture = codicapture;
		this.boardcode = boardcode;
	}
	public String getBoardcode() {
		return boardcode;
	}
	public void setBoardcode(String boardcode) {
		this.boardcode = boardcode;
	}
	public String getCodicapture() {
		return codicapture;
	}
	public void setCodicapture(String codicapture) {
		this.codicapture = codicapture;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public String getCodicomment() {
		return codicomment;
	}
	public void setCodicomment(String codicomment) {
		this.codicomment = codicomment;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
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


	private Date writedate;
	private String codicomment;
	private String id;
	private String codicapture;
	private String boardcode;
	private Integer codibno;
	private Integer codilike;

}
