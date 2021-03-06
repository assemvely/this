package kr.ac.assemvely.service;

import java.util.List;

import kr.ac.assemvely.vo.ItemVo;
import kr.ac.assemvely.vo.PayVo;

public interface PayService 
{
	public List<PayVo> shoppinglist(String id)throws Exception;
	public List<PayVo> bestbrand()throws Exception;
	public List<ItemVo> bestItem()throws Exception;
	public List<PayVo> weeklymybuyer(String id)throws Exception;
	public List<ItemVo> mybestitem(String id)throws Exception;
}
