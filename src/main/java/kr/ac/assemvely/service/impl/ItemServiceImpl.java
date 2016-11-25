package kr.ac.assemvely.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.assemvely.dao.ItemDao;
import kr.ac.assemvely.service.ItemService;
import kr.ac.assemvely.vo.ItemInfoVo;
import kr.ac.assemvely.vo.ItemVo;

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
	public ItemVo readposting(String clothcode) {
	 
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
	public List<ItemInfoVo> readinfo(String clothcode) throws Exception {
	
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
}
