package kr.ac.assemvely.dao;

import java.util.List;

import kr.ac.assemvely.vo.ItemInfoVo;
import kr.ac.assemvely.vo.ItemVo;

public interface ItemDao {

	public List<ItemVo> listitem();

	public void insertitem(ItemVo itemvo);
	public ItemVo readposting(String clothcode);

	public ItemVo clothcode(String name) throws Exception;
	public void insertinfo(ItemInfoVo info) throws Exception;
	public List<ItemInfoVo> readinfo(String clothcode)throws Exception;
 
public List<ItemVo> newitem();
	//YG//public List<ItemVo> selectlittlecategory();
	public List<ItemVo> selectlittlecategory(String selectlittlecategory);
	public List<ItemVo> selectcategory(String selectcategory);
 
 
	public List<ItemVo> selectuser(String id);
	public List<ItemVo> branditem(ItemVo vo);

}
