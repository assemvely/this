package kr.ac.assemvely.vo;

public class NotifyVo {
	private int notifybno;
	private String id;//��ü
	private String bsm;//��ü�� �ź�
	private String notifycode;//���� ����
	private Integer bno;//���� �ڵ�
	private String sendid;//������
	private String board;//�̰��� �����ΰ�
	private String imgname;//�������� �̹���
	private String comment;//�˸����� �ڸ�Ʈ
	private int onoff;//�˸� ��ﶧ �������� ���������� ǥ��
	
	
	
	
 
	/**
	 * @return the notifybno
	 */
	public int getNotifybno() {
		return notifybno;
	}
	/**
	 * @param notifybno the notifybno to set
	 */
	public void setNotifybno(int notifybno) {
		this.notifybno = notifybno;
	}
	/**
	 * @return the onoff
	 */
	public int getOnoff() {
		return onoff;
	}
	/**
	 * @param onoff the onoff to set
	 */
	public void setOnoff(int onoff) {
		this.onoff = onoff;
	}
	/**
	 * @return the imgname
	 */
	public String getImgname() {
		return imgname;
	}
	/**
	 * @param imgname the imgname to set
	 */
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	/**
	 * @return the comment
	 */
	public String getComment() {
		return comment;
	}
	/**
	 * @param comment the comment to set
	 */
	public void setComment(String comment) {
		this.comment = comment;
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
