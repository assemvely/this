package kr.ac.assemvely.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.assemvely.dao.SnsDao;
import kr.ac.assemvely.service.SnsService;

import kr.ac.assemvely.vo.SnsVo;

 

 

@Service
public class SnsServiceImpl implements SnsService{

	@Inject
	SnsDao dao;
//	@Override
//	public List<SnsVo> sns_list(String id) throws Exception {
//		// TODO Auto-generated method stub
//		return dao.sns_list(id);
//	}
//
//	@Override
//	public int s_insert(SnsVo snsvo) throws Exception {
//		// TODO Auto-generated method stub
//		return dao.s_insert(snsvo);
//	}
//
//	@Override
//	public int s_delete(Integer snsbno) throws Exception {
//		// TODO Auto-generated method stub
//		return dao.s_delete(snsbno);
//	}
//
//	@Override
//	public int s_update(SnsVo snsvo) throws Exception {
//		// TODO Auto-generated method stub
//		return dao.s_update(snsvo);
//	}
//
//	@Override
//	public SnsVo s_select(Integer snsbno) throws Exception {
//		// TODO Auto-generated method stub
//		return dao.s_select(snsbno);
//	}

	@Override
	public List<SnsVo> list(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(id);
	}

	@Override
	public List<SnsVo> listall(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.listall(id);
	}
	@Override
	public SnsVo read(int snsbno)throws Exception{
		return dao.read(snsbno);
	}

//	@Override
//	public List<mobilevo> profile(String id) throws Exception {
//		// TODO Auto-generated method stub
//		return dao.profile(id);
//	}
//
//	@Override
//	public UserVo mypage(String id) throws Exception {
//		// TODO Auto-generated method stub
//		return dao.mypage(id);
//	}
//
//	@Override
//	public List<ShoppingVo> myshopping(String id) throws Exception {
//		// TODO Auto-generated method stub
//		return dao.myshopping(id);
//	}
//
//	@Override
//	public List<ItemVo> item(Map map) throws Exception {
//		// TODO Auto-generated method stub
//		return dao.item(map);
//	}
//
//	@Override
//	public List<UserVo> following(String id) throws Exception {
//		// TODO Auto-generated method stub
//		return dao.following(id);
//	}
//
//	@Override
//	public List<UserVo> follower(String id) throws Exception {
//		// TODO Auto-generated method stub
//		return dao.follower(id);
//	}




	

}
