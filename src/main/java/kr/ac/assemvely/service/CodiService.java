package kr.ac.assemvely.service;

import java.util.List;

import kr.ac.assemvely.vo.CodiVo;
import kr.ac.assemvely.vo.CodiandwritedateVo;
import kr.ac.assemvely.vo.CodicommentVo;
import kr.ac.assemvely.vo.CodiimgVo;

public interface CodiService 
{
	public void new_codi_save(CodiVo vo)throws Exception;
	
	public void new_codi_comment(CodicommentVo vo)throws Exception;
	
	public void new_codi_img(CodiimgVo vo)throws Exception;
	
	public List<CodiimgVo> select_recent_codi()throws Exception;
	
	public List<CodiimgVo> select_my_codi_list(String id)throws Exception;
	
	public List<CodiVo> modify_item_list(CodiVo vo)throws Exception;

	public List<CodiVo> select_codi_list_by_writedate(CodiandwritedateVo vo)throws Exception;
}


