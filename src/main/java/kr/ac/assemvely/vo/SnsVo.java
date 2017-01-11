package kr.ac.assemvely.vo;

import java.sql.Date;


public class SnsVo {
	
	public String getBoardcode() {
		return boardcode;
	}
	public void setBoardcode(String boardcode) {
		this.boardcode = boardcode;
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
	private Integer snsbno;
	private String id;
	private String snscontent;
	private String snsimg;
	private Integer likecnt;
	private Date writedate;
	private String snsimgpath;
	private String boardcode;
	 
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
	  
	
	
	
	
	public String getSnsimgpath() {
		return snsimgpath;
	}
	public void setSnsimgpath(String snsimgpath) {
		this.snsimgpath = snsimgpath;
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
	public String getSnscontent() {
		return snscontent;
	}
	public void setSnscontent(String snscontent) {
		this.snscontent = snscontent;
	}
	public String getSnsimg() {
		return snsimg;
	}
	public void setSnsimg(String snsimg) {
		this.snsimg = snsimg;
	}
	public Integer getLikecnt() {
		return likecnt;
	}
	public void setLikecnt(Integer likecnt) {
		this.likecnt = likecnt;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	
	
	
	

}

