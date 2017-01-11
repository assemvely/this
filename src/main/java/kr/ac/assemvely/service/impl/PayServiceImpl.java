package kr.ac.assemvely.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.assemvely.dao.PayDao;
import kr.ac.assemvely.service.PayService;
import kr.ac.assemvely.vo.ItemVo;
import kr.ac.assemvely.vo.PayVo;

@Service
public class PayServiceImpl implements PayService
{
	@Inject
	private PayDao dao;
	
	@Override
	public List<PayVo> shoppinglist(String id) throws Exception 
	{
		
		return dao.shoppinglist(id);
	}
	@Override
	public List<PayVo> bestbrand()throws Exception{
		return dao.bestbrand();
	}
	@Override
	public List<ItemVo> bestItem()throws Exception{
		return dao.bestItem();
	}
	@Override
	public List<PayVo> weeklymybuyer(String id)throws Exception{
		return dao.weeklymybuyer(id);
	}
	@Override
	public List<ItemVo> mybestitem(String id)throws Exception{
		return dao.mybestitem(id);
	}
}
