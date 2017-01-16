package kr.ac.assemvely.vo;

public class NotifyVo {

	private String id;//주체
	private String bsm;//주체의 신분
	private String notifycode;//보드 구분
	private Integer bno;//보드 코드
	private String sendid;//보낸자
	private String board;
	private String tb;
	private String tbbno;
	
	
	/**
	 * @return the tbbno
	 */
	public String getTbbno() {
		return tbbno;
	}
	/**
	 * @param tbbno the tbbno to set
	 */
	public void setTbbno(String tbbno) {
		this.tbbno = tbbno;
	}
	/**
	 * @return the tb
	 */
	public String getTb() {
		return tb;
	}
	/**
	 * @param tb the tb to set
	 */
	public void setTb(String tb) {
		this.tb = tb;
	}
	public NotifyVo(){
		
	}
	/**
	 * @return the id
	 */
	
	
	public String getId() {
		return id;
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
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the bsm
	 */
	public String getBsm() {
		return bsm;
	}
	/**
	 * @param bsm the bsm to set
	 */
	public void setBsm(String bsm) {
		this.bsm = bsm;
	}
	/**
	 * @return the board
	 */
	public String getNotifycode() {
		return notifycode;
	}
	/**
	 * @param board the board to set
	 */
	public void setNotifycode(String notifycode) {
		this.notifycode = notifycode;
	}
	/**
	 * @return the bno
	 */
	public  Integer getBno() {
		return bno;
	}
	/**
	 * @param bno the bno to set
	 */
	public void setBno( Integer bno) {
		this.bno = bno;
	}
	/**
	 * @return the sendid
	 */
	public String getSendid() {
		return sendid;
	}
	/**
	 * @param sendid the sendid to set
	 */
	public void setSendid(String sendid) {
		this.sendid = sendid;
	}
	
	
}
