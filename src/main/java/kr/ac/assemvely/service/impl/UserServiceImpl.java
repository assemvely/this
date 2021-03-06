package kr.ac.assemvely.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.assemvely.dao.UserDao;
import kr.ac.assemvely.service.UserService;
import kr.ac.assemvely.vo.AddressVo;
import kr.ac.assemvely.vo.MileageVo;
import kr.ac.assemvely.vo.RelationVo;
import kr.ac.assemvely.vo.TempUserVo;
import kr.ac.assemvely.vo.UserDto;
import kr.ac.assemvely.vo.UserVo;

@Service
public class UserServiceImpl implements UserService
{
	
	@Inject
	private UserDao dao;
	
	

	@Override
	public void join(UserVo vo) throws Exception 
	{
		dao.join(vo);
		
	}

	@Override
	public void deleteuser(UserDto dto) throws Exception 
	{
		
		dao.deleteuser(dto);
	}
	@Override
	public UserVo user(String id) throws Exception{
		return dao.user(id);
	}
	@Override
	public List<UserVo> userlist()throws Exception{
		return dao.userlist();
	}
	@Override
	public List<UserVo> followerlist(String id) throws Exception 
	{
		
		return dao.followerlist(id);
	}
	@Override
	public List<UserVo> followinglist(String id)throws Exception{
		return dao.followinglist(id);
	}
	@Override
	public UserVo login(UserDto dto) throws Exception 
	{
		
		return dao.login(dto);
	}

	@Override
	public void sellerjoin(UserVo vo) throws Exception 
	{
		dao.sellerjoin(vo);
		
	}

	@Override
	public List<UserVo> templist() throws Exception 
	{
	
		return dao.templist();
	}

	@Override
	public TempUserVo selecttempuser(String id) throws Exception 
	{
		
		return dao.selecttempuser(id);
	}

	@Override
	public void deletetempuser(String id) throws Exception 
	{
		
		dao.deletetempuser(id);
	}

	@Override
	public void following(RelationVo rvo) throws Exception 
	{
		dao.following(rvo);
	}

	@Override
	public int followingcounter(String followingid) throws Exception 
	{
		
		return dao.followingcounter(followingid);
	
	}

	@Override
	public int followercounter(String followerid) throws Exception 
	{
		
		return dao.followercounter(followerid);
	}

	@Override
	public int sellercounter() throws Exception 
	{
		
		return dao.sellercounter();
	}

	@Override
	public int buyercounter() throws Exception 
	{
		
		return dao.buyercounter();
	}

	@Override
	public int already(RelationVo relation) throws Exception {
		 
		return dao.already(relation);
	}

	@Override
	public void unfollowed(RelationVo relation) throws Exception {
		 dao.unfollowed(relation);
		
	}


	@Override
	public void updateaddress(AddressVo avo) throws Exception 
	{
		dao.updateaddress(avo);
		
	}

	@Override
	public List<UserVo> searchuser(String id) throws Exception 
	{
		System.out.println("[ServiceImpl/searchuser()] id : " + id);
		return dao.searchuser(id);
	}

	@Override
	public void updatemileage(MileageVo mvo) throws Exception {
		
		dao.updatemileage(mvo);
		
	}
	@Override
	public UserVo mypage(String id)throws Exception{
		return dao.mypage(id);
	}
	@Override
	public List<UserVo> bybsm(String bsm)throws Exception{
		return dao.bybsm(bsm);
	}
	@Override
	public List<UserVo> usercount()throws Exception{
		return dao.usercount();
	}
	
	@Override
	public List<UserVo> brandgallery() throws Exception {
		return dao.brandgallery();
	}
}
