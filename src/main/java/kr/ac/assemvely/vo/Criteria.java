package kr.ac.assemvely.vo;

public class Criteria 
{
	private int page;
	private int perPageNum;
	
	public Criteria()
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
	
	

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	
	
}
