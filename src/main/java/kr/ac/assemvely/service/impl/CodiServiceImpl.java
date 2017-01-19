package kr.ac.assemvely.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.assemvely.dao.CodiDao;

import kr.ac.assemvely.service.CodiService;
import kr.ac.assemvely.vo.CodiVo;
import kr.ac.assemvely.vo.CodiandwritedateVo;
import kr.ac.assemvely.vo.CodicommentVo;
import kr.ac.assemvely.vo.CodiimgVo;

@Service
public class CodiServiceImpl implements CodiService
{

	@Inject
	private CodiDao dao;
	
	@Override
	public void new_codi_save(CodiVo vo) throws Exception 
	{
		dao.new_codi_save(vo);		
	}

	@Override
	public void new_codi_comment(CodicommentVo vo) throws Exception 
	{
		dao.new_codi_comment(vo);
		
	}

	@Override
	public void new_codi_img(CodiimgVo vo) throws Exception 
	{
		dao.new_codi_img(vo);
		
	}

	@Override
	public List<CodiimgVo> select_recent_codi() throws Exception 
	{
		
		return dao.select_recent_codi();
	}

	@Override
	public List<CodiimgVo> select_my_codi_list(String id) throws Exception 
	{
		
		return dao.select_my_codi_list(id);
	}

	@Override
	public List<CodiVo> modify_item_list(CodiVo vo) throws Exception 
	{
		return dao.modify_item_list(vo);
	}

	@Override
	public List<CodiVo> select_codi_list_by_writedate(CodiandwritedateVo vo) throws Exception 
	{
		
		return dao.select_codi_list_by_writedate(vo);
	}

}
