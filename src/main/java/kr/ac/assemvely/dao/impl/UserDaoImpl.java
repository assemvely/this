package kr.ac.assemvely.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ac.assemvely.dao.UserDao;
import kr.ac.assemvely.vo.AddressVo;
import kr.ac.assemvely.vo.CartVo;
import kr.ac.assemvely.vo.MileageVo;
import kr.ac.assemvely.vo.RelationVo;
import kr.ac.assemvely.vo.TempUserVo;
import kr.ac.assemvely.vo.UserDto;
import kr.ac.assemvely.vo.UserVo;
@Repository
public class UserDaoImpl implements UserDao
{
	@Inject
	private SqlSession session;
	
	private final String namespace="kr.ac.assemvely.mapper.UserMapper";
	


	@Override
	public void deleteuser(UserDto dto) throws Exception 
	{
		
		session.delete(namespace+".deleteuser", dto);
		
	}

	@Override
	public void deletetempuser(String id) throws Exception 
	{
		session.delete(namespace+".deletetempuser", id);
	
	}
	@Override
	public UserVo user(String id)throws Exception{
		return session.selectOne(namespace+".userone",id);
	}
	
	@Override
	public List<UserVo> userlist()throws Exception{
		return session.selectList(namespace+".userlist");
	}
	
	@Override
	public List<UserVo> followerlist(String id) throws Exception 
	{
		
		return session.selectList(namespace+".followerlist",id);
	}
	@Override
	public List<UserVo> followinglist(String id)throws Exception{
		return session.selectList(namespace+".followinglist",id);
	}
	@Override
	public UserVo login(UserDto dto) throws Exception 
	{
		
		return session.selectOne(namespace+".login", dto);	
	}




	@Override
	public List<UserVo> templist() throws Exception 
	{
		
		return session.selectList(namespace+".templist");
	}




	@Override
	public TempUserVo selecttempuser(String id) throws Exception 
	{
		
		return session.selectOne(namespace+".selecttempuser", id);
	}

	@Override
	public void join(UserVo vo) throws Exception 
	{
		session.insert(namespace+".join", vo);
		
	}

	@Override
	public void sellerjoin(UserVo vo) throws Exception 
	{
		session.insert(namespace+".sellerjoin", vo);
		
	}

	@Override
	public void following(RelationVo rvo) throws Exception 
	{
		session.insert(namespace+".following", rvo);
		
	}

	@Override
	public int followingcounter(String followingid) throws Exception 
	{
		
		return session.selectOne(namespace+".followingcounter", followingid);
	}

	@Override
	public int followercounter(String followerid) throws Exception 
	{
		
		return session.selectOne(namespace+".followercounter", followerid);
	}

	@Override
	public int sellercounter() throws Exception 
	{	
		return session.selectOne(namespace+".sellercounter");
	}

	@Override
	public int buyercounter() throws Exception {
		
		return session.selectOne(namespace+".buyercounter");
	}

	@Override
	public int already(RelationVo relation) throws Exception {
		 
		return session.selectOne(namespace+".already",relation);
	}


	@Override
	public void unfollowed(RelationVo relation)throws Exception{
		session.selectOne(namespace+".unfollowed",relation);
	}


	@Override
	public void updateaddress(AddressVo avo) throws Exception 
	{
		session.update(namespace+".updateaddress", avo);
		
	}

	@Override
	public List<UserVo> searchuser(String id) throws Exception 
	{
		
		return session.selectList(namespace+".searchuser", id);
	}

	@Override
	public void updatemileage(MileageVo mvo) throws Exception {
		
		session.update(namespace+".updatemileage", mvo);
		
	}
	@Override
	public UserVo mypage(String id)throws Exception{
		return session.selectOne(namespace+".mypage",id);
		
	}
	@Override
	public List<UserVo> bybsm(String bsm)throws Exception{
		return session.selectList(namespace+".bybsm",bsm);
	}
	@Override
	public List<UserVo> usercount()throws Exception{
		return session.selectList(namespace+".usercount");
	}
	@Override
	public List<UserVo> brandgallery() {
		return session.selectList(namespace+".brandgallery");
	}
	

}
