package kr.ac.assemvely.service;

import java.util.List;

import kr.ac.assemvely.vo.CodiVo;
import kr.ac.assemvely.vo.CodiVo2;
import kr.ac.assemvely.vo.ImageVo;
import kr.ac.assemvely.vo.ItemVo;
import kr.ac.assemvely.vo.LikeVo;
import kr.ac.assemvely.vo.SnsVo;
import kr.ac.assemvely.vo.Sns_codiVo;
import kr.ac.assemvely.vo.UserVo;
 
 
 

public interface SnsService {
	
	public List<Sns_codiVo> list(String id) throws Exception;
	public List<SnsVo> listall(String id) throws Exception;
	public List<Sns_codiVo> read(int snsbno)throws Exception;
	public List<SnsVo> searchlist()throws Exception;
	public void insertlike(LikeVo likevo)throws Exception;
	public void deletelike(LikeVo likevo)throws Exception;
	public List<LikeVo> listlike(LikeVo likevo)throws Exception;
	public List<LikeVo> mylike(String id)throws Exception;
	public void countplus(LikeVo likevo)throws Exception;
	public void countminus(LikeVo likevo)throws Exception;
	public void codilikeplus(LikeVo likevo)throws Exception;
	public void codilikeminus(LikeVo likevo)throws Exception;
	public void codi_insert(CodiVo codivo) throws Exception;
	//개인개정 코디 뺴오는것들
		public UserVo codi_usertb(String id) throws Exception;
		public CodiVo2 codi_coditb3(CodiVo codivo) throws Exception;
		public List<ItemVo> codi_itemtb(CodiVo codivo) throws Exception;
		
		
		//codi랑 sns목록들 다빼는 ㅋ메소드(단 following,follower를 고려하지 않았음...)
		public List<Sns_codiVo> sns_codi(String id) throws Exception;
		
		
		
		//writedate를 빼오는 메소드
		public CodiVo codibno(String id) throws Exception;
		
		
		//codicomment를 입력하는 메소드
		public int codi_comment(CodiVo2 codivo2) throws Exception;
		
		
		
		//코디 수정하는것 1
		
		public int codi_update(CodiVo codivo) throws Exception;
		
		//코디 수정하는거 2
		public int codi_update2(CodiVo2 codivo2) throws Exception;
		
		
		//코디삭제
		public int codi_delete1(CodiVo codivo) throws Exception;
		public int codi_delete2(CodiVo codivo) throws Exception;
		 
		
		
		//코디 테스트용
		public List<CodiVo> test(CodiVo codivo) throws Exception;
		
		
		//코디 카테고리별 뽑아오는 것
		public List<ImageVo> codi_cloth(String category) throws Exception;
		
		
		//코디연습하는것
		public List<ImageVo> all() throws Exception;
		
		
//	public List<mobilevo> profile(String id) throws Exception;
//	public UserVo mypage(String id) throws Exception;
//	public List<ItemVo> item(Map map) throws Exception;
//
//	public List<ShoppingVo> myshopping(String id) throws Exception;
//	
//	
//	public List<UserVo> following(String id) throws Exception;
//	public List<UserVo> follower(String id) throws Exception;
	
//	public List<SnsVo> sns_list(String id) throws Exception;
//	public int s_insert(SnsVo snsvo) throws Exception;
//	public int s_delete(Integer snsbno) throws Exception;
//	public int s_update(SnsVo snsvo) throws Exception;
//	public SnsVo s_select(Integer snsbno) throws Exception;

		public List<SnsVo> sns_list(String id) throws Exception;
		public int s_insert(SnsVo snsvo) throws Exception;
		public int s_delete(Integer snsbno) throws Exception;
		public int s_update(SnsVo snsvo) throws Exception;
		public SnsVo s_select(Integer snsbno) throws Exception;

}
