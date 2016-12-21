package kr.ac.assemvely.dao.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ac.assemvely.dao.SnsDao;

 
import kr.ac.assemvely.vo.SnsVo;

 


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
	public List<SnsVo> list(String id) throws Exception {
		// TODO Auto-generated method stub
 
		return session.selectList(namespace+".list",id);
	}

	@Override
	public List<SnsVo> listall(String id) throws Exception {
		// TODO Auto-generated method stub
		
		
		return session.selectList(namespace+".listall", id);
	}
	@Override
	public SnsVo read(int snsbno)throws Exception{
	 
		return session.selectOne(namespace+".read",snsbno);
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
	
	
	
}
