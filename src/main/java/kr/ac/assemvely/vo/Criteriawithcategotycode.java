package kr.ac.assemvely.vo;

public class Criteriawithcategotycode 
{
	private int page;
	private int perPageNum;
	private String categorycode;
	
	public Criteriawithcategotycode()
	{
		this.page=1;
		this.perPageNum=16;	//�������� �� �Խù��� ����.
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		
		if(page<=0)
		{
			this.page=1;	//ù���� ���������� ����!!
			return;
		}
		this.page=page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) 
	{
		this.perPageNum = perPageNum;
		
	}
	

	public String getCategorycode() {
		return categorycode;
	}

	public void setCategorycode(String categorycode) {
		this.categorycode = categorycode;
	}

	@Override
	public String toString() {
		return "Criteriawithcategotycode [page=" + page + ", perPageNum=" + perPageNum + ", categorycode="
				+ categorycode + "]";
	}
	
	


	
	
}
