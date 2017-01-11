package kr.ac.assemvely.vo;

import java.util.Date;

public class BoardVo {
	private Integer bno;
	private String title;
	private String content;
	private String id;
	private Date writedate;
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date regdate) {
		this.writedate = regdate;
	}
	@Override
	public String toString() {
		return "BoardVo [bno=" + bno + ", title=" + title + ", content=" + content + ", id=" + id + ", writedate="
				+ writedate + ", getBno()=" + getBno() + ", getTitle()=" + getTitle() + ", getContent()=" + getContent()
				+ ", getId()=" + getId() + ", getWritedate()=" + getWritedate() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	

}
