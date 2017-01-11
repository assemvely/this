package kr.ac.assemvely.vo;

public class Criteria 
{
	private int page;
	private int perPageNum;
	
	public Criteria()
	{
		this.page=1;
		this.perPageNum=16;	//페이지당 들어갈 게시물의 갯수.
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		
		if(page<=0)
		{
			this.page=1;	//첫번쨰 페이지부터 시작!!
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
