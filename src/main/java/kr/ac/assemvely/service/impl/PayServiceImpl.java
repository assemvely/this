package kr.ac.assemvely.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.assemvely.dao.PayDao;
import kr.ac.assemvely.service.PayService;
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

}
