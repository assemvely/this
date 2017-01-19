package kr.ac.assemvely.vo;

import org.springframework.web.util.UriComponents; 
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker 
{
	private int totalCount;	//��ü �Խù��� ��
	private int startPage;	//ù��° ������ ��ȣ
	private int endPage;	//������ ������ ��ȣ
	private boolean prev;	//���� �������� �ִ°�?
	private boolean next;	//���� �������� �ִ°�?
	
	private int displayPageNum = 10;	//ȭ�鿡 �������� ������ ��ȣ�� ����
										//ex:1,2,3,4,5�� ��� displayPageNum�� 5 
	
	private Criteria cri;
	
//	private Criteriawithcategotycode cri;

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) 
	{
		//calcData�� ���.
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

	//page(�� ��° ����������), pagenum(������ �ȿ� �Խù��� �� ���� ������ �����´�.)
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
						//Math.ceil() => �ø�
						//3�� �������� ���
						//10/10*10 =>10
						//12�� �������� ���
						//20/10*10 = >20
		endPage = (int)(Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
		
		startPage = (endPage - displayPageNum)+1;
								//��ü �Խù� �ø� ������ �������� �Խù��� ��
								//�� tempEndPage�� ������ ��ȣ ������
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
