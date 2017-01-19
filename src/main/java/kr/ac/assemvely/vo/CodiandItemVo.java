package kr.ac.assemvely.vo;

import java.util.Date;

public class CodiandItemVo 
{
   private int arrayindex;
   private int clothcode;
   private int coordinate_x;   
   private int coordinate_y;   
   private int width;   
   private int height;   
   private String id;   
   private Date writedate;   
   private String imgname;
   private Double ratiomagnify;
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
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public Date getWritedate() {
      return writedate;
   }
   public void setWritedate(Date writedate) {
      this.writedate = writedate;
   }
   public String getImgname() {
      return imgname;
   }
   public void setImgname(String imgname) {
      this.imgname = imgname;
   }
   public Double getRatiomagnify() {
      return ratiomagnify;
   }
   public void setRatiomagnify(Double ratiomagnify) {
      this.ratiomagnify = ratiomagnify;
   }
   @Override
   public String toString() {
      return "CodiandItemVo [arrayindex=" + arrayindex + ", clothcode=" + clothcode + ", coordinate_x=" + coordinate_x
            + ", coordinate_y=" + coordinate_y + ", width=" + width + ", height=" + height + ", id=" + id
            + ", writedate=" + writedate + ", imgname=" + imgname + ", ratiomagnify=" + ratiomagnify + "]";
   }
   
   
   
   
   
}