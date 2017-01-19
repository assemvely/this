package kr.ac.assemvely.vo;

import org.springframework.web.util.UriComponents; 
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker 
{
	private int totalCount;	//전체 게시물의 수
	private int startPage;	//첫번째 페이지 번호
	private int endPage;	//마지막 페이지 번호
	private boolean prev;	//이전 페이지가 있는가?
	private boolean next;	//다음 페이지가 있는가?
	
	private int displayPageNum = 10;	//화면에 보여지는 페이지 번호의 갯수
										//ex:1,2,3,4,5일 경우 displayPageNum은 5 
	
	private Criteria cri;
	
//	private Criteriawithcategotycode cri;

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) 
	{
		//calcData로 계산.
		this.totalCount = totalCount;
		calcData();
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}

	//page(몇 번째 페이지인지), pagenum(페이지 안에 게시물이 몇 개나 들어가는지 가져온다.)
	public void setCri(Criteria cri) 
	{
		this.cri = cri;
	}
	
/*	public Criteriawithcategotycode getCri()
	{
		return cri;
	}
	
	public void setCri(Criteriawithcategotycode cri)
	{
		this.cri =cri;
	}
	*/
	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
	}
	
	private void calcData()
	{
						//Math.ceil() => 올림
						//3번 페이지일 경우
						//10/10*10 =>10
						//12번 페이지일 경우
						//20/10*10 = >20
		endPage = (int)(Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
		
		startPage = (endPage - displayPageNum)+1;
								//전체 게시물 올림 나누기 페이지당 게시물의 수
								//즉 tempEndPage가 페이지 번호 마지막
		int tempEndPage = (int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
		
		if(endPage>tempEndPage)
		{
			endPage = tempEndPage;
		}
		prev = startPage==1 ? false : true;
		
		next = endPage*cri.getPerPageNum()>=totalCount ? false : true;
		
	}
	
	public String makeQuery(int page)
	{
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.build();
		
		return uriComponents.toUriString();
		
	}
	
	
	
	
	
	
	
}
