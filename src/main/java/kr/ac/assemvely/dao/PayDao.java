package kr.ac.assemvely.dao;

import java.util.List;

import kr.ac.assemvely.vo.PayVo;



public interface PayDao 
{
	public List<PayVo> shoppinglist(String id)throws Exception;
}
