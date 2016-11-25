package kr.ac.assemvely.vo;

import java.sql.Date;

public class CommentVo {

	private String id;
	private String boardcode;
	private Integer bno;
	private String reply;
	private Date writedate;
	private Integer c_bno;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBoardcode() {
		return boardcode;
	}
	public void setBoardcode(String boardcode) {
		this.boardcode = boardcode;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public Integer getC_bno() {
		return c_bno;
	}
	public void setC_bno(Integer c_bno) {
		this.c_bno = c_bno;
	}
	
	
}
