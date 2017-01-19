package kr.ac.assemvely.service;

import java.util.List;

import kr.ac.assemvely.vo.CartVo;
import kr.ac.assemvely.vo.CodiVo2;
import kr.ac.assemvely.vo.Criteria;
import kr.ac.assemvely.vo.ItemInfoVo;
import kr.ac.assemvely.vo.ItemVo;
import kr.ac.assemvely.vo.NotifyVo;
import kr.ac.assemvely.vo.PayVo;
import kr.ac.assemvely.vo.Tempcodeandcolorcode;

public interface ItemService {
	public List<ItemVo> listitem() throws Exception;

	public void insertitem(ItemVo vo) throws Exception;
	public ItemVo readposting(int clothcode);
	public ItemVo clothcode(String name) throws Exception;
	public void insertinfo(ItemInfoVo info) throws Exception;
	public List<ItemInfoVo> readinfo(int clothcode)throws Exception;
	  
	
	//YG//public List<ItemVo> selectlittlecategory() throws Exception;
	public List<ItemVo> selectlittlecategory(String selectlittlecategory) throws Exception;
	public List<ItemVo> selectcategory(String selectcategory) throws Exception;
	
 
	
	public List<ItemVo> newitem() throws Exception;
	public List<ItemVo> selectuser(String id) throws Exception;
	public List<ItemVo> branditem(ItemVo vo) throws Exception;
	

	public ItemVo shoppeditem(Integer clothcode) throws Exception;
	
	public List<ItemVo> selectcompanyitem(String id);
	
	public List<ItemVo> searchitem(String name) throws Exception;
	
	
	public List<CartVo> selectitemfromcart(String id);
	
	public void deletefromcart(int clothcode)throws Exception;
	
	public void insertintopaytb(PayVo pvo) throws Exception;
	
	public List<ItemVo> selectitemfrompaytb (String id) throws Exception;
	
	public void deletefrompay(String id)throws Exception;
	public void incart(CartVo vo)throws Exception;
 
	public List<CartVo> cart(String id) throws Exception ;
	public CartVo userchoice(int cartbno);
	public void coloramount(CartVo cartvo);
public List<ItemVo> selectwithtempcode (int tempcode) throws Exception;
	
	public List<ItemVo> select_top_withtempcode (int tempcode) throws Exception;
	
	public List<ItemVo> select_bottom_withtempcode (int tempcode) throws Exception;
	
	public List<ItemVo> select_outer_withtempcode (int tempcode) throws Exception;
	
	public List<ItemVo> select_shoes_withtempcode (int tempcode) throws Exception;
	
	public List<ItemVo> select_bag_withtempcode (int tempcode) throws Exception;
	
	public List<ItemVo> item_list_page (Criteria cri) throws Exception;
	
	public int countitem (Criteria cri) throws Exception;
	
	public int countcodi() throws Exception;
	public int countitem() throws Exception;
	public List<CodiVo2> bestcodi() throws Exception;
	public List<NotifyVo> notifymessage(NotifyVo vo ) throws Exception;
	public void insertnotify(NotifyVo vo)throws Exception;
	public void insertcodilikenotify(NotifyVo vo)throws Exception;
	public void insertboardnotify(NotifyVo vo)throws Exception;
	public void insertusernotify(NotifyVo vo)throws Exception;
	public List<NotifyVo> getnotify(String id)throws Exception;
	public void changeonoff(int notifybno)throws Exception;
	
public List<ItemVo> select_bottom_withtempcode_and_colorcode (Tempcodeandcolorcode tempcodeandcolorcode) throws Exception;
	
	public List<ItemVo> select_outer_withtempcode_and_colorcode (Tempcodeandcolorcode tempcodeandcolorcode) throws Exception;
	
	public List<ItemVo> select_shoes_withtempcode_and_colorcode (Tempcodeandcolorcode tempcodeandcolorcode) throws Exception;
	
	public List<ItemVo> select_bag_withtempcode_and_colorcode (Tempcodeandcolorcode tempcodeandcolorcode) throws Exception;

	public String todayscomment (String colorcode) throws Exception;
	
	
}
	
 
