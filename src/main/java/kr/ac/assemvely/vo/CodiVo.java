package kr.ac.assemvely.vo;

import java.util.Date;
//이미지 파일도 가져와야하기대문에 codivo에 imagename 추가함...

public class CodiVo {
	public Date getWritedate() {
		return writedate;
	}


	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}


	public void setImgname(String imgname) {
		this.imgname = imgname;
	}


	public String getImgname() {
		return imgname;
	}


	public void setImagename(String imgname) {
		this.imgname = imgname;
	}


	public String getImagepath() {
		return imagepath;
	}


	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}


	public CodiVo() {}
	
	


	public int getArrayindex() {
		return arrayindex;
	}



	public void setArrayindex(int arrayindex) {
		this.arrayindex = arrayindex;
	}



	public int getClothcode() {
		return clothcode;
	}



	public void setClothcode(int clothcode) {
		this.clothcode = clothcode;
	}



	public int getCoordinate_x() {
		return coordinate_x;
	}



	public void setCoordinate_x(int coordinate_x) {
		this.coordinate_x = coordinate_x;
	}



	public int getCoordinate_y() {
		return coordinate_y;
	}



	public void setCoordinate_y(int coordinate_y) {
		this.coordinate_y = coordinate_y;
	}



	public int getWidth() {
		return width;
	}



	public void setWidth(int width) {
		this.width = width;
	}



	public int getHeight() {
		return height;
	}



	public void setHeight(int height) {
		this.height = height;
	}



	public int getAngle() {
		return angle;
	}



	public void setAngle(int angle) {
		this.angle = angle;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	private Date writedate;
	private int arrayindex;
	private int clothcode;
	private int coordinate_x;
	private int coordinate_y;
	private int width;
	private int height;
	private int angle;
	private String id;
	private String imagepath;

	private String imgname;

	public CodiVo(int clothcode, int coordinate_x, int coordinate_y, int width, int height,String id) {
		super();
	
		this.clothcode = clothcode;
		this.coordinate_x = coordinate_x;
		this.coordinate_y = coordinate_y;
		this.width = width;
		this.height = height;
		this.id=id;
	}
	
	
	
	public CodiVo(String id,int clothcode,Date writedate,int coordinate_x,int coordinate_y,int width,int height){

		this.clothcode = clothcode;
		this.coordinate_x = coordinate_x;
		this.coordinate_y = coordinate_y;
		this.width = width;
		this.height = height;
		this.id=id;
		this.writedate=writedate;
		
	}
	
	
	
	

	
	
	

}
