package kr.ac.assemvely.service;

import java.util.List;

import kr.ac.assemvely.vo.AddressVo;
import kr.ac.assemvely.vo.MileageVo;
import kr.ac.assemvely.vo.RelationVo;
import kr.ac.assemvely.vo.TempUserVo;
import kr.ac.assemvely.vo.UserDto;
import kr.ac.assemvely.vo.UserVo;

public interface UserService 
{
	
	public void sellerjoin(UserVo vo)throws Exception;
	
	public void join(UserVo vo)throws Exception;
	public List<UserVo> userlist()throws Exception;
	public List<UserVo> followerlist(String id)throws Exception;
	public List<UserVo> followinglist(String id)throws Exception;
	public UserVo login(UserDto dto)throws Exception;
	public UserVo user(String id)throws Exception;
	public List<UserVo> templist()throws Exception;
	public int already(RelationVo relation)throws Exception;
	public TempUserVo selecttempuser(String id)throws Exception;	
	public void unfollowed(RelationVo relation)throws Exception;
	public void deletetempuser(String id)throws Exception;
	
	public void following(RelationVo rvo) throws Exception; 
	
	public int followingcounter(String followingid)throws Exception;
	
	public int followercounter(String followerid)throws Exception;
	
	public int sellercounter()throws Exception;
	
	public int buyercounter()throws Exception;
	
	public void deleteuser(UserDto dto)throws Exception;
	

	public void updateaddress(AddressVo avo)throws Exception;
	
	public List<UserVo> searchuser(String id) throws Exception;
	
	public void updatemileage(MileageVo mvo)throws Exception;
	public UserVo mypage(String id)throws Exception;
	public List<UserVo> bybsm(String bsm)throws Exception;
	public List<UserVo> usercount()throws Exception;
	public List<UserVo> brandgallery() throws Exception;
}
