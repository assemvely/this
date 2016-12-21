package kr.ac.assemvely.dao;

import java.util.List;
import java.util.Map;


 
import kr.ac.assemvely.vo.SnsVo;

 

public interface SnsDao {
	public List<SnsVo> list(String id) throws Exception;
	public List<SnsVo> listall(String id) throws Exception;
	public SnsVo read(int snsbno)throws Exception;
//	public List<mobilevo> profile(String id) throws Exception;
//	public UserVo mypage(String id) throws Exception;
//	public List<ShoppingVo> myshopping(String id) throws Exception;
//	public List<ItemVo> item(Map map) throws Exception;
//	
//	public List<UserVo> following(String id) throws Exception;
//	public List<UserVo> follower(String id) throws Exception;
	

	
//	public List<SnsVo> sns_list(String id) throws Exception;
//	public int s_insert(SnsVo snsvo) throws Exception;
//	public int s_delete(Integer snsbno) throws Exception;
//	public int s_update(SnsVo snsvo) throws Exception;
//	public SnsVo s_select(Integer snsbno) throws Exception;
	


}
