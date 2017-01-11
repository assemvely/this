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
	//���ΰ��� �ڵ� �����°͵�
		public UserVo codi_usertb(String id) throws Exception;
		public CodiVo2 codi_coditb3(CodiVo codivo) throws Exception;
		public List<ItemVo> codi_itemtb(CodiVo codivo) throws Exception;
		
		
		//codi�� sns��ϵ� �ٻ��� ���޼ҵ�(�� following,follower�� ������� �ʾ���...)
		public List<Sns_codiVo> sns_codi(String id) throws Exception;
		
		
		
		//writedate�� ������ �޼ҵ�
		public CodiVo codibno(String id) throws Exception;
		
		
		//codicomment�� �Է��ϴ� �޼ҵ�
		public int codi_comment(CodiVo2 codivo2) throws Exception;
		
		
		
		//�ڵ� �����ϴ°� 1
		
		public int codi_update(CodiVo codivo) throws Exception;
		
		//�ڵ� �����ϴ°� 2
		public int codi_update2(CodiVo2 codivo2) throws Exception;
		
		
		//�ڵ����
		public int codi_delete1(CodiVo codivo) throws Exception;
		public int codi_delete2(CodiVo codivo) throws Exception;
		 
		
		
		//�ڵ� �׽�Ʈ��
		public List<CodiVo> test(CodiVo codivo) throws Exception;
		
		
		//�ڵ� ī�װ��� �̾ƿ��� ��
		public List<ImageVo> codi_cloth(String category) throws Exception;
		
		
		//�ڵ𿬽��ϴ°�
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
