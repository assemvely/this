package kr.ac.assemvely.service;

import java.util.List;

import kr.ac.assemvely.vo.PayVo;

public interface PayService 
{
	public List<PayVo> shoppinglist(String id)throws Exception;
}
