package kr.ac.assemvely.vo;

import java.util.Date;

public class CommentVo {

	public Date getCodi_writedate() {
		return codi_writedate;
	}
	public void setCodi_writedate(Date codi_writedate) {
		this.codi_writedate = codi_writedate;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBsm() {
		return bsm;
	}
	public void setBsm(String bsm) {
		this.bsm = bsm;
	}
	public String getImgid() {
		return imgid;
	}
	public void setImgid(String imgid) {
		this.imgid = imgid;
	}
	public String getImgcontenttype() {
		return imgcontenttype;
	}
	public void setImgcontenttype(String imgcontenttype) {
		this.imgcontenttype = imgcontenttype;
	}
	public String getImglength() {
		return imglength;
	}
	public void setImglength(String imglength) {
		this.imglength = imglength;
	}
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	public String getFileid() {
		return fileid;
	}
	public void setFileid(String fileid) {
		this.fileid = fileid;
	}
	public String getFilecontenttype() {
		return filecontenttype;
	}
	public void setFilecontenttype(String filecontenttype) {
		this.filecontenttype = filecontenttype;
	}
	public String getFilelength() {
		return filelength;
	}
	public void setFilelength(String filelength) {
		this.filelength = filelength;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	private String id;
	private String boardcode;
	private Integer bno;
	private String reply;
	private Date writedate;
	private Integer c_bno;
	
	private Date codi_writedate;
	
	  private String pw;
	  private String email;
	  private String bsm;
	  private String imgid;
	  private String imgcontenttype;
	  private String imglength;
	  private String imgname;
	  private String fileid;
	  private String filecontenttype;
	  private String filelength;
	  private String filename;
	  private String address;
	  
	
	
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
