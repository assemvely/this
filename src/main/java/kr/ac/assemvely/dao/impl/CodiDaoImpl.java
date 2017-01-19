package kr.ac.assemvely.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ac.assemvely.dao.CodiDao;
import kr.ac.assemvely.vo.CodiVo;
import kr.ac.assemvely.vo.CodiandwritedateVo;
import kr.ac.assemvely.vo.CodicommentVo;
import kr.ac.assemvely.vo.CodiimgVo;

@Repository
public class CodiDaoImpl implements CodiDao
{
	@Inject
	private SqlSession session;
	
	private final String namespace="kr.ac.assemvely.mapper.CodiMapper";
	
	
	
	@Override
	public void new_codi_save(CodiVo vo) throws Exception 
	{
		session.insert(namespace+".new_codi_save", vo);
		
	}



	@Override
	public void new_codi_comment(CodicommentVo vo) throws Exception 
	{
		
		session.insert(namespace+".new_codi_comment", vo);
	}



	@Override
	public void new_codi_img(CodiimgVo vo) throws Exception 
	{
		session.insert(namespace+".new_codi_img", vo);
		
	}



	@Override
	public List<CodiimgVo> select_recent_codi() throws Exception 
	{
		
		return session.selectList(namespace+".select_recent_codi");
	}



	@Override
	public List<CodiimgVo> select_my_codi_list(String id) throws Exception 
	{
		return session.selectList(namespace+".select_my_codi_list", id);
	}



	@Override
	public List<CodiVo> modify_item_list(CodiVo vo) throws Exception 
	{
		
		return session.selectList(namespace+".modify_item_list", vo);
	}



	@Override
	public List<CodiVo> select_codi_list_by_writedate(CodiandwritedateVo vo) throws Exception 
	{
		
		return session.selectList(namespace+".select_codi_list_by_writedate", vo);
	}
	
}
