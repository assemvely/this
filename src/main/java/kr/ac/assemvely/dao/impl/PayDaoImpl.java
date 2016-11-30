package kr.ac.assemvely.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ac.assemvely.dao.PayDao;
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

}
