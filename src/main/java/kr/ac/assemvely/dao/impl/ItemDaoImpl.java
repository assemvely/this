package kr.ac.assemvely.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ac.assemvely.dao.ItemDao;
import kr.ac.assemvely.vo.ItemInfoVo;
import kr.ac.assemvely.vo.ItemVo;

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
	public ItemVo readposting(String clothcode) {
		 
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
	public List<ItemInfoVo> readinfo(String clothcode)throws Exception{
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
}