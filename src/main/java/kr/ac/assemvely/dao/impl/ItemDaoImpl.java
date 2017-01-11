package kr.ac.assemvely.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ac.assemvely.dao.ItemDao;
import kr.ac.assemvely.vo.CartVo;
import kr.ac.assemvely.vo.Criteria;
import kr.ac.assemvely.vo.ItemInfoVo;
import kr.ac.assemvely.vo.ItemVo;
import kr.ac.assemvely.vo.PayVo;

@Repository
public class ItemDaoImpl implements ItemDao {

	@Inject
	private SqlSession SqlSession;

	private static final String namespace = "kr.ac.assemvely.mapper.ItemMapper";

	@Override
	public void insertitem(ItemVo itemvo) {

		SqlSession.insert(namespace + ".insertitem", itemvo);
		 
	}

	@Override
	public List<ItemVo> listitem() {
		return SqlSession.selectList(namespace + ".selectitem");
	}

	@Override
	public ItemVo readposting(int clothcode) {
		 
		return  SqlSession.selectOne(namespace+".selectone",clothcode);
	}
	@Override
	public ItemVo clothcode(String name) throws Exception {
		// TODO Auto-generated method stub
		return SqlSession.selectOne(namespace+".select",name);
		
	}

	@Override
	public void insertinfo(ItemInfoVo info) throws Exception {
		
		SqlSession.insert(namespace+".insertinfo",info);
		
	}
	
	@Override
	public List<ItemInfoVo> readinfo(int clothcode)throws Exception{
		return SqlSession.selectList(namespace+".read",clothcode);
	}
	 
	@Override
	public List<ItemVo> newitem() {
		return SqlSession.selectList(namespace+ ".newitem");
	}

	@Override
	//YG//public List<ItemVo> selectlittlecategory() {
	public List<ItemVo> selectlittlecategory(String selectlittlecategory) {
				
		//YG//return SqlSession.selectList(namespace+".selectlittlecategory");
		return SqlSession.selectList(namespace+".selectlittlecategory", selectlittlecategory);
	}

	@Override
	public List<ItemVo> selectcategory(String selectcategory) {
		return SqlSession.selectList(namespace+".selectcategory",selectcategory);
	}

	@Override
	public List<ItemVo> selectuser(String id){
		return SqlSession.selectList(namespace+".selectuser",id);
		
		
	}
	
	@Override
	public List<ItemVo> branditem(ItemVo vo){
		return SqlSession.selectList(namespace+".branditem",vo);
	}
	

	@Override
	public ItemVo shoppeditem(Integer clothcode) throws Exception 
	{
		
		return SqlSession.selectOne(namespace+".shoppeditem", clothcode);
	}

	@Override
	public List<ItemVo> selectcompanyitem(String id) 
	{
		
		return SqlSession.selectList(namespace+".selectcompanyitem", id);
	}

	@Override
	public List<ItemVo> searchitem(String name) throws Exception {
		
		return SqlSession.selectList(namespace+".searchitem", name);
	}

	@Override
	public List<CartVo> selectitemfromcart(String id) 
	{
		
		return SqlSession.selectList(namespace+".selectitemfromcart", id);
	}

	@Override
	public void deletefromcart(int clothcode) throws Exception {
		SqlSession.delete(namespace+".deletefromcart", clothcode);
		
	}

	@Override
	public void insertintopaytb(PayVo pvo) throws Exception {
		SqlSession.insert(namespace+".insertintopaytb", pvo);
		
	}

	@Override
	public List<ItemVo> selectitemfrompaytb(String id) throws Exception {
		// TODO Auto-generated method stub
		return SqlSession.selectList(namespace+".selectitemfrompaytb", id);
	}

	@Override
	public void deletefrompay(String id) throws Exception {
		SqlSession.delete(namespace+".deletefrompay", id);
		
	}
	@Override
	public void incart(CartVo vo)throws Exception{
		SqlSession.insert(namespace+".incart",vo);
	}
	@Override
	public List<CartVo> cart(String id) throws Exception{
		return SqlSession.selectList(namespace+".cartlist",id);
	}
	@Override
	public CartVo userchoice(int cartbno){
		return SqlSession.selectOne(namespace+".userchoice",cartbno);
	}
	@Override
	public void coloramount(CartVo cartvo){
		SqlSession.update(namespace+".coloramount",cartvo);
	}
	@Override
	public List<ItemVo> selectwithtempcode(int tempcode) throws Exception {
		
		return SqlSession.selectList(namespace+".selectwithtempcode", tempcode);
	}

	@Override
	public List<ItemVo> select_top_withtempcode(int tempcode) throws Exception {
		
		return SqlSession.selectList(namespace+".select_top_withtempcode", tempcode);
	}

	@Override
	public List<ItemVo> select_bottom_withtempcode(int tempcode) throws Exception {
		
		return SqlSession.selectList(namespace+".select_bottom_withtempcode", tempcode);
	}

	@Override
	public List<ItemVo> select_outer_withtempcode(int tempcode) throws Exception {
		
		return SqlSession.selectList(namespace+".select_outer_withtempcode", tempcode);
	}

	@Override
	public List<ItemVo> select_shoes_withtempcode(int tempcode) throws Exception {
		
		return SqlSession.selectList(namespace+".select_shoes_withtempcode", tempcode);
	}

	@Override
	public List<ItemVo> select_bag_withtempcode(int tempcode) throws Exception {
		
		return SqlSession.selectList(namespace+".select_bag_withtempcode", tempcode);
	}

	@Override
	public List<ItemVo> item_list_page(Criteria cri) throws Exception {
	
		return SqlSession.selectList(namespace+".item_list_page", cri);
	}

	@Override
	public int countitem(Criteria cri) throws Exception {
		
		return SqlSession.selectOne(namespace+".countitem", cri);
	
	}
}