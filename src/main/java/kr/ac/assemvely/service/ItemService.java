package kr.ac.assemvely.service;

import java.util.List;

import kr.ac.assemvely.vo.ItemInfoVo;
import kr.ac.assemvely.vo.ItemVo;

public interface ItemService {
	public List<ItemVo> listitem() throws Exception;

	public void insertitem(ItemVo vo) throws Exception;
	public ItemVo readposting(String clothcode);
	public ItemVo clothcode(String name) throws Exception;
	public void insertinfo(ItemInfoVo info) throws Exception;
	public List<ItemInfoVo> readinfo(String clothcode)throws Exception;
	  
	
	//YG//public List<ItemVo> selectlittlecategory() throws Exception;
	public List<ItemVo> selectlittlecategory(String selectlittlecategory) throws Exception;
	public List<ItemVo> selectcategory(String selectcategory) throws Exception;
	
 
	
	public List<ItemVo> newitem() throws Exception;
	public List<ItemVo> selectuser(String id) throws Exception;
	public List<ItemVo> branditem(ItemVo vo) throws Exception;
	
}

