package kr.ac.assemvely.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ac.assemvely.dao.SnsDao;
import kr.ac.assemvely.vo.CodiVo;
import kr.ac.assemvely.vo.CodiVo2;
import kr.ac.assemvely.vo.ImageVo;
import kr.ac.assemvely.vo.ItemVo;
import kr.ac.assemvely.vo.LikeVo;
import kr.ac.assemvely.vo.SnsVo;
import kr.ac.assemvely.vo.Sns_codiVo;
import kr.ac.assemvely.vo.UserVo;

 


@Repository
public class SnsDaoImpl implements SnsDao {
	

	public static final String namespace="kr.ac.assemvely.mappers.snsMapper";

	@Inject
	SqlSession session;

//	@Override
//	public List<SnsVo> sns_list(String id) throws Exception {
//		// TODO Auto-generated method stub
//		return session.selectList(namespace+".sns_list",id);
//	}
//
//	@Override
//	public int s_insert(SnsVo snsvo) throws Exception {
//		
//		
//		return session.insert(namespace+".s_insert", snsvo);
//	}
//
//	@Override
//	public int s_delete(Integer snsbno) throws Exception {
//		// TODO Auto-generated method stub
//		return session.delete(namespace+".s_delete",snsbno);
//	}
//
//	@Override
//	public int s_update(SnsVo snsvo) throws Exception {
//		// TODO Auto-generated method stub
//		return session.update(namespace+".s_update",snsvo);
//	}
//
//	@Override
//	public SnsVo s_select(Integer snsbno) throws Exception {
//		// TODO Auto-generated method stub
//		return session.selectOne(namespace+".s_select",snsbno);
//		
//	}

	@Override
	public List<Sns_codiVo> list(String id) throws Exception {
		// TODO Auto-generated method stub
 
		return session.selectList(namespace+".list",id);
	}

	@Override
	public List<SnsVo> listall(String id) throws Exception {
		// TODO Auto-generated method stub
		
		
		return session.selectList(namespace+".listall", id);
	}
	@Override
	public List<Sns_codiVo> read(int snsbno)throws Exception{
	 
		return session.selectList(namespace+".read",snsbno);
	}
	@Override
	public List<SnsVo> searchlist()throws Exception{
		return session.selectList(namespace+".searchlist");
	}
//	@Override
//	public List<mobilevo> profile(String id) throws Exception {
//		// TODO Auto-generated method stub
//		return session.selectList(namespace+".profile",id);
//	}
//
//	@Override
//	public UserVo mypage(String id) throws Exception {
//		// TODO Auto-generated method stub
//		return session.selectOne(namespace+".mypage",id);
//	}
//
//	@Override
//	public List<ShoppingVo> myshopping(String id) throws Exception {
//		// TODO Auto-generated method stub
//		return session.selectList(namespace+".myshopping",id);
//		}
//
//	@Override
//	public List<ItemVo> item(Map map) throws Exception {
//		// TODO Auto-generated method stub
//		return session.selectList(namespace+".seller",map);
//	}
//
//	@Override
//	public List<UserVo> following(String id) throws Exception {
//		// TODO Auto-generated method stub
//		return session.selectList(namespace+".followinglist",id);
//	}
//
//	@Override
//	public List<UserVo> follower(String id) throws Exception {
//		// TODO Auto-generated method stub
//		return session.selectList(namespace+".followerlist",id);
//	}
//	

	@Override
	public void insertlike(LikeVo likevo) throws Exception {
		session.insert(namespace+".insertlike",likevo);
		
	}

	@Override
	public void deletelike(LikeVo likevo) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".deletelike",likevo);
	}

	@Override
	public List<LikeVo> listlike(LikeVo likevo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listlike",likevo);
	}
	
	@Override
	public List<LikeVo> mylike(String id)throws Exception{
		return session.selectList(namespace+".mylike",id);
	}
	@Override
	public void countplus(LikeVo likevo)throws Exception{
		session.update(namespace+".countplus",likevo);
	}
	@Override
	public void countminus(LikeVo likevo)throws Exception{
		session.update(namespace+".countminus",likevo);
		
	}
	@Override
	public void codilikeplus(LikeVo likevo)throws Exception{
		session.update(namespace+".codilikeplus",likevo);
	}
	@Override
	public void codilikeminus(LikeVo likevo)throws Exception{
		session.update(namespace+".codilikeminus",likevo);
	}
	@Override
	public List<ImageVo> all() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".all");
	}

	@Override
	public void codi_insert(CodiVo codivo) throws Exception {
		// TODO Auto-generated method stub
	 session.insert(namespace+".codi_insert",codivo);
	}

	@Override
	public List<ImageVo> codi_cloth(String category) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".codi_cloth",category);
	}

	@Override
	public List<CodiVo> test(CodiVo codivo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".test",codivo);
	}

	@Override
	public CodiVo codibno(String id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("이이이"+id);
		
		return session.selectOne(namespace+".codi_codibno",id);
	}

	@Override
	public int codi_comment(CodiVo2 codivo2) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("잘되는직전"+codivo2.getWritedate());
		return session.insert(namespace+".codi_comment",codivo2);
	}

	@Override
	public List<Sns_codiVo> sns_codi(String id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".sns_codi",id);
	}
 
	@Override
	public UserVo codi_usertb(String id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".codi_usertb",id);
	}

	@Override
	public CodiVo2 codi_coditb3(CodiVo codivo) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("직전"+codivo.getWritedate());
		return session.selectOne(namespace+".codi_coditb3",codivo);
	}

	@Override
	public List<ItemVo> codi_itemtb(CodiVo codivo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".codi_itemtb",codivo);
	}

	@Override
	public int codi_update(CodiVo codivo) throws Exception {
		// TODO Auto-generated method stub
		return session.update(namespace+".codi_update",codivo);
	}

	@Override
	public int codi_update2(CodiVo2 codivo2) throws Exception {
		// TODO Auto-generated method stub
		return session.update(namespace+".codi_update2",codivo2);
	}

	@Override
	public int codi_delete1(CodiVo codivo) throws Exception {
		// TODO Auto-generated method stub
		return session.delete(namespace+".codi_delete1",codivo);
	}

	@Override
	public int codi_delete2(CodiVo codivo) throws Exception {
		// TODO Auto-generated method stub
		return session.delete(namespace+".codi_delete2",codivo);
	}
	
	@Override
	public List<SnsVo> sns_list(String id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".sns_list",id);
	}

	@Override
	public int s_insert(SnsVo snsvo) throws Exception {
		
		
		return session.insert(namespace+".s_insert", snsvo);
	}

	@Override
	public int s_delete(Integer snsbno) throws Exception {
		// TODO Auto-generated method stub
		return session.delete(namespace+".s_delete",snsbno);
	}

	@Override
	public int s_update(SnsVo snsvo) throws Exception {
		// TODO Auto-generated method stub
		return session.update(namespace+".s_update",snsvo);
	}

	@Override
	public SnsVo s_select(Integer snsbno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".s_select",snsbno);
		
	}
	
}
