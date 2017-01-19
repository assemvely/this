package kr.ac.assemvely.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.assemvely.dao.SnsDao;
import kr.ac.assemvely.service.SnsService;
import kr.ac.assemvely.vo.CodiVo;
import kr.ac.assemvely.vo.CodiVo2;
import kr.ac.assemvely.vo.ImageVo;
import kr.ac.assemvely.vo.ItemVo;
import kr.ac.assemvely.vo.LikeVo;
import kr.ac.assemvely.vo.SnsVo;
import kr.ac.assemvely.vo.Sns_codiVo;
import kr.ac.assemvely.vo.UserVo;

 

 

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
	public List<Sns_codiVo> list(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(id);
	}

	@Override
	public List<Sns_codiVo> listall(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.listall(id);
	}
	@Override
	public List<Sns_codiVo> read(int snsbno)throws Exception{
		return dao.read(snsbno);
	}
	@Override
	public List<SnsVo> searchlist()throws Exception{
		return dao.searchlist();
	}
	@Override
	public List<ImageVo> all() throws Exception {
		// TODO Auto-generated method stub
		return dao.all();
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

	@Override
	public void insertlike(LikeVo likevo) throws Exception {
		dao.insertlike(likevo);
		
	}

	@Override
	public void deletelike(LikeVo likevo) throws Exception {
		// TODO Auto-generated method stub
		dao.deletelike(likevo);
	}

	@Override
	public List<LikeVo> listlike(LikeVo likevo) throws Exception {
		// TODO Auto-generated method stub
		return dao.listlike(likevo);
	}
	@Override
	public List<LikeVo> mylike(String id)throws Exception{
		return dao.mylike(id);
	}
	@Override
	public void countplus(LikeVo likevo)throws Exception{
		dao.countplus(likevo);
	}
	@Override
	public void countminus(LikeVo likevo)throws Exception{
		dao.countminus(likevo);
	}



	@Override
	public UserVo codi_usertb(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.codi_usertb(id);
	}

	@Override
	public CodiVo2 codi_coditb3(CodiVo codivo) throws Exception {
		// TODO Auto-generated method stub
		return dao.codi_coditb3(codivo);
	}

	@Override
	public List<ItemVo> codi_itemtb(CodiVo codivo) throws Exception {
		// TODO Auto-generated method stub
		return dao.codi_itemtb(codivo);
	}

	@Override
	public int codi_update(CodiVo codivo) throws Exception {
		// TODO Auto-generated method stub
		return dao.codi_update(codivo);
	}

	@Override
	public int codi_update2(CodiVo2 codivo2) throws Exception {
		// TODO Auto-generated method stub
		return dao.codi_update2(codivo2);
	}

	@Override
	public int codi_delete1(CodiVo codivo) throws Exception {
		// TODO Auto-generated method stub
		return dao.codi_delete1(codivo);
	}

	@Override
	public int codi_delete2(CodiVo codivo) throws Exception {
		// TODO Auto-generated method stub
		return dao.codi_delete2(codivo);
	}


	@Override
	public void codi_insert(CodiVo codivo) throws Exception {
		// TODO Auto-generated method stub
		  dao.codi_insert(codivo);
	}

	public List<ImageVo> codi_cloth(String category) throws Exception{
		return dao.codi_cloth(category);
	}

	@Override
	public List<CodiVo> test(CodiVo codivo) throws Exception {
		// TODO Auto-generated method stub
		return dao.test(codivo);
	}

	@Override
	public CodiVo codibno(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.codibno(id);
	}

	@Override
	public int codi_comment(CodiVo2 codivo2) throws Exception {
		// TODO Auto-generated method stub
		return dao.codi_comment(codivo2);
	}

	@Override
	public List<Sns_codiVo> sns_codi(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.sns_codi(id);
	}
	@Override
	public List<SnsVo> sns_list(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.sns_list(id);
	}

	@Override
	public int s_insert(SnsVo snsvo) throws Exception {
		// TODO Auto-generated method stub
		return dao.s_insert(snsvo);
	}

	@Override
	public int s_delete(Integer snsbno) throws Exception {
		// TODO Auto-generated method stub
		return dao.s_delete(snsbno);
	}

	@Override
	public int s_update(SnsVo snsvo) throws Exception {
		// TODO Auto-generated method stub
		return dao.s_update(snsvo);
	}

	@Override
	public SnsVo s_select(Integer snsbno) throws Exception {
		// TODO Auto-generated method stub
		return dao.s_select(snsbno);
	}
	@Override
	public void codilikeplus(LikeVo likevo)throws Exception{
		dao.codilikeplus(likevo);
	}
	@Override
	public void codilikeminus(LikeVo likevo)throws Exception{
		dao.codilikeminus(likevo);
	}
	
	@Override
	public List<CodiVo> codi_select(CodiVo codivo) throws Exception {
		// TODO Auto-generated method stub
		return dao.codi_select(codivo);
	}
	@Override
	public int codi_updateinsert(CodiVo codivo) throws Exception {
		// TODO Auto-generated method stub
		return dao.codi_updateinsert(codivo);
	}

	@Override
	public void update_delete(CodiVo codivo) throws Exception {
		// TODO Auto-generated method stub
		dao.update_delete(codivo);
	}
	public List<Sns_codiVo> search_sns() throws Exception{
		return dao.search_sns();
	}

}
