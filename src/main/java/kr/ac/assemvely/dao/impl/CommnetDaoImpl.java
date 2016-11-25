package kr.ac.assemvely.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ac.assemvely.dao.CommentDao;
import kr.ac.assemvely.vo.CommentVo;
import kr.ac.assemvely.vo.UserVo;

@Repository
public class CommnetDaoImpl implements CommentDao {

	public final String namespace="kr.ac.assemvely.comment";
	
	@Inject
	SqlSession session;

	@Override
	public List<CommentVo> c_list(CommentVo commentvo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".c_list",commentvo);
	}

	@Override
	public int c_insert(CommentVo commentvo) throws Exception {
		// TODO Auto-generated method stub
		return session.insert(namespace+".c_insert",commentvo);
	}

	@Override
	public int c_delete(Integer c_bno) throws Exception {
		// TODO Auto-generated method stub
		return session.delete(namespace+".c_delete",c_bno);
	}

	@Override
	public List<UserVo> c_list_img(CommentVo commentvo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".c_list_img",commentvo);
	}
	

}