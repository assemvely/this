package kr.ac.assemvely.vo;

public class Tempcodeandcolorcode 
{
	private Integer tempcode;
	private String colorcode;
	public Integer getTempcode() {
		return tempcode;
	}
	public void setTempcode(Integer tempcode) {
		this.tempcode = tempcode;
	}
	public String getColorcode() {
		return colorcode;
	}
	public void setColorcode(String colorcode) {
		this.colorcode = colorcode;
	}
	@Override
	public String toString() {
		return "Tempcodeandcolorcode [tempcode=" + tempcode + ", colorcode=" + colorcode + "]";
	}
	
	
	
}
