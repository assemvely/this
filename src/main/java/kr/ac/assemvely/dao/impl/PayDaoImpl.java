package kr.ac.assemvely.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ac.assemvely.dao.PayDao;
import kr.ac.assemvely.vo.ItemVo;
import kr.ac.assemvely.vo.PayVo;

@Repository
public class PayDaoImpl implements PayDao
{
	
	@Inject
	private SqlSession session;
	
	private final String namespace="kr.ac.assemvely.mapper.PayMapper";

	@Override
	public List<PayVo> shoppinglist(String id) throws Exception 
	{
		
		return session.selectList(namespace+".shoppinglist", id);
	}

	@Override
	public List<PayVo> bestbrand()throws Exception{
		return session.selectList(namespace+".bestbrand");
	}
	@Override
	public List<ItemVo> bestItem()throws Exception{
		return session.selectList(namespace+".bestitem");
	}
	@Override
	public List<PayVo> weeklymybuyer(String id)throws Exception{
		List<PayVo> vo=new ArrayList<PayVo>();
		vo.add(session.selectOne(namespace+".weeklymybuyer",id));
		vo.add(session.selectOne(namespace+".secondweek",id));
		vo.add(session.selectOne(namespace+".thirdweek",id));
		vo.add(session.selectOne(namespace+".lastweek",id));
		
		return vo;
	}
	@Override
	public List<ItemVo> mybestitem(String id)throws Exception{
		return session.selectList(namespace+".mybestitem",id);
	}
}
