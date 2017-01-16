package kr.ac.assemvely.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.assemvely.dao.ItemDao;
import kr.ac.assemvely.service.ItemService;
import kr.ac.assemvely.vo.CartVo;
import kr.ac.assemvely.vo.CodiVo2;
import kr.ac.assemvely.vo.Criteria;
import kr.ac.assemvely.vo.ItemInfoVo;
import kr.ac.assemvely.vo.ItemVo;
import kr.ac.assemvely.vo.NotifyVo;
import kr.ac.assemvely.vo.PayVo;

@Service
public class ItemServiceImpl implements ItemService {
	@Inject
	private ItemDao dao;

	@Override
	public List<ItemVo> listitem() throws Exception {
		return dao.listitem();
	}

	@Override
	public void insertitem(ItemVo vo) throws Exception {
		dao.insertitem(vo);

	}

	@Override
	public ItemVo readposting(int clothcode) {
	 
		return dao.readposting(clothcode);
	}

	@Override
	public ItemVo clothcode(String name) throws Exception {
		// TODO Auto-generated method stub
		return dao.clothcode(name);
	}

	@Override
	public void insertinfo(ItemInfoVo info) throws Exception {
		dao.insertinfo(info);
		
	}

	@Override
	public List<ItemInfoVo> readinfo(int clothcode) throws Exception {
	
		return dao.readinfo(clothcode);
	}
	


	@Override
	public List<ItemVo> newitem() throws Exception {
		return dao.newitem();
	}

	@Override
	//YG//public List<ItemVo> selectlittlecategory() throws Exception {
	public List<ItemVo> selectlittlecategory(String selectlittlecategory) throws Exception {
		return dao.selectlittlecategory(selectlittlecategory);
		//return dao.selectlittlecategory();
	}

	@Override
	public List<ItemVo> selectcategory(String selectcategory) throws Exception {
		return dao.selectcategory(selectcategory);
	}
	@Override
	public List<ItemVo> selectuser(String id) throws Exception{
		return dao.selectuser(id);
	}

	@Override
	public List<ItemVo> branditem(ItemVo vo) throws Exception {
		 
		return dao.branditem(vo);
	}
	
	

	@Override
	public ItemVo shoppeditem(Integer clothcode) throws Exception 
	{
		
		return dao.shoppeditem(clothcode);
	}

	@Override
	public List<ItemVo> selectcompanyitem(String id) 
	{
		
		return dao.selectcompanyitem(id);
	}

	@Override
	public List<ItemVo> searchitem(String name) throws Exception {
		
		//System.out.println("[ServiceImpl/searchitem()] name : " + name);
		return dao.searchitem(name);
	}

	@Override
	public List<CartVo> selectitemfromcart(String id) 
	{
	
		return dao.selectitemfromcart(id);
	}

	@Override
	public void deletefromcart(int clothcode) throws Exception {
		dao.deletefromcart(clothcode);
		
	}

	@Override
	public void insertintopaytb(PayVo pvo) throws Exception {
		dao.insertintopaytb(pvo);
		
	}

	@Override
	public List<ItemVo> selectitemfrompaytb(String id) throws Exception {
	
		return dao.selectitemfrompaytb(id);
	}

	@Override
	public void deletefrompay(String id) throws Exception {
	
			dao.deletefrompay(id);
		
	}
	@Override
	public void incart(CartVo vo)throws Exception{
		dao.incart(vo);
	}
	
	@Override
	public List<CartVo> cart(String id) throws Exception{
		return dao.cart(id);
	}
	
	@Override
	public CartVo userchoice(int cartbno){
		return dao.userchoice(cartbno);
	}
	@Override
	public void coloramount(CartVo cartvo){
		dao.coloramount(cartvo);
	}
	@Override
	public List<ItemVo> selectwithtempcode(int tempcode) throws Exception {
		
		return dao.selectwithtempcode(tempcode);
	}

	@Override
	public List<ItemVo> select_top_withtempcode(int tempcode) throws Exception {
		
		return dao.select_top_withtempcode(tempcode);
	}

	@Override
	public List<ItemVo> select_bottom_withtempcode(int tempcode) throws Exception {
		
		return dao.select_bottom_withtempcode(tempcode);
	}

	@Override
	public List<ItemVo> select_outer_withtempcode(int tempcode) throws Exception {
		
		return dao.select_outer_withtempcode(tempcode);
	}

	@Override
	public List<ItemVo> select_shoes_withtempcode(int tempcode) throws Exception {
		
		return dao.select_shoes_withtempcode(tempcode);
	}

	@Override
	public List<ItemVo> select_bag_withtempcode(int tempcode) throws Exception {
		
		return dao.select_bag_withtempcode(tempcode);
	}

	@Override
	public List<ItemVo> item_list_page(Criteria cri) throws Exception {
		
		return dao.item_list_page(cri);
	}

	@Override
	public int countitem(Criteria cri) throws Exception {

		return dao.countitem(cri);
	}
	

	@Override
	public int countitem() throws Exception {
		return dao.countitem();
	}

	@Override
	public int countcodi() throws Exception {
		return dao.countcodi();
	}
	@Override
	public List<CodiVo2> bestcodi() throws Exception{
		return dao.bestcodi();
	}
	@Override
	public List<NotifyVo> notifymessage(NotifyVo vo ) throws Exception{
		return dao.notifymessage(vo);
	}	
	@Override
	public void insertnotify(NotifyVo vo)throws Exception{
		dao.insertnotify(vo);
	}
	@Override
	public void insertcodilikenotify(NotifyVo vo)throws Exception{
		dao.insertcodilikenotify(vo);
	}
	@Override
	public void insertboardnotify(NotifyVo vo)throws Exception{
		dao.insertboardnotify(vo);
	}
	@Override
	public void insertusernotify(NotifyVo vo)throws Exception{
		dao.insertusernotify(vo);
	}
	@Override
	public List<NotifyVo> getnotify(String id)throws Exception{
		return dao.getnotify(id);
	}
}
